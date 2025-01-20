locals {
  project = "Project-1"
}

variable "project_provider" {
  type = string
}
variable "number_of_subnets" {
  type = number
}
variable "tf_instance" {
  type = object({
    instance_type       = string
    number_of_instances = number
    ami                 = string
  })
  validation {
    condition     = var.tf_instance.instance_type == "t2.micro"
    error_message = "Only t2.micro is allowed"
  }
  validation {
    condition     = var.tf_instance.number_of_instances == 4
    error_message = "Number of instances must be equal to 4"
  }
}
