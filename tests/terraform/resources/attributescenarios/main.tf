resource "aws_security_group" "cluster" {
  name_prefix = "acme"
  description = "EKS cluster security group"
  vpc_id      = "vpc-123456"
  tags = merge(
    var.tags,
    {
      "Name" = "${var.env}-eks_cluster_sg"
    },
    {
      yor_trace = "70d5a591-3a12-4642-b1af-431203d9bd75"
  })
}

resource "aws_vpc" "vpc_tags_one_line" {
  cidr_block = ""
  tags = { "Name" = "tag-for-s3", "Environment" = "prod"
    yor_trace = "4b5ad578-6989-4fe5-a9fc-013e078d6490"
  }
}

resource "aws_instance" "no_tags" {
  ami           = "some-ami"
  instance_type = "t3.micro"
  tags = {
    yor_trace = "a73e5af1-3b9c-441b-b537-874e28a4e481"
  }
}

resource "aws_instance" "simple_tags" {
  ami           = "some-ami"
  instance_type = "t3.micro"

  tags = {
    Name      = "my-instance"
    yor_trace = "416a006f-1aae-480e-9b35-c40e16a0a006"
  }
}

resource "aws_instance" "rendered_tags" {
  ami           = "some-ami"
  instance_type = "t3.micro"

  tags = merge(var.tags, {
    yor_trace = "bddd25c7-d306-4447-89f6-cb8a3b2a7073"
  })
}

resource "aws_instance" "merge_tags" {
  ami           = "some-ami"
  instance_type = "t3.micro"

  tags = merge(var.tags,
    {
      Name = "merged-tags-instance",
      Env  = var.env
      }, {
      yor_trace = "45e95d5f-9bc4-4138-b672-81d0f11b1dee"
  })
}

variable "tags" {
  default = {}
  type    = map(string)
}

variable "env" {
  default = "dev"
  type    = string
}