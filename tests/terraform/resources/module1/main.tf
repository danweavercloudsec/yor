resource "aws_s3_bucket" "bucket_module1" {
  bucket = "tf-test-bucket-destination-12345"
  acl    = "private"
  versioning {
    enabled = false
  }
  tags = {
    yor_trace = "f644e912-7ef9-448b-b022-919da184de5f"
  }
}

module "moduleRef" {
  source = "../module2"
}
