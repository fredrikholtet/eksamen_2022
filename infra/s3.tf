
resource "aws_s3_bucket" "analytichelvete" {
  bucket = "analytics-${var.candidate_id}"
}
