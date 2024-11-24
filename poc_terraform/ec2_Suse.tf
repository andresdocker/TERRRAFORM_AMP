# resource "aws_instance" "Linux_suse" {
#   ami           = var.image_linux_suse # ID de la AMI de Ubuntu 20.04 LTS
#   instance_type = var.image_type_poc          # Tipo de instancia
#   key_name      = data.aws_key_pair.key.key_name      # Nombre de tu par de claves SSH
#   subnet_id = aws_subnet.public_subnet.id
#   vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
#   iam_instance_profile = aws_iam_instance_profile.SSM_profile.id
#   user_data = file("scripts/hsnm_Suse.sh")

#   tags = {
#     Name = "prueba_Suse"
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

#     connection {
#     type        = "ssh"
#     user        = "ubuntu"
#     private_key = file("mykey.pem")  # Ruta a tu clave privada SSH
#     host        = self.public_ip
#   }
# }
