
Option Explicit

' =========================== module 2
' CONFIG
' user C:\Users\williamt\Desktop
' dev Utilities\Outlook VBA
' ===========================
Private Const RULES_CSV_PATH As String = "C:\Users\%USERNAME%\Desktop\OutlookRulesSummary.csv"
Private Const LOG_CSV_PATH   As String = "C:\Users\%USERNAME%\Desktop\ManualMove_Audit.csv"
Private Const DRY_RUN        As Boolean = False  ' set False to actually move

' Scope / throttles
Private Const ONLY_UNREAD        As Boolean = False
Private Const DAYS_BACK          As Long = 60
Private Const MAX_ITEMS          As Long = 500
Private Const INCLUDE_SUBFOLDERS As Boolean = False

' ===========================
' ENTRY POINT
' ===========================
Public Sub ProcessInboxUsingRules()
    On Error GoTo EH

    Dim rulesPath As String, logPath As String
    rulesPath = ExpandEnv(RULES_CSV_PATH)
    logPath = ExpandEnv(LOG_CSV_PATH)

    ' Load rules maps
    Dim subjectToFolder As Object, fromNameToFolder As Object
    Dim fromAddressToFolder As Object            ' --- ADDED ---
    Set subjectToFolder = CreateObject("Scripting.Dictionary")
    Set fromNameToFolder = CreateObject("Scripting.Dictionary")
    Set fromAddressToFolder = CreateObject("Scripting.Dictionary")  ' --- ADDED ---

    LoadRulesCsv rulesPath, subjectToFolder, fromNameToFolder, fromAddressToFolder  ' --- CHANGED ---

    ' Collect items to process
    Dim toProcess As Collection
    Set toProcess = New Collection
    CollectInboxItems toProcess

    ' Prepare logger
    EnsureLogHeader logPath

    Dim i As Long, movedCount As Long, skippedCount As Long
    Dim startTick As Single: startTick = Timer

    For i = 1 To toProcess.Count
        If MAX_ITEMS > 0 And i > MAX_ITEMS Then Exit For

        Dim mail As Outlook.MailItem
        Set mail = toProcess(i)

        Dim destPath As String, hitType As String, hitValue As String
        DecideDestination mail, subjectToFolder, fromNameToFolder, fromAddressToFolder, _
                        destPath, hitType, hitValue

        If Len(destPath) > 0 Then
            If DRY_RUN Then
                Debug.Print "[DRY] " & mail.Subject & " --> " & destPath & " (" & hitType & ": " & hitValue & ")"
            Else
                Dim destFolder As Outlook.MAPIFolder
                Set destFolder = GetOrCreateFolderByPath(destPath)
                If Not destFolder Is Nothing Then
                    mail.Move destFolder
                    movedCount = movedCount + 1
                Else
                    skippedCount = skippedCount + 1
                    Debug.Print "Skip (folder not found/created): " & destPath & " | " & mail.Subject
                End If
            End If
            LogMove logPath, mail, destPath, hitType, hitValue, DRY_RUN
        Else
            skippedCount = skippedCount + 1
            LogMove logPath, mail, "", "NoMatch", "", DRY_RUN
        End If

        ' Yield occasionally to keep Outlook responsive
        If i Mod 100 = 0 Then DoEvents
    Next i

    Dim elapsed As Single: elapsed = Timer - startTick
    MsgBox "Processed: " & (i - 1) & vbCrLf & _
           "Moved: " & movedCount & vbCrLf & _
           "Skipped: " & skippedCount & vbCrLf & _
           "Elapsed (sec): " & Format$(elapsed, "0.0") & vbCrLf & _
           IIf(DRY_RUN, "(Dry run—no items were moved)", ""), _
           vbInformation, "Inbox Processing (Rules)"
    Exit Sub

EH:
    MsgBox "Error " & Err.Number & ": " & Err.Description, vbExclamation, "ProcessInboxUsingRules"
End Sub

' ===========================
' COLLECTOR (Inbox / subfolders)
' ===========================
Private Sub CollectInboxItems(ByRef bucket As Collection)
    Dim inbox As Outlook.MAPIFolder
    Set inbox = Application.Session.GetDefaultFolder(olFolderInbox)

    ' Collect in Inbox
    CollectFolderItems inbox, bucket

    ' Optionally collect subfolders
    If INCLUDE_SUBFOLDERS Then
        Dim f As Outlook.MAPIFolder
        For Each f In inbox.Folders
            CollectFolderItems f, bucket
        Next f
    End If
