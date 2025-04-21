variable "location" {
  description = "Default Azure region for resources"
  type        = string
  default     = "eastus"
  validation {
    condition     = contains(["eastus", "eastus2", "westus", "westus2"], var.location)
    error_message = "The location must be one of: eastus, eastus2, westus, westus2."
  }
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {
    environment = "dev"
    project     = "az-eslz"
  }
  validation {
    condition     = length(var.tags) > 0
    error_message = "Tags map cannot be empty."
  }
}