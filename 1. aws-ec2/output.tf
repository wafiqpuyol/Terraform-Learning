output "aws_instance_private_ip" {
  description = "Private IP address of the instance"
  value = aws_instance.app_server.private_ip
}