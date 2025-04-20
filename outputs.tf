#output "private_endpoints" {
#  description = <<DESCRIPTION
#  A map of the private endpoints created.
#  DESCRIPTION
#  value       = var.private_endpoints_manage_dns_zone_group ? azurerm_private_endpoint.this_managed_dns_zone_groups : azurerm_private_endpoint.this_unmanaged_dns_zone_groups
#}

output "public_ip_prefix_address" {
  description = "The Public IP Prefix address"
  value       = azurerm_public_ip_prefix.this.ip_prefix
}

output "public_ip_prefix_id" {
  description = "The ID of the Public IP Prefix"
  value       = azurerm_public_ip_prefix.this.id
}

# Module owners should include the full resource via a 'resource' output
# https://azure.github.io/Azure-Verified-Modules/specs/terraform/#id-tffr2---category-outputs---additional-terraform-outputs
output "resource" {
  description = "This is the full output for the resource."
  value       = azurerm_public_ip_prefix.this # TODO: Replace this dummy resource azurerm_resource_group.TODO with your module resource
}
