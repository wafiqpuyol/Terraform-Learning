terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.16"
        }
        random = {
            source = "hashicorp/random"
            version = "3.6.3"
        }
    }

    required_version = ">= 1.2.0"
}

provider "aws" {
    region  = var.region
}

resource "random_id" "rand_id" {
    byte_length = 8
}

resource "aws_s3_bucket" "tf-bucket" {
    bucket = "tf-s3-bucket-${random_id.rand_id.hex}"
}

resource "aws_s3_object" "bucket_data" {
    bucket = aws_s3_bucket.tf-bucket.bucket
    key = "data.txt"
    source = "./s3.txt"
}