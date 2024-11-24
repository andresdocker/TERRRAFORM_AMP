# resource "aws_instance" "Amazon_Linux" {
#   ami           = var.image_awslinux # ID de la AMI de Ubuntu 20.04 LTS
#   instance_type = var.image_type_poc          # Tipo de instancia
#   key_name      = data.aws_key_pair.key.key_name      # Nombre de tu par de claves SSH
#   subnet_id = aws_subnet.public_subnet.id
#   vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
#   user_data              = file("scripts/hsnm_amazonlinux.sh")
  
#   tags = {
#     Name = "prueba_amazonlinux"
#     name = "test"
#     env = "dev"
#   }

  # provisioner "local-exec" {
  #   command = "echo ${aws_instance.zabbix_server.public_ip} > public_ip.txt"
  # }
  #   # Asignar hostname en el servidor
  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo hostnamectl set-hostname MQTTSERVER",
  #     "sudo systemctl restart systemd-hostnamed"
  #   ]
  # }

  #   connection {
  #   type        = "ssh"
  #   user        = "ubuntu"
  #   private_key = file("mykey.pem")  # Ruta a tu clave privada SSH
  #   host        = self.public_ip
  # }

# #   provisioner "remote-exec" {
#     inline = [
#       "sudo apt update",
#       "sudo apt install -y zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-agent mysql-server",
#       "sudo mysql -uroot -p -e 'CREATE DATABASE zabbix CHARACTER SET utf8 collate utf8_bin;'",
#       "sudo mysql -uroot -p -e 'CREATE USER ''zabbix''@''localhost'' IDENTIFIED BY ''password'';'",
#       "sudo mysql -uroot -p -e 'GRANT ALL PRIVILEGES ON zabbix.* TO ''zabbix''@''localhost'' WITH GRANT OPTION;'",
#       "sudo zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | sudo mysql -uzabbix -p zabbix",
#       "sudo sed -i 's/# DBPassword=/DBPassword=password/g' /etc/zabbix/zabbix_server.conf",
#       "sudo systemctl restart zabbix-server zabbix-agent apache2",
#       "sudo systemctl enable zabbix-server zabbix-agent apache2",
#       "sudo ufw allow 'Nginx HTTP'"
#       # Agrega más comandos según sea necesario para personalizar la configuración de Zabbix
#     ]
#   }

# # Recurso RDS para la base de datos de Zabbix
# resource "aws_db_instance" "zabbix_db" {
#   allocated_storage    = 20  # Cambia al tamaño de almacenamiento deseado
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t2.micro"
#   #name                 = "zabbix-db"
#   username             = "zabbix"      # Cambia al nombre de usuario deseado
#   password             = "password123" # Cambia a tu contraseña deseada
#   publicly_accessible = false
# }