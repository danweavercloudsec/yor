resource "aws_s3_bucket" "bucket_module2" {
  bucket = "tf-test-bucket2"
  acl    = "public_read"
  versioning {
    enabled = false
  }

  tags = {
    "Name"    = "bucket2"
    yor_trace = "24e3d6b4-bd52-4a5a-993c-8e1f139c297b"
  }
}

module "moduleRef2" {
  source = "../module3"
}
