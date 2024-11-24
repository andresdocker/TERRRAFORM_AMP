# °°°°°°°°°°°°°°°°°°°°°°° VARIABLES  VPC Virginia °°°°°°°°°°°°°°°°°°°°°
variable "virginia_cidr" {
    description = "CIDR Virginia"
    type = string
    sensitive = true
}

# °°°°°°°°°°°°°°°°°°°°° VARIABLES  SUBNET - VPC Virginia °°°°°°°°°°°°°°°
# subnet publica 
variable "public_subnet" {
    description = "CIDR public subnet"
    type = string
}
# subnet public
variable "private_subnet" {
    description = "CIDR private subnet"
    type = string
}

# °°°°°°°°°°°°°°°°°°°°°°° VARIABLES  VPC OHIO    °°°°°°°°°°°°°°°°°°°°°
# variable "ohio_cidr" {
# }

########################   IMAGENES WINDOWS   ########################
variable "image_win_server2022" {
    description = "Amazon Machine Image"
    type = string
  
}
########################   IMAGENES aws-LINUX     ########################
variable "image_awslinux" {
    description = "Amazon Machine Image"
    type = string
  
}
########################   IMAGENES LINUX-ubuntu     ########################
variable "image_linux_ubuntu" {
    description = "Amazon Machine Image"
    type = string

}
########################   IMAGENES LINUX-REDHAT     ########################
variable "image_linux_redhat" {
    description = "Amazon Machine Image"
    type = string

}
########################   IMAGENES LINUX-SUSE     ########################
variable "image_linux_suse" {
    description = "Amazon Machine Image"
    type = string

}
########################   SECURITY GROUPS   ########################
variable "sg_ingress_cidr" {
    description = "CIRD for ingress traffic"
    type = string
  
}
########################    imagen tipo POC    ########################
variable "image_type_poc" {
    description = "image POC"
    type = string
  
}
########################    imagen tipo POC 2    ########################
variable "image_type_poc2" {
    description = "image POC"
    type = string
  
}
########################    Variable de ruta    ######################
variable "private_key_path" {
  description = "Ruta a la clave privada SSH en tu PC con Windows"
}

# _________________________________________________________________________________
# variable "instance_names" {
#   description = "List of names for the EC2 instances"
#   type        = list(string)
# default     = ["SRVTEST87", "BACKUPSRC877", "ADSERER123"]  # Lista de nombres de tus servidores
# }
