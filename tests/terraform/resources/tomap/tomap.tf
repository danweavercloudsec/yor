resource "aws_security_group" "sample" {
  name = "${var.this}-sample"

  tags = merge(var.tags, tomap({ "Name" = format("%s-sample", var.this) }), {
    yor_trace = "abff79a3-9880-402b-81d4-6ad361a7556c"
  })
}