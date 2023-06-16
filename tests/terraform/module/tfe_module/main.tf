module "tfe_module" {
  source = "app.terraform.io/path/to/module/aws"
  tags = {
    Application = "application"
    Env         = var.env
    yor_trace   = "c291deb7-555d-4c4c-87d1-d33af6a2d54a"
  }
}