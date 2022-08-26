remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
        storage_account_name = "terraformstatemuchiaroni"
        key = "${path_relative_to_include()}/terraform.tfstate"
        container_name = "terragrunt"
  }
}


inputs = {
  tags = {
    Terraform = "true"
    Environment = "dev"
    terragrunt_parent = "true"
    resource = "lab"
  }
  resource_group = "terragrunt-lab"
  region = local.dev_region_vars.locals.region
}

locals {
  dev_region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
}

