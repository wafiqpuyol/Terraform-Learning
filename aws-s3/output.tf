output "aws_s3_bucket_name" {
  value = aws_s3_bucket.tf-bucket.bucket
}
output "aws_s3_bucket_id" {
  value = aws_s3_bucket.tf-bucket.id
}