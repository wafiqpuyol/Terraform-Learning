variable "aws_availability_zone" {
  description = "What AZ to use?"
  type        = string
}

variable "aws_ec2_ami" {
  description = "AMI ID"
  type        = string
}

variable "aws_ec2_instance_type" {
  description = "What type of instance to use?"
  type        = string
  validation {
    condition     = var.aws_ec2_instance_type == "t2.micro"
    error_message = "Only t2.micro is allowed"
  }
}

variable "aws_ec2_root_block_device" {
  type = object({
    delete_on_termination = bool
    volume_type           = string
    volume_size           = number
  })
}

variable "ec2_tags" {
  type = map(string)
}
