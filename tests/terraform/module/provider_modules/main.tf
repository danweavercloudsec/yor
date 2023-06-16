module "project-factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "11.0.0"
  labels = {
    test      = "true"
    yor_trace = "cc2722c7-8a82-4b37-b018-f848a0fd597a"
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.2.0"
  tags = {
    test      = "true"
    yor_trace = "78958a03-1a19-498c-b97f-f0f5d563a141"
  }
}

module "project-factory_github" {
  source = "github.com/terraform-google-modules/terraform-google-project-factory"
  labels = {
    test      = "true"
    yor_trace = "81e74f86-647c-4975-97c1-29b75dbc6179"
  }
}

module "project-factory_git" {
  source = "git@github.com:terraform-google-modules/terraform-google-project-factory.git"
  labels = {
    test      = "true"
    yor_trace = "e8c2654b-2ecf-44c8-b3be-6243c6fd86aa"
  }
}

module "caf" {
  source = "aztfmod/caf/azurerm"
  tags = {
    test      = "true"
    yor_trace = "74e444a2-e869-44d1-8000-39a8d8415867"
  }
}

module "caf" {
  source = "git@github.com:aztfmod/terraform-azurerm-caf.git"
  tags = {
    test      = "true"
    yor_trace = "74e444a2-e869-44d1-8000-39a8d8415867"
  }
}

module "bastion" {
  source = "oracle-terraform-modules/bastion/oci"
  freeform_tags = {
    test      = "true"
    yor_trace = "0a1f1b2c-d289-4df8-a161-b1bad638401f"
  }
}

module "run-common_logs" {
  // Tags attribute is extra_tags
  source  = "claranet/run-common/azurerm//modules/logs"
  version = "3.0.0"
  extra_tags = {
    test      = "true"
    yor_trace = "f38ea78c-4e82-4718-be26-a07bbc3676ac"
  }
}