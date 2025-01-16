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

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.tf-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_object" "bucket_data" {
    bucket = aws_s3_bucket.tf-bucket.bucket
    key = "data.txt"
    source = "./s3.txt"
}