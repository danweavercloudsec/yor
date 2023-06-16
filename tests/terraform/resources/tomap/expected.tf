resource "aws_security_group" "sample" {
  name = "${var.this}-sample"

  tags = merge(var.tags, tomap({ "Name" = format("%s-sample", var.this) }), {
    test_tag = "test_value"
    }, {
    yor_trace = "5358a3ce-47d7-4023-9e7f-2a8ab4c041d4"
  })
}