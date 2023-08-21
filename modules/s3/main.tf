resource "aws_s3_bucket_public_access_block" "exampleS3" {
  bucket                  = var.s3_bucket_name
  
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true  
}





