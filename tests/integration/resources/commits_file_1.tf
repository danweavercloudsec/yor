provider "aws" {

}

resource "aws_s3_bucket" "financials" {
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "yor-test-1"
  acl           = "private"
  force_destroy = true

  tags = {
    yor_trace = "06af8047-a314-4d9e-85e4-10b52c4aeef8"
  }
}