# resource "aws_instance" "Linux_ubuntu" {
#   ami           = var.image_linux_ubuntu # ID de la AMI de Ubuntu 20.04 LTS
#   instance_type = var.image_type_poc          # Tipo de instancia
#   key_name      = data.aws_key_pair.key.key_name      # Nombre de tu par de claves SSH
#   subnet_id = aws_subnet.public_subnet.id
#   vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
#   user_data = file("scripts/hsnm_ubuntu.sh")

#   tags = {
#     Name = "prueba_ubuntu"
#     name = "test"
#     env = "dev"
#   }

  # provisioner "local-exec" {
  #   command = "echo ${aws_instance.linux_ubuntu.public_ip} > public_ip.txt"
  # }
  # #   # Asignar hostname en el servidor
  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo hostnamectl set-hostname serverzabbix",
  #     "sudo systemctl restart systemd-hostnamed"
  #   ]
  # }



# }