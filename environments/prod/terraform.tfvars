rgs = {
    rg1 = {
        name = "prod-rg"
        location = "east-us"
    } 
}

storage_accounts = {
    sa1 = {
        name                     = "prodstorageaccount"
        resource_group_name      = "prod-rg"
        location                 = "east-us"
        account_tier             = "Standard"
        account_replication_type = "LRS"
    }
}