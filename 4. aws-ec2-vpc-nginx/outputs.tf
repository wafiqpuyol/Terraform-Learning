output "nginxserver_public_ip" {
  value = aws_instance.nginxserver.public_ip
}

output "nginxserver_url" {
  value = "http://${aws_instance.nginxserver.public_ip}"
}
