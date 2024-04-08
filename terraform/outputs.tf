output "iam_user_name" {
    description = "IAM user for terraform"
    value = module.backend.iam_user_arn
}
output "s3_bucket_id" {
    description = "ID of the S3 Bucket"
    value = module.s3_web_main.s3_bucket_id
}

output "s3_bucket_arn" {
    description = "ARN of the S3 Bucket"
    value = module.s3_web_main.s3_bucket_arn
  
}

output "web_url" {
    description = "URL of the static web"
    value = module.s3_web_main.web_url

}