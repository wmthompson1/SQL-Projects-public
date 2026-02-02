function Get-FileLockStatus($path) {
  if (-not (Test-Path $path)) { return 'NotFound' }
  try {
    $fs = [System.IO.File]::Open($path,'Open','ReadWrite','None')
    $fs.Close()
    return 'Unlocked'
  }
  catch [System.IO.IOException] {
    return 'Locked'
  }
  catch [System.UnauthorizedAccessException] {
    return 'AccessDenied'
  }
  catch {
    return \"Error: $($_.Exception.Message)\"
  }
}
Get-FileLockStatus '\\server\share\path\abc.xls'