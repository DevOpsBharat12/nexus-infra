rgs = {
  rg1 = {
    name     = "preprod-rg"
    location = "east-us"
  }
}

storage_accounts = {
  sa1 = {
    name                     = "preprodstorageaccount"
    resource_group_name      = "preprod-rg"
    location                 = "east-us"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}