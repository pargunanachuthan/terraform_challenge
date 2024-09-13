provider "aws" {
  region = var.aws_region
  profile = "Anas_account"

}

# Security Group for EC2 instance and RDS instance
resource "aws_security_group" "web_sg" {
  name        = "web_server_sg"
  description = "Allow HTTP and SSH traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group for RDS instance (allow MySQL traffic from EC2)
resource "aws_security_group" "rds_sg" {
  name        = "rds_security_group"
  description = "Allow MySQL traffic from the web server"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  security_groups = [aws_security_group.web_sg.name]
  key_name = var.key_name

  tags = {
    Name = "WebServerInstance"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y apache2
              sudo systemctl start apache2
              sudo systemctl enable apache2
              EOF
}

# RDS Instance
resource "aws_db_instance" "mysql" {
  engine            = "mysql"
  engine_version    = "8.0.39"
  instance_class    = var.rds_instance_class
  allocated_storage = 20
  db_name           = var.db_name
  username          = var.db_user
  password          = var.db_password
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  tags = {
    Name = "MySQLDBInstance"
  }
}

