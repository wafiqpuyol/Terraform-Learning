resource "aws_vpc" "tf_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "tf-vpc"
  }
}

resource "aws_subnet" "tf_public_subnet" {
  cidr_block        = "10.0.1.0/24"
  vpc_id            = aws_vpc.tf_vpc.id
  availability_zone = "ap-south-1a"
  tags = {
    "Name" = "tf-public-subnet"
  }
}

resource "aws_subnet" "tf_private_subnet" {
  cidr_block        = "10.0.2.0/24"
  vpc_id            = aws_vpc.tf_vpc.id
  availability_zone = "ap-south-1a"
  tags = {
    "Name" = "tf-private-subnet"
  }
}

resource "aws_internet_gateway" "tf_igw" {
  vpc_id = aws_vpc.tf_vpc.id
  tags = {
    Name = "tf-igw"
  }
}

resource "aws_route_table" "tf_public_rt" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_igw.id
  }
  tags = {
    "Name" = "tf_public_rt"
  }
}

resource "aws_route_table" "tf_private_rt" {
  vpc_id = aws_vpc.tf_vpc.id
  tags = {
    "Name" = "tf-private-rt"
  }
}

resource "aws_route_table_association" "public_sub_association" {
  route_table_id = aws_route_table.tf_public_rt.id
  subnet_id      = aws_subnet.tf_public_subnet.id
}

resource "aws_route_table_association" "private_sub_association" {
  route_table_id = aws_route_table.tf_private_rt.id
  subnet_id      = aws_subnet.tf_private_subnet.id
}
