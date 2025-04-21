resource "azurerm_public_ip_prefix" "this" {
  location            = var.location
  name                = var.name # calling code must supply the name
  resource_group_name = var.resource_group_name
  ip_version          = var.ip_version
  prefix_length       = var.prefix_length
  sku                 = var.sku_name
  tags                = var.tags
}

# required AVM resources interfaces
resource "azurerm_management_lock" "this" {
  count = var.lock != null ? 1 : 0

  lock_level = var.lock.kind
  name       = coalesce(var.lock.name, "lock-${var.name}")
  scope      = azurerm_public_ip_prefix.this.id
}


