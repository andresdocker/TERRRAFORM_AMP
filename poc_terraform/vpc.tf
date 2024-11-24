#°°°°°°°°°°°°°°°°°°°°°°°°°°      VPC VIRGINIA   °°°°°°°°°°°°°°°°°°°°°°°|
resource "aws_vpc" "vpc_virginia" {
  cidr_block       = var.virginia_cidr
  #instance_tenancy = "default"
  tags = {
    Name = "VPC_VIRGINIA"
    name = "prueba"
    env  = "dev"
  }
}

#°°°°°°°°°°°°°°°°°°°°°°°°°°   VPC VIRGINIA - subnet  °°°°°°°°°°°°°°°°
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id
  cidr_block = var.public_subnet
  map_public_ip_on_launch = true
  tags = {
    Name =  "public subnet"
    name = "test"
    env = "dev"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id
  cidr_block = var.private_subnet
  map_public_ip_on_launch = false
  tags = {
    Name =  "private subnet"
    name = "test"
    env = "dev"
}
}

#°°°°°°°°°°°°°°°°°°°°°°°°°°   INTERNET GATEWAY VIRGINIA  °°°°°°°°°°°°°°°°
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_virginia.id

  tags = {
    Name = "Internet VPC Virginia"
  }
  
}

#°°°°°°°°°°°°°°°°°°°°°  TABLA DE ENRUTAMIENTO VIRGINIA  °°°°°°°°°°°°°°°°
# resource "aws_route_table" "public_crt" {
#   vpc_id = aws_vpc.vpc_virginia.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = var.aws_internet_gateway.igw.id
#   }


#   tags = {
#     Name = "public_aws_routing"
  
#   }
# }


resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_virginia.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id  # Aquí debes referenciar un Internet Gateway existente
    
  }
   tags = {
    Name = "public_aws_routing"
  
  }
}

#°°°°°°°°°°°°°°°°°°°°°  TABLA DE ENRUTAMIENTO ASOCIADA VIRGINIA  °°°°°°°°°°°°°°°°
resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
  
}
#°°°°°°°°°°°°°°°°°°°°°        SECURITY GROUPS        °°°°°°°°°°°°°°°°°°

resource "aws_security_group" "sg_public_instance" {
  name        = "Public Instance SG"
  description = "Allow SSH inbound trafic"
  vpc_id = aws_vpc.vpc_virginia.id

  # Regla de entrada permitiendo acceso desde cualquier IP al puerto 80
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    description = "SSH"
    from_port   = 1883
    to_port     = 1883
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming HTTP connections"
  }

      ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming HTTP connections"
  }
        ingress {
    from_port   = 8084
    to_port     = 8084
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming HTTP connections"
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming RDP connections"
  }
    ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming RDP connections"
  }
    ingress {
    from_port   = 9443
    to_port     = 9443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming RDP connections"
  }
    ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permite acceso desde cualquier IP
  }
  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permite acceso desde cualquier IP
  }
  # Regla de salida permitiendo acceso a cualquier destino
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "public instance SG"
  }
}


#°°°°°°°°°°°°°°°°°°°°°°°°°°      VPC OHIO   °°°°°°°°°°°°°°°°°°°°°°°°°°|
# resource "aws_vpc" "vpc_ohio" {
#   cidr_block       = var.ohio_cidr
#   #instance_tenancy = "default"

#   tags = {
#     Name = "VPC_Ohio"
#     name = "prueba"
#     env  = "dev"
#   }
#   provider = aws.ohio
# }
