$windows = Get-Process | Where-Object { $_.MainWindowTitle } | Select-Object MainWindowHandle, MainWindowTitle
if ($windows.Count -ne 0) {
  $windows | Format-Table -AutoSize
}
do {
  $key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
} while ($key.ControlKeyState -ne 0 -or $key.Character -eq 'v' -or $key.Character -eq 'V')