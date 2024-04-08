resource "aws_s3_bucket" "web_bucket" {
  bucket = var.web_bucket
}

resource "aws_s3_bucket_website_configuration" "web_config" {
    bucket = aws_s3_bucket.web_bucket.id
  
  index_document {
    suffix = var.index_document
  }
}

resource "aws_s3_bucket_public_access_block" "web_bucket_public_access" {
    bucket = aws_s3_bucket.web_bucket.id

    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}
resource "aws_s3_bucket_policy" "web_policy" {
  bucket = aws_s3_bucket.web_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = ["s3:GetObject"],
        Effect    = "Allow",
        Resource  = ["${aws_s3_bucket.web_bucket.arn}/*"],
        Principal = "*"
      },
    ]
  })
  depends_on = [ aws_s3_bucket_public_access_block.web_bucket_public_access ]
}
