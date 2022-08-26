terraform {
    source = "git::git@github.com:vimuchiaroni/azure-storageaccount-terraform-module.git//.?ref=main"
}


inputs = {
  storage_account_name = "comprasdev2"
  account_tier = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  enable_https_traffic_only = true
  enable_static_website = false

}

include "root" {
  path = find_in_parent_folders()
}