End Sub

Private Sub CollectFolderItems(ByVal fld As Outlook.MAPIFolder, ByRef bucket As Collection)
    On Error GoTo EH

    Dim itms As Outlook.items
    Set itms = fld.items

    ' Build restriction
    Dim filterParts As Collection: Set filterParts = New Collection
    If ONLY_UNREAD Then filterParts.add "[Unread] = True"
    If DAYS_BACK > 0 Then
        Dim dt As Date: dt = Now - DAYS_BACK
        ' Restrict uses US format for dates in DASL
        filterParts.add "[ReceivedTime] >= '" & Format$(dt, "mm/dd/yyyy hh:nn") & "'"
    End If

    Dim filter As String
    Dim p As Variant
    For Each p In filterParts
        If Len(filter) = 0 Then
            filter = CStr(p)
        Else
            filter = filter & " AND " & CStr(p)
        End If
    Next p

    Dim view As Outlook.items
    If Len(filter) > 0 Then
        Set view = itms.Restrict(filter)
    Else
        Set view = itms
    End If

    ' Iterate
    Dim i As Long
    For i = 1 To view.Count
        Dim obj As Object
        Set obj = view.Item(i)
        If TypeName(obj) = "MailItem" Then
            bucket.add obj
        End If
    Next i
    Exit Sub

EH:
    ' Non-mail folders or permission issues are skipped gracefully
End Sub

' ===========================
' RULES LOADER
' ===========================
Private Sub LoadRulesCsv(ByVal csvPath As String, _
                         ByRef subjectToFolder As Object, _
                         ByRef fromNameToFolder As Object, _
                         ByRef fromAddressToFolder As Object)   ' --- CHANGED ---
    On Error GoTo EH

    Dim fso As Object, ts As Object
    Set fso = CreateObject("Scripting.FileSystemObject")
    If Not fso.FileExists(csvPath) Then
        Err.Raise vbObjectError + 2000, "LoadRulesCsv", "Rules CSV not found: " & csvPath
    End If

    Set ts = fso.OpenTextFile(csvPath, 1) ' ForReading
    Dim header As String
    If Not ts.AtEndOfStream Then header = ts.ReadLine

    ' Expected columns:
    ' Rule Name,Enabled,Subject trigger (SubjectWords),From trigger (FromNames),Target folder[,From Addresses]
    Do While Not ts.AtEndOfStream
        Dim line As String: line = ts.ReadLine
        Dim cols() As String: cols = ParseCsvLine(line)

        If UBound(cols) >= 4 Then
            Dim ruleName As String, enabledText As String
            Dim subjectWords As String, fromNames As String, targetFolder As String
            Dim fromAddresses As String  ' --- ADDED ---

            ruleName = Trim$(cols(0))
            enabledText = Trim$(cols(1))
            subjectWords = Trim$(cols(2))
            fromNames = Trim$(cols(3))
            targetFolder = NormalizeFolderPath(Trim$(cols(4)))
            If UBound(cols) >= 5 Then fromAddresses = Trim$(cols(5))   ' --- ADDED ---

            If LCase$(enabledText) = "true" And Len(targetFolder) > 0 Then
                ' Subject tokens (semicolon-delimited supported)
                If Len(subjectWords) > 0 Then
                    Dim sw() As String, j As Long
                    sw = Split(subjectWords, ";")
                    For j = LBound(sw) To UBound(sw)
                        Dim token As String: token = Trim$(sw(j))
                        If Len(token) > 0 Then
                            If Not subjectToFolder.Exists(LCase$(token)) Then
                                subjectToFolder.add LCase$(token), targetFolder
                            End If
                        End If
                    Next j
                End If

                ' From names (semicolon-delimited supported)
                If Len(fromNames) > 0 Then
                    Dim fn() As String, k As Long
                    fn = Split(fromNames, ";")
                    For k = LBound(fn) To UBound(fn)
                        Dim nm As String: nm = Trim$(fn(k))
                        If Len(nm) > 0 Then
                            If Not fromNameToFolder.Exists(LCase$(nm)) Then
                                fromNameToFolder.add LCase$(nm), targetFolder
                            End If
                        End If
                    Next k
                End If

                ' --- NEW: From addresses (semicolon-delimited; supports wildcards like *@domain.com) ---
                If Len(fromAddresses) > 0 Then
                    Dim fa() As String, m As Long
                    fa = Split(fromAddresses, ";")
                    For m = LBound(fa) To UBound(fa)
                        Dim addr As String: addr = LCase$(Trim$(fa(m)))
                        If Len(addr) > 0 Then
                            If Not fromAddressToFolder.Exists(addr) Then
                                fromAddressToFolder.add addr, targetFolder
                            End If
                        End If
                    Next m
                End If
                ' --- END NEW ---
            End If
        End If
    Loop

    ts.Close
    Exit Sub

