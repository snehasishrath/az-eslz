# Management Module

This module sets up the management group hierarchy, policies, and RBAC roles for the Azure enterprise-scale landing zone.

## Features
- Management group creation
- Azure Policy assignments
- Role-Based Access Control (RBAC)

## Inputs
- `management_group_name`: Name of the management group.
- `policy_definitions`: List of policy definitions to assign.

## Outputs
- `management_group_id`: The ID of the created management group.