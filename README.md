# AWS Web Application Infrastructure with Terraform

This project provisions a basic web application infrastructure using AWS resources via Terraform. The setup includes an EC2 instance running a web server(apache2) and an RDS MySQL database.

## Infrastructure Overview

- **EC2 Instance**: A t2.micro Ubuntu server hosting a web application.
- **RDS MySQL Instance**: A db.t4g.micro instance running MySQL.
- **Security Groups**: Allow SSH (port 22), HTTP (port 80), and MySQL (port 3306) traffic.

## Prerequisites

- Terraform installed (v1.0+)
- AWS account with IAM user having appropriate permissions.
- AWS credentials configured locally (via `aws configure` or environment variables) and it should be mentioned on main.tf file.
- My AWS credentials which i stored locally in the name of Anas_account, replace this Anas_account with your configured AWS credential profile.

## Setup Instructions

### Clone the Repository
git clone https://github.com/pargunanachuthan/terraform_challenge
cd terraform_challenge

### Change the AWS Credentials 
On the main.tf file change the profile = Anas_account to your AWS Credential profile 

### Steps to execute the code 
On the variables.tf file change the key pair name to your account existing key pair name Or else you can also proceed without keypair. For that you need to delete the key_name = var.key_name on the main.tf file. 
Best practice is to use with key pair.
This code will create the resources in the ap-south-1 region if you want to change it you can change it under the variables.tf file

After doing the changes use
terraform init ---- to initialize the terraform 
terraform validate ---- to check the code for errors 
terraform apply ---- to apply terraform configurations

terraform destroy ----to delete the terraform configurations applied 



                              ---- end ----
                              happy learning
