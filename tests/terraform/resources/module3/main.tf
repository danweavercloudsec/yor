resource "aws_s3_bucket" "bucket_module3" {
  bucket = "tf-test-bucket3"
  acl    = "public_read"
  versioning {
    enabled = false
  }

  tags = {
    "Name"    = "bucket3"
    yor_trace = "b6dbe177-599a-4506-aba5-018895897e9f"
  }
}
