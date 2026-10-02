# 🏗️ Nexus Infra

Terraform-based infrastructure-as-code for provisioning **Azure** resources across multiple environments. This repository provides reusable modules and environment-specific configurations for managing resource groups and storage accounts.

---

## 📋 Overview

**Nexus Infra** is designed to standardize and automate Azure cloud infrastructure deployment using [Terraform](https://www.terraform.io/). It follows a modular structure that separates reusable components from environment-specific settings, making it easy to deploy consistent infrastructure to **preprod** and **prod**.

### ✨ What It Provisions

| Resource | Description |
|----------|-------------|
| 🗂️ **Resource Groups** | Logical containers for Azure resources |
| 💾 **Storage Accounts** | Azure Blob/File storage with configurable tier and replication |

---

## 🗂️ Project Structure

```
nexus-infra/
├── 📁 environments/
│   ├── preprod/          # Pre-production environment
│   │   ├── main.tf
│   │   ├── variable.tf
│   │   └── terraform.tfvars
│   └── prod/               # Production environment
│       ├── main.tf
│       ├── variable.tf
│       └── terraform.tfvars
├── 📁 module/
│   ├── azure_resource_group/       # Resource group module
│   │   ├── main.tf
│   │   └── variables.tf
│   └── azurerm_storage_account/    # Storage account module
│       ├── main.tf
│       └── variables.tf
├── .gitignore
└── README.md
```

---

## 🌍 Environments

| Environment | Resource Group | Storage Account | Location |
|-------------|----------------|-----------------|----------|
| 🧪 **Preprod** | `preprod-rg` | `preprodstorageaccount` | East US |
| 🚀 **Prod** | `prod-rg` | `prodstorageaccount` | East US |

Each environment is configured independently via its own `terraform.tfvars` file.

---

## ⚙️ Prerequisites

Before you begin, ensure you have the following installed and configured:

- ☁️ [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) — authenticated to your Azure subscription
- 🔧 [Terraform](https://www.terraform.io/downloads) (v1.0+ recommended)
- 🔐 Appropriate Azure RBAC permissions to create resource groups and storage accounts

---

## 🚀 Getting Started

### 1️⃣ Authenticate with Azure

```bash
az login
az account set --subscription "<your-subscription-id>"
```

### 2️⃣ Navigate to an Environment

Choose the environment you want to deploy:

```bash
# For pre-production
cd environments/preprod

# For production
cd environments/prod
```

### 3️⃣ Initialize Terraform

```bash
terraform init
```

### 4️⃣ Review the Plan

```bash
terraform plan -var-file="terraform.tfvars"
```

### 5️⃣ Apply the Configuration

```bash
terraform apply -var-file="terraform.tfvars"
```

---

## 📦 Modules

### 🗂️ `azure_resource_group`

Creates one or more Azure resource groups using a `for_each` loop.

**Input variables:**

| Variable | Type | Description |
|----------|------|-------------|
| `resource_groups` | `map` | Map of resource group definitions (`name`, `location`) |

### 💾 `azurerm_storage_account`

Creates Azure storage accounts with configurable tier and replication type.

**Input variables:**

| Variable | Type | Description |
|----------|------|-------------|
| `storage_accounts` | `map` | Map of storage account definitions |

**Storage account properties:**

| Property | Example | Description |
|----------|---------|-------------|
| `name` | `prodstorageaccount` | Globally unique storage account name |
| `resource_group_name` | `prod-rg` | Target resource group |
| `location` | `east-us` | Azure region |
| `account_tier` | `Standard` | Performance tier |
| `account_replication_type` | `LRS` | Replication strategy |

---

## 🔧 Customization

To add or modify resources, edit the `terraform.tfvars` file in the target environment:

```hcl
rgs = {
  rg1 = {
    name     = "my-resource-group"
    location = "east-us"
  }
}

storage_accounts = {
  sa1 = {
    name                     = "mystorageaccount"
    resource_group_name      = "my-resource-group"
    location                 = "east-us"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}
```

---

## 🧹 Cleanup

To destroy all resources in an environment:

```bash
cd environments/<env>
terraform destroy -var-file="terraform.tfvars"
```

> ⚠️ **Warning:** This permanently deletes all provisioned resources. Use with caution, especially in **prod**.

---

## 📝 Notes

- 🔒 Never commit `.tfstate` files or secrets — they are excluded via `.gitignore`
- 🏷️ Use consistent naming conventions across environments for easier management
- 🔄 Always run `terraform plan` before `apply` to review changes

---

## 📄 License

This project is part of the Nexus MLOps practice infrastructure.
