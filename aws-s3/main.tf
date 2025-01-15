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
  region  = var.region
}

resource "aws_s3_bucket" "bucket" {
  bucket = "tf-s3-bucket-123"
}

resource "aws_s3_object" "bucket_data" {
  bucket = aws_s3_bucket.bucket.bucket
  key = "data.txt"
  source = "./s3.txt"
}