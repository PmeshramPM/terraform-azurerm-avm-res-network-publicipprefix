variable "enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see <https://aka.ms/avm/telemetryinfo>.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
}

variable "prefix_length" {
  type        = number
  default     = 28
  description = "The length of the Public IP Prefix"
}

variable "tags" {
  type        = map(any)
  default     = null
  description = "Map of tags to assign to the resources."
}


