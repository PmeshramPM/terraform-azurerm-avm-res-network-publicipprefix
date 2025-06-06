# required AVM interfaces
# remove only if not supported by the resource

variable "location" {
  type        = string
  description = "Azure region where the Public IP Prefix should be deployed."
  nullable    = false
}

variable "name" {
  type        = string
  description = "The name of the public IP Prefix."
}

variable "prefix_length" {
  type        = number
  description = "(Optional) Specifies the number of bits of the prefix. The value can be set between 0 (4,294,967,296 addresses) and 31 (2 addresses). Defaults to `28`(16 addresses). Changing this forces a new resource to be created."
}

# This is required for most resource modules
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Public IP Prefix."
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see <https://aka.ms/avm/telemetryinfo>.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
}

variable "ip_version" {
  type        = string
  default     = "IPv4"
  description = "(Optional) The IP Version to use, `IPv6` or `IPv4`. Changing this forces a new resource to be created. Default is `IPv4`."
}

variable "lock" {
  type = object({
    kind = string
    name = optional(string, null)
  })
  default     = null
  description = <<DESCRIPTION
Controls the Resource Lock configuration for this resource. The following properties can be specified:

- `kind` - (Required) The type of lock. Possible values are `\"CanNotDelete\"` and `\"ReadOnly\"`.
- `name` - (Optional) The name of the lock. If not specified, a name will be generated based on the `kind` value. Changing this forces the creation of a new resource.
DESCRIPTION

  validation {
    condition     = var.lock != null ? contains(["CanNotDelete", "ReadOnly"], var.lock.kind) : true
    error_message = "The lock level must be one of: 'None', 'CanNotDelete', or 'ReadOnly'."
  }
}

variable "sku_name" {
  type        = string
  default     = "Standard"
  description = "The SKU of the Public IP Prefix. Possible values are Standard and Basic."
}

variable "sku_tier" {
  type        = string
  default     = "Regional"
  description = "(Optional) The SKU Tier that should be used for the Public IP. Possible values are `Regional` and `Global`. Defaults to `Regional`. Changing this forces a new resource to be created."
}

# tflint-ignore: terraform_unused_declarations
variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) Tags of the resource."
}

variable "zones" {
  type        = set(string)
  default     = ["1", "2", "3"]
  description = "(Optional) The availability zones in which the Public IP Prefix should be deployed. Changing this forces a new resource to be created."
}
