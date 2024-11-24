#||||||||||||||||||||||||||variables de VPC|||||||||||||||||||||||||
virginia_cidr = "10.10.0.0/16"
# ohio_cidr = "10.20.0.0/16"
#||||||||||||||||||||||||||variables subnet|||||||||||||||||||||||||
public_subnet = "10.10.0.0/24"
private_subnet = "10.10.1.0/24"
#||||||||||||||||||||||||||var - policy groups |||||||||||||||||||||
sg_ingress_cidr = "0.0.0.0/0"
#||||||||||||||||||||||||||  Tags - standar ||||||||||||||||||||||||
#°°°°°°°°°°°°°°°°°°°°°°°°°°°VERIABLES DE VMs°°°°°°°°°°°°°°°°°°°°°°°°°
image_win_server2022 = "ami-073e3b46f8802d31b"
image_linux_ubuntu = "ami-0e001c9271cf7f3b9"
image_awslinux = "ami-0bb84b8ffd87024d8"
image_linux_redhat = "ami-0583d8c7a9c35822c"
image_linux_suse = "ami-0e9777e8a2a5b54fb"

#||||||||||||||||||||||||||  Tags - standar ||||||||||||||||||||||||
image_type_poc = "t2.micro"
image_type_poc2 = "t2.medium"
#||||||||||||||||||||||||||  RUTA CLAVE.PEM ||||||||||||||||||||||||
private_key_path = "C:/Users/jesus/Documents/TERRAFORM DEPENDENCIAS/practica_terraform/POC_TRF/mykey.pem"







