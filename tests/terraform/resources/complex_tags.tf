resource "aws_instance" "many_instance_tags" {
  ami           = ""
  instance_type = ""
  tags = merge({ "Name" = "tag-for-instance", "Environment" = "prod" },
    { "Owner" = "bridgecrew"
    },
    { "yor_trace" = "4329587194",
  "git_org" = "bana" })
}

resource "aws_alb" "alb_with_merged_tags" {
  tags = merge({ "Name" = "tag-for-alb", "Environment" = "prod" },
    { "yor_trace" = "4329587194",
  "git_org" = "bana" })
}

resource "aws_vpc" "vpc_tags_one_line" {
  cidr_block = ""
  tags = { "Name" = "tag-for-s3", "Environment" = "prod"
    yor_trace = "d47c9f33-67b7-4fc3-9791-eaec821952e8"
  }
}

resource "aws_s3_bucket" "bucket_var_tags" {
  tags = merge(var.tags, {
    yor_trace = "114cd9f8-72de-4f7b-af56-deae8161baef"
  })
}

variable "tags" {
  default = {
    "Name"        = "tag-for-s3"
    "Environment" = "prod"
  }
}

resource "aws_instance" "instance_merged_var" {
  ami           = ""
  instance_type = ""
  tags = merge(var.tags,
    { "yor_trace" = "4329587194",
  "git_org" = "bana" })
}

variable "new_env_tag" {
  default = {
    "Environment" = "old_env"
  }
}

resource "aws_instance" "instance_merged_override" {
  ami           = ""
  instance_type = ""
  tags = merge(var.new_env_tag, { "Environment" = "new_env" }, {
    yor_trace = "ef6eb7a9-884a-4c38-a6ab-18bdc7017a47"
  })
}

resource "aws_instance" "instance_empty_tag" {
  ami           = ""
  instance_type = ""
  tags = {
    yor_trace = "5141ec67-aad6-4f87-bedf-a5201001e5fa"
  }
}

resource "aws_instance" "instance_no_tags" {
  ami           = ""
  instance_type = ""
  tags = {
    yor_trace = "f0c197a4-74ea-40c4-b48d-2537f3d8d325"
  }
}

resource "aws_instance" "instance_null_tags" {
  ami           = ""
  instance_type = ""
  tags = {
    yor_trace = "4a84b590-c1f2-4b78-b7ae-3b1e1ec88d2f"
  }
}

resource "aws_autoscaling_group" "autoscaling_group_tagged" {
  // This resource should not be tagged
  tag {
    key                 = "Name"
    propagate_at_launch = false
    value               = "Mine"
  }
  max_size = 0
  min_size = 0
}

resource "aws_autoscaling_group" "autoscaling_group" {
  // This resource should not be tagged as well
  max_size = 0
  min_size = 0
}