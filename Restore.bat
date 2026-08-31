reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Scaling" /v MonitorSize /f
reg delete "HKLM\SOFTWARE\Microsoft\TabletTip\1.7" /v DisableNewKeyboardExperience /f

taskkill /f /im TabTip.exe
taskkill /f /im explorer.exe
start explorer.exe