resource "aws_instance" "tf_instance" {
  ami           = var.tf_instance.ami
  instance_type = var.tf_instance.instance_type
  subnet_id     = element(aws_subnet.tf_subnet[*].id, count.index % length(aws_subnet.tf_subnet))
  count         = var.tf_instance.number_of_instances
  tags = {
    Name = "${local.project}-ec2-${count.index}"
  }
}
