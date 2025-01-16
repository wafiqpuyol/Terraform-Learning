terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = var.region
}

resource "aws_instance" "app_server" {
  ami           = "ami-053b12d3152c0cc71"
  instance_type = "t2.micro"
  tags = {
    Name = "tf-ec2"
  }
}