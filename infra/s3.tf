resource "aws_s3_bucket_server_side_encryption_configuration" "fredku3" {
  bucket = aws_s3_bucket.analyticsbucket.bucket
}







