resource "aws_instance" "nginxserver" {
  ami                         = "ami-053b12d3152c0cc71"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.tf_public_subnet.id
  associate_public_ip_address = true
  availability_zone           = "ap-south-1a"
  security_groups             = [aws_security_group.tf_nginx_sg.id]

  user_data = <<-EOF
            #!/bin/bash
            sudo apt update -y
            sudo apt install nginx -y
            echo "<html><head><title>Hello from Nginx!</title></head><body><h1>Hello, world!</h1></body></html>" | sudo tee /var/www/html/index.html
            sudo systemctl start nginx
            EOF

  tags = {
    Name = "tf-nginx-ec2"
  }
}
