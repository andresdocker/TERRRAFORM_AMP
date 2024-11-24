resource "random_string" "suffix" {
  length = 4
  special = false
}

resource "aws_iam_role" "SaaS_SSM_role" {
  name = "SSM_ROLE_${random_string.suffix.result}"
  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  }
  EOF

  tags = {
    Name = "DefaultSSM"
    createdBy = "angel.tepoz"
    Owner = "DevOps"
    Project = "ZeroCLM"
    environment = "SaaS"
  }
}

resource "aws_iam_instance_profile" "SSM_profile" {
  name = "SSM_Profile_${random_string.suffix.result}"
  role = aws_iam_role.SaaS_SSM_role.name
}