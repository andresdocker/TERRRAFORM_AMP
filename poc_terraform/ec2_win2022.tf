# resource "aws_instance" "windows_server2022" {
#   ami           = var.image_win_server2022 # AMI de Windows Server, ajusta según tu región y versión de Windows
#   instance_type = var.image_type_poc    # Tipo de instancia, ajusta según tus necesidades
#   key_name = data.aws_key_pair.key.key_name  # Cambia esto al nombre de tu par de claves
#   subnet_id                    = aws_subnet.public_subnet.id
#   vpc_security_group_ids = [aws_security_group.sg_public_instance.id]   # IDs de tus grupos de seguridad
#   associate_public_ip_address  = true
#   user_data     = <<-EOF
#                   <powershell>
#                   Invoke-WebRequest -Uri "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US" -OutFile "C:\FirefoxSetup.exe"
#                   Start-Process -FilePath "C:\FirefoxSetup.exe" -ArgumentList "/S" -Wait
#                   Remove-Item "C:\FirefoxSetup.exe"
#                   $puttyUrl = "https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.76-installer.msi"
#                   $installerPath = "C:\putty_installer.msi"
#                   Invoke-WebRequest -Uri $puttyUrl -OutFile $installerPath
#                   Start-Process -FilePath msiexec.exe -ArgumentList "/i", "`"$installerPath`"", "/quiet", "/norestart" -Wait
#                   Remove-Item $installerPath
#                   Invoke-Expression -Command "(Get-WmiObject -Class Win32_ComputerSystem).Rename('POC_WINDOWS')"
#                   Restart-Computer -Force
#                   </powershell>
#                   EOF


  # tags = {
  #   Name = "prueba_Windows_Server_2022"
  #   name = "test"
  #   env = "dev"
  # }


#   # Script de inicio para unir el servidor al dominio de Active Directory
#   user_data = <<-EOF
#     <powershell>
#     # Unir el servidor al dominio de Active Directory
#     amazon-ssm-agent-installer.exe
#     </powershell>
#   EOF 


#   # Script de inicio para unir el servidor al dominio de Active Directory
#   user_data = <<-EOF
#     <powershell>
#     # Unir el servidor al dominio de Active Directory
#     Add-Computer -DomainName "example.com" -Credential (Get-Credential) -Restart
#     </powershell>
#   EOF 
# }
