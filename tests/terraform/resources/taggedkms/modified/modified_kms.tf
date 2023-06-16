resource "aws_kms_key" "logs_key" {
  # key does not have rotation enabled
  description = "modified_description"

  deletion_window_in_days = 7
  tags = {
    yor_trace = "f3ba098b-a322-4287-9178-18528f4f81cf"
  }
}

resource "aws_kms_alias" "logs_key_alias" {
  name          = "alias/${local.resource_prefix.value}-logs-bucket-key"
  target_key_id = "${aws_kms_key.logs_key.key_id}"
}
