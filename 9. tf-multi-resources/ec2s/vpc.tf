resource "aws_vpc" "tf_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${local.project}-vpc"
  }
}

resource "aws_subnet" "tf_subnet" {
  vpc_id     = aws_vpc.tf_vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  count      = var.number_of_subnets
  tags = {
    Name = "${local.project}-subnet-${count.index}"
  }
}