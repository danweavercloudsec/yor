resource aws_s3_bucket "test-bucket" {
  name = "test-bucket"
  tags = {
    yor_trace = "e49a9e52-99d1-44d6-a6dc-062b8a1d986b"
  }
}

resource tls_private_key "pem" {
  algorithm = "some-algo"
}