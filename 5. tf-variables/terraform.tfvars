aws_availability_zone = "ap-south-1a"
aws_ec2_ami           = "ami-00bb6a80f01f03502"
aws_ec2_instance_type = "t2.micro"
aws_ec2_root_block_device = {
  delete_on_termination = true
  volume_type           = "gp2"
  volume_size           = 30
}
ec2_tags = {
  Stage = "QA"
}
