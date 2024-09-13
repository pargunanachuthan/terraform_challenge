output "ec2_public_ip" {
  description = "Public IP of the EC2 instance."
  value       = aws_instance.web.public_ip
}

output "rds_endpoint" {
  description = "Endpoint of the RDS MySQL instance."
  value       = aws_db_instance.mysql.endpoint
}
