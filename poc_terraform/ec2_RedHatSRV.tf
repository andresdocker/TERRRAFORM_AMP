# #Instance Role
# resource "aws_iam_role" "SaaS_SSM_role" {
#   name = "SSM_ROLE"
#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF
 
#   tags = {
#     Name = "DefaultSSM"
#     createdBy = "angel.tepoz"
#     Owner = "DevOps"
#     Project = "ZeroCLM"
#     environment = "SaaS"
#   }
# }
 
# #Instance Profile
# resource "aws_iam_instance_profile" "SSM_profile" {
#   name = "SSM_PROFILE"
#   role = "${aws_iam_role.SaaS_SSM_role.id}"
# }
 
# #Attach Policies to Instance Role
# resource "aws_iam_policy_attachment" "SSM_attach" {
#   name       = "SSM-attachment"
#   roles      = [aws_iam_role.SaaS_SSM_role.id]
#   policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
# }
# resource "aws_iam_policy_attachment" "SSM_attach_ec2_role" {
#   name       = "SSM-Role-attachment"
#   roles      = [aws_iam_role.SaaS_SSM_role.id]
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
# }



# resource "aws_instance" "Amazon_RedHat" {
#   ami                  = var.image_linux_redhat
#   instance_type        = var.image_type_poc
#   key_name             = data.aws_key_pair.key.key_name
#   subnet_id            = aws_subnet.public_subnet.id
#   vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
#   iam_instance_profile = aws_iam_instance_profile.SSM_profile.id
#   user_data            = file("scripts/hsnm_redhat.sh")

#   tags = {
#     Name = "prueba_RedHat"
#     name = "test"
#     env  = "dev"
#   }

#     connection {
#     type        = "ssh"
#     user        = "ec2-user "
#     private_key = file("mykey.pem")  # Ruta a tu clave privada SSH
#     host        = self.public_ip
#   }
# }
