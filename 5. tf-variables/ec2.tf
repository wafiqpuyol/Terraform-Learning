resource "aws_instance" "tf-instance" {
  ami               = var.aws_ec2_ami
  instance_type     = var.aws_ec2_instance_type
  availability_zone = var.aws_availability_zone

  root_block_device {
    delete_on_termination = var.aws_ec2_root_block_device.delete_on_termination
    volume_type           = var.aws_ec2_root_block_device.volume_type
    volume_size           = var.aws_ec2_root_block_device.volume_size
  }

  tags = merge(var.ec2_tags, {
      Name = "tf-instance"
  })
}
