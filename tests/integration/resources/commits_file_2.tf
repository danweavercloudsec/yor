


resource "aws_s3_bucket" "f2" {
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "yor-test-2"
  acl           = "private"
  force_destroy = true

  tags = {
    yor_trace = "ba08bdc4-fff0-4c71-85f3-c25c994dce86"
  }
}