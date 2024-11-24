# user_data = <<-EOF
# <powershell>
# # Descargar e instalar Firefox
# Invoke-WebRequest -Uri "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US" -OutFile "C:\FirefoxSetup.exe"
# Start-Process -FilePath "C:\FirefoxSetup.exe" -ArgumentList "/S" -Wait
# Remove-Item "C:\FirefoxSetup.exe"

# # Descargar e instalar PuTTY
# $puttyUrl = "https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.76-installer.msi"
# $installerPath = "C:\putty_installer.msi"
# Invoke-WebRequest -Uri $puttyUrl -OutFile $installerPath
# Start-Process -FilePath msiexec.exe -ArgumentList "/i", "`"$installerPath`"", "/quiet", "/norestart" -Wait
# Remove-Item $installerPath

# # Renombrar la computadora
# Invoke-Expression -Command "(Get-WmiObject -Class Win32_ComputerSystem).Rename('POC_WINDOWS')"

# # Reiniciar la computadora
# Restart-Computer -Force
# </powershell>
# EOF
