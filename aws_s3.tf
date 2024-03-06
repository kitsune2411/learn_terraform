# Purpose: Create an S3 bucket with the following properties:
resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.app_s3.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Purpose: Create a public access block for the S3 bucket
resource "aws_s3_bucket_public_access_block" "pab" {
  bucket = aws_s3_bucket.app_s3.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Purpose: Create an ACL for the S3 bucket
resource "aws_s3_bucket_acl" "acl" {
  bucket     = aws_s3_bucket.app_s3.id
  depends_on = [aws_s3_bucket_ownership_controls.ownership]
  acl        = "private"

}