EH:
    On Error Resume Next
    If Not ts Is Nothing Then ts.Close
    Err.Raise Err.Number, Err.Source, Err.Description
End Sub

' CSV line parser: handles quoted fields and embedded commas
Private Function ParseCsvLine(ByVal s As String) As String()
    Dim items As Collection: Set items = New Collection
    Dim i As Long, cur As String, inQuote As Boolean
    For i = 1 To Len(s)
        Dim ch As String: ch = Mid$(s, i, 1)
        If ch = """" Then
            If inQuote And Mid$(s, i + 1, 1) = """" Then
                cur = cur & """": i = i + 1
            Else
                inQuote = Not inQuote
            End If
        ElseIf ch = "," And Not inQuote Then
            items.add cur: cur = ""
        Else
            cur = cur & ch
        End If
    Next i
    items.add cur
    Dim arr() As String: ReDim arr(0 To items.Count - 1)
    For i = 1 To items.Count
        arr(i - 1) = items(i)
    Next
    ParseCsvLine = arr
End Function

' ===========================
' DECISION (which rule hit)
' ===========================
Private Sub DecideDestination(ByVal mail As Outlook.MailItem, _
                              ByVal subjectToFolder As Object, _
                              ByVal fromNameToFolder As Object, _
                              ByVal fromAddressToFolder As Object, _
                              ByRef destPath As String, _
                              ByRef hitType As String, _
                              ByRef hitValue As String)

    destPath = "": hitType = "": hitValue = ""

    ' 1) Subject tokens: contains-match, case-insensitive
    Dim subj As String: subj = LCase$(Nz(mail.Subject))
    Dim key As Variant
    For Each key In subjectToFolder.Keys
        If InStr(1, subj, CStr(key), vbTextCompare) > 0 Then
            destPath = subjectToFolder(key)
            hitType = "Subject"
            hitValue = CStr(key)
            Exit Sub
        End If
    Next key

    ' 2) From address (SMTP) — exact or wildcard (e.g., *@skillsinc.com)  --- NEW ---
    Dim smtp As String: smtp = LCase$(Trim$(Nz(GetSmtpAddress(mail))))
    If Len(smtp) = 0 Then smtp = LCase$(Trim$(Nz(mail.SenderEmailAddress)))

    If Len(smtp) > 0 And fromAddressToFolder Is Nothing = False Then
        ' Exact match
        If fromAddressToFolder.Exists(smtp) Then
            destPath = fromAddressToFolder(smtp)
            hitType = "FromAddr"
            hitValue = smtp
            Exit Sub
        End If
        ' Wildcard patterns using Like (case-insensitive) — e.g. *@skillsinc.com
        For Each key In fromAddressToFolder.Keys
            If InStr(1, CStr(key), "*", vbTextCompare) > 0 Then
                If LCase$(smtp) Like LCase$(CStr(key)) Then
                    destPath = fromAddressToFolder(key)
                    hitType = "FromAddr*"
                    hitValue = CStr(key)
                    Exit Sub
                End If
            End If
        Next key
    End If
    ' --- END NEW ---

    ' 3) From display name (exact, then fuzzy contains)
    Dim senderName As String: senderName = LCase$(Trim$(Nz(mail.senderName)))
    If Len(senderName) = 0 Then senderName = LCase$(Trim$(Nz(mail.SentOnBehalfOfName)))
    If Len(senderName) > 0 Then
        If fromNameToFolder.Exists(senderName) Then
            destPath = fromNameToFolder(senderName)
            hitType = "FromName"
            hitValue = senderName
            Exit Sub
        End If
        For Each key In fromNameToFolder.Keys
            If InStr(1, senderName, CStr(key), vbTextCompare) > 0 Then
                destPath = fromNameToFolder(key)
                hitType = "FromName*"
                hitValue = CStr(key)
                Exit Sub
            End If
        Next key
    End If
End Sub

' ===========================
' FOLDER HELPERS
' ===========================
Private Function GetOrCreateFolderByPath(ByVal path As String) As Outlook.MAPIFolder
    On Error GoTo EH
    ' Path format example: "Mailbox - William Thompson\Inbox\Priority" or "williamt@skillsinc.com\Inbox\Server"
    Dim parts() As String: parts = Split(path, "\")
    If UBound(parts) < 0 Then Exit Function

    Dim rootName As String: rootName = parts(0)

    Dim st As Outlook.Store, rootFolder As Outlook.MAPIFolder
    For Each st In Application.Session.Stores
        If LCase$(st.DisplayName) = LCase$(rootName) Then
            Set rootFolder = st.GetRootFolder
            Exit For
        End If
    Next st
    If rootFolder Is Nothing Then
        ' Fallback to default mailbox root if the path's root doesn't match any store
        Set rootFolder = Application.Session.GetDefaultFolder(olFolderInbox).Parent
    End If

    Dim cur As Outlook.MAPIFolder: Set cur = rootFolder
    Dim i As Long
    For i = 1 To UBound(parts)
        Dim namePart As String: namePart = parts(i)
        If Len(namePart) = 0 Then GoTo NextPart

        Dim nextFld As Outlook.MAPIFolder
        On Error Resume Next
        Set nextFld = cur.Folders(namePart)
        On Error GoTo 0
        If nextFld Is Nothing Then
            Set nextFld = cur.Folders.add(namePart) ' create mail folder
        End If
        Set cur = nextFld
NextPart:
    Next i

    Set GetOrCreateFolderByPath = cur
    Exit Function
EH:
    Set GetOrCreateFolderByPath = Nothing
End Function

Private Function NormalizeFolderPath(ByVal s As String) As String
    s = Replace(s, "\\", "\")
    s = Replace(s, "//", "/")
    NormalizeFolderPath = Trim$(s)
End Function

' ===========================
' LOGGING
' ===========================
Private Sub EnsureLogHeader(ByVal logPath As String)
    On Error GoTo Done
    Dim fso As Object: Set fso = CreateObject("Scripting.FileSystemObject")
    If Not fso.FileExists(logPath) Then
        Dim ts As Object: Set ts = fso.OpenTextFile(logPath, 2, True)
        ts.WriteLine "Time,DRY_RUN,Subject,SenderSMTP,SenderName,HitType,HitValue,DestinationPath"
        ts.Close
    End If
Done:
End Sub

Private Sub LogMove(ByVal logPath As String, ByVal mail As Outlook.MailItem, _
                    ByVal destPath As String, ByVal hitType As String, ByVal hitValue As String, _
                    ByVal dry As Boolean)
    On Error Resume Next
    Dim senderSmtp As String: senderSmtp = GetSmtpAddress(mail)
    Dim senderName As String: senderName = Nz(mail.senderName)

    Dim fso As Object: Set fso = CreateObject("Scripting.FileSystemObject")
    Dim ts As Object: Set ts = fso.OpenTextFile(logPath, 8, True) ' ForAppending
    ts.WriteLine Format$(Now, "yyyy-mm-dd hh:nn:ss") & "," & _
                 IIf(dry, "True", "False") & ",""" & CsvEscape(Nz(mail.Subject)) & """,""" & _
                 CsvEscape(senderSmtp) & """,""" & CsvEscape(senderName) & """," & _
                 CsvEscape(hitType) & ",""" & CsvEscape(hitValue) & """,""" & CsvEscape(destPath) & """"
    ts.Close
End Sub

Private Function CsvEscape(ByVal s As String) As String
    s = Replace(Nz(s), """", """""")
    CsvEscape = s
End Function

' ===========================
' SMTP RESOLUTION
' ===========================
Private Function GetSmtpAddress(ByVal mail As Outlook.MailItem) As String
    On Error Resume Next
    Dim addr As String
    If Not mail.Sender Is Nothing Then
        Dim pa As Outlook.PropertyAccessor
        Set pa = mail.Sender.PropertyAccessor
        ' PR_SMTP_ADDRESS (string): 0x39FE001E
        addr = pa.GetProperty("http://schemas.microsoft.com/mapi/proptag/0x39FE001E")
    End If
    If Len(addr) = 0 Then addr = Nz(mail.SenderEmailAddress)
    GetSmtpAddress = addr
End Function

' ===========================
' UTILS
' ===========================
Private Function Nz(ByVal s As String, Optional ByVal fallback As String = "") As String
    If Len(s) = 0 Then Nz = fallback Else Nz = s
End Function

Private Function ExpandEnv(ByVal p As String) As String
    ExpandEnv = Replace(p, "%USERNAME%", Environ$("USERNAME"))
End Function


