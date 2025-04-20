# Connectivity Module

This module sets up the networking components for the Azure enterprise-scale landing zone.

## Features
- Hub and spoke topology
- Virtual Network (VNet) creation
- Azure Firewall configuration

## Inputs
- `hub_vnet_name`: Name of the hub virtual network.
- `spoke_vnets`: List of spoke virtual networks.

## Outputs
- `vnet_id`: The ID of the created virtual network.