$ventanas = Get-Process | Where-Object { $_.MainWindowTitle } | Select-Object MainWindowHandle, MainWindowTitle

if ($ventanas.Count -eq 0)
{
    Write-Host "`n[Vacio]" -ForegroundColor Red
}
else
{
    $ventanas | Format-Table -AutoSize
}

do {
    $key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
} while ($key.ControlKeyState -ne 0 -or $key.Character -eq 'v' -or $key.Character -eq 'V')