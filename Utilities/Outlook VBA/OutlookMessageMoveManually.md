## Outlook Message Moves

**iPhone Outlook Doesn't Move Messages**

Because automation and server process emails don't redirect on my smartphone, it's done manually via VBA.

## VBA Macro Implementation

### Purpose
Manually move emails from specific senders to designated folders when server-side rules don't sync to mobile Outlook clients.

### Copied VBA module and csv inputs to repo
**this documentation may reference VBA**
Utilities\Outlook VBA\MoveToFolder.bas
Utilities\Outlook VBA\OutlookRulesSummary.csv
Utilities\Outlook VBA\ManualMove_Audit.csv

### Macro Code

```vba
Sub MoveServerEmails()
    ' Move emails from automated systems to appropriate folders
    Dim objInbox As Outlook.Folder
    Dim objItem As Object
    Dim objMail As Outlook.MailItem
    Dim strSenderAddress As String
    
    Set objInbox = Application.Session.GetDefaultFolder(olFolderInbox)
    
    For Each objItem In objInbox.Items
        If TypeOf objItem Is MailItem Then
            Set objMail = objItem
            
            ' Get SMTP address
            strSenderAddress = GetSMTPAddress(objMail)
            
            ' Move based on sender
            Select Case LCase(strSenderAddress)
                Case "noreply@github.com", "notifications@github.com"
                    MoveToFolder objMail, "GitHub"
                Case "alerts@arangodb.com"
                    MoveToFolder objMail, "Database Alerts"
                Case "noreply@visualmanufacturing.com"
                    MoveToFolder objMail, "ERP Notifications"
                ' Add more cases as needed
            End Select
        End If
    Next objItem
    
    Set objInbox = Nothing
End Sub

Function GetSMTPAddress(objMail As Outlook.MailItem) As String
    ' Get SMTP address using PropertyAccessor
    Const PR_SMTP_ADDRESS As String = "http://schemas.microsoft.com/mapi/proptag/0x39FE001E"
    On Error Resume Next
    GetSMTPAddress = objMail.PropertyAccessor.GetProperty(PR_SMTP_ADDRESS)
    If Err.Number <> 0 Then
        GetSMTPAddress = objMail.SenderEmailAddress
    End If
    On Error GoTo 0
End Function

Sub MoveToFolder(objMail As Outlook.MailItem, strFolderName As String)
    Dim objNamespace As Outlook.NameSpace
    Dim objDestFolder As Outlook.Folder
    
    Set objNamespace = Application.GetNamespace("MAPI")
    On Error Resume Next
    Set objDestFolder = objNamespace.GetDefaultFolder(olFolderInbox).Folders(strFolderName)
    
    If Not objDestFolder Is Nothing Then
        objMail.Move objDestFolder
    End If
    
    Set objDestFolder = Nothing
    Set objNamespace = Nothing
End Sub
```

## Usage

1. Open Outlook VBA Editor (Alt + F11)
2. Insert new module (Insert → Module)
3. Paste the code above
4. Customize sender addresses and folder names in the `Select Case` block
5. Run `MoveServerEmails` macro manually or assign to Quick Access Toolbar

## Common Sender Addresses

| System | From Address | Destination Folder |
|--------|--------------|-------------------|
| GitHub | noreply@github.com | GitHub |
| ArangoDB | alerts@arangodb.com | Database Alerts |
| Visual MFG | noreply@visualmanufacturing.com | ERP Notifications |
| SQL Server | sqlagent@sql-lab-1 | SQL Alerts |

## Troubleshooting

**Issue:** Macro doesn't find folders  
**Solution:** Create folders in Inbox first, or modify `MoveToFolder` to create if missing

**Issue:** Permission errors  
**Solution:** Enable macros in Outlook Trust Center settings

**Issue:** SMTP address returns display name  
**Solution:** Use `PropertyAccessor` method (already implemented in code)

## Alternative: Export Rules for Reference

To document existing server-side rules:

```vba
Sub ExportRulesToCSV()
    Dim objRules As Outlook.Rules
    Dim objRule As Outlook.Rule
    Dim strOutput As String
    Dim i As Integer
    
    Set objRules = Application.Session.DefaultStore.GetRules
    
    strOutput = "Rule Name,Enabled,Conditions,Actions" & vbCrLf
    
    For i = 1 To objRules.Count
        Set objRule = objRules.Item(i)
        strOutput = strOutput & objRule.Name & ","
        strOutput = strOutput & objRule.Enabled & ","
        ' Add condition/action parsing as needed
        strOutput = strOutput & vbCrLf
    Next i
    
    ' Save to file
    Open "C:\Temp\OutlookRules.csv" For Output As #1
    Print #1, strOutput
    Close #1
End Sub
```

## Related Documentation

- [Utilities folder structure](../README.md)
- [PowerShell email utilities](../Powershell%20Utilities/)

---

*Last updated: January 2026*