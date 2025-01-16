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
  region = "ap-south-1"
}

resource "aws_vpc" "tf_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "tf-vpc"
  }
}

resource "aws_subnet" "tf-private-subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.tf_vpc.id
  tags = {
    Name = "tf-private-subnet"
  }
}

resource "aws_subnet" "tf-public-subnet" {
  cidr_block              = "10.0.2.0/24"
  vpc_id                  = aws_vpc.tf_vpc.id
  map_public_ip_on_launch = true
  tags = {
    Name = "tf-public-subnet"
  }
}

#Internet gateway
resource "aws_internet_gateway" "tf-igw" {
  vpc_id = aws_vpc.tf_vpc.id
  tags = {
    Name = "tf-igw"
  }
}

#Routing table
resource "aws_route_table" "tf-public-rt" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf-igw.id
  }
}

resource "aws_route_table" "tf-private-rt" {
  vpc_id = aws_vpc.tf_vpc.id
}

resource "aws_route_table_association" "public-sub" {
  route_table_id = aws_route_table.tf-public-rt.id
  subnet_id      = aws_subnet.tf-public-subnet.id
}

resource "aws_route_table_association" "private-sub" {
  route_table_id = aws_route_table.tf-private-rt.id
  subnet_id      = aws_subnet.tf-private-subnet.id
}
