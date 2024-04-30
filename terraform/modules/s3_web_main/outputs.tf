output "s3_bucket_id" {
    description = "ID of the S3 Bucket"
    value = aws_s3_bucket.web_bucket.id
}

output "s3_bucket_arn" {
    description = "ARN of the S3 Bucket"
    value = aws_s3_bucket.web_bucket.arn
  
}

output "web_url" {
    description = "URL of the static web"
    value = "http://${aws_s3_bucket.web_bucket.bucket}.s3--${var.region}.amazon.com"

}
