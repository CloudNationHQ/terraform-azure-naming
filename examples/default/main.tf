module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.24"
}

module "naming_with_suffix" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.24"

  suffix = ["dev", "001"]
}

module "naming_with_prefix_suffix" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.24"

  prefix = ["myorg"]
  suffix = ["prod", "west"]
}

module "naming_custom_seed" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.24"

  suffix                 = ["test"]
  unique-seed            = "abc123"
  unique-length          = 6
  unique-include-numbers = false
}

output "storage_account_basic" {
  description = "Basic storage account name"
  value       = module.naming.storage_account.name_unique
}

output "storage_account_with_suffix" {
  description = "Storage account name with suffix"
  value       = module.naming_with_suffix.storage_account.name_unique
}

output "storage_account_with_prefix_suffix" {
  description = "Storage account name with prefix and suffix"
  value       = module.naming_with_prefix_suffix.storage_account.name_unique
}

output "storage_account_custom_seed" {
  description = "Storage account name with custom seed"
  value       = module.naming_custom_seed.storage_account.name_unique
}

output "key_vault_basic" {
  description = "Basic key vault name"
  value       = module.naming.key_vault.name_unique
}

output "key_vault_with_suffix" {
  description = "Key vault name with suffix"
  value       = module.naming_with_suffix.key_vault.name_unique
}

output "resource_group_with_prefix_suffix" {
  description = "Resource group name with prefix and suffix"
  value       = module.naming_with_prefix_suffix.resource_group.name_unique
}

output "unique_seeds" {
  description = "Unique seeds from different configurations"
  value = {
    basic        = module.naming.unique-seed
    with_suffix  = module.naming_with_suffix.unique-seed
    custom_seed  = module.naming_custom_seed.unique-seed
  }
}
