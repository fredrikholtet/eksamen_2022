resource " aws_s3_bucket_server_side_encryption_configuration" "_testigjen" {
  bucket = aws_s3_bucket.analyticsbucket.bucket
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}