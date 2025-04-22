# Outputs for the Public IP Prefix module
output "public_ip_prefix_address" {
  description = "The Public IP Prefix address"
  value       = azurerm_public_ip_prefix.this.ip_prefix
}

# Module owners should include the full resource via a 'resource' output
# https://azure.github.io/Azure-Verified-Modules/specs/terraform/#id-tffr2---category-outputs---additional-terraform-outputs
output "resource" {
  description = "This is the full output for the resource."
  value       = azurerm_public_ip_prefix.this
}

output "resource_id" {
  description = "The ID of the Public IP Prefix"
  value       = azurerm_public_ip_prefix.this.id
}
