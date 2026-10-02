rgs = {
  rg1 = {
    name     = "rg-nexus"
    location = "east-us"
  }
}

storage_accounts = {
  sa1 = {
    name                     = "stnexusstate01"
    resource_group_name      = "rg-nexus"
    location                 = "east-us"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}