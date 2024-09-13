variable "aws_region" {
  description = "AWS region where the infrastructure will be deployed."
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance."
  default     = "ami-0522ab6e1ddcc7055" # Ubuntu 20.04 LTS
}

variable "instance_type" {
  description = "EC2 instance type."
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the EC2 key pair."
  default     = "guna_key_pair" # Replace with your key name
}

variable "rds_instance_class" {
  description = "RDS instance class."
  default     = "db.t4g.micro"
}

variable "db_name" {
  description = "Name of the RDS MySQL database."
  default     = "myappdb"
}

variable "db_user" {
  description = "Username for the RDS MySQL database."
  default     = "admin"
}

variable "db_password" {
  description = "Password for the RDS MySQL database."
  default     = "admin!123" # Change this to a more secure password
}

