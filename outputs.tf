output "management_group_id" {
  description = "The ID of the management group created."
  value       = module.management.management_group_id
}

output "connectivity_vnet_id" {
  description = "The ID of the connectivity virtual network."
  value       = module.connectivity.vnet_id
}

output "landing_zone_ids" {
  description = "The IDs of the landing zones created."
  value       = module.landing_zones.landing_zone_ids
}