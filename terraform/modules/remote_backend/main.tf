# IAM User for Terraform
resource "aws_iam_user" "terraform_user" {
  name = var.iam_user_name
}

# Attach AdministratorAccess policy to the IAM user
resource "aws_iam_user_policy_attachment" "admin_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  user       = aws_iam_user.terraform_user.id
}

# S3 Bucket for Terraform state
resource "aws_s3_bucket" "terraform_task_bucket" {
  bucket = var.bucket_name

}
# S3 Bucket Policy
resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.terraform_task_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "s3:ListBucket",
        Resource = aws_s3_bucket.terraform_task_bucket.arn,
        Principal = {
          AWS = aws_iam_user.terraform_user.arn
        }
      },
      {
        Effect   = "Allow",
        Action   = ["s3:GetObject", "s3:PutObject"],
        Resource = "${aws_s3_bucket.terraform_task_bucket.arn}/*",
        Principal = {
          AWS = aws_iam_user.terraform_user.arn
        }
      }
    ]
  })
}
