provider "aws" {
  region  = "us-east-1"
  profile = "dev2"
  version = "3.27"
}

resource "aws_s3_bucket" "bucket_with_var" {
  bucket = "tf-test-bucket-destination-12345"
  acl    = "private"
  versioning {
    enabled = false
  }

  tags = merge(var.bucket_tags, {
    yor_trace = "04aee5e3-b6c8-4da0-8ef8-bdd4287be856"
  })
}
