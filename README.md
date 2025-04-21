## Getting Started

This project provides a Terraform-based implementation of an Azure enterprise-grade landing zone aligned with the Microsoft Cloud Adoption Framework (CAF). Follow the steps below to set up the project:

1. **Install Prerequisites**:
   - Terraform 1.x
   - Azure CLI
   - (Optional) GitHub CLI or Azure DevOps CLI for CI/CD integration

2. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd az-eslz
   ```

3. **Set Up Backend Configuration**:
   - Configure Azure Storage for remote state management.
   - Use Key Vault for secrets.

4. **Initialize Terraform**:
   ```bash
   terraform init
   ```

5. **Plan and Apply**:
   - Customize `terraform.tfvars` for your environment.
   - Run the following commands:
     ```bash
     terraform plan -var-file="terraform.tfvars"
     terraform apply -var-file="terraform.tfvars"
     ```

6. **Verify Deployment**:
   - Check Azure Portal for deployed resources.
   - Validate policies, RBAC, and networking setup.

## Enhanced Documentation

### Overview
This project implements an Azure enterprise-grade landing zone aligned with the Microsoft Cloud Adoption Framework (CAF). It provides a modular, scalable, and environment-specific setup for managing multiple Azure subscriptions.

### Project Structure
- **`main.tf`**: Entry point for Terraform configuration, including backend setup and module integration.
- **`variables.tf`**: Defines reusable variables for the project.
- **`outputs.tf`**: Exposes key outputs from the modules.
- **`environments/`**: Contains environment-specific variable files (`dev.tfvars`, `test.tfvars`, `prod.tfvars`).
- **`modules/`**: Houses modular configurations for management, connectivity, and landing zones.
  - **`management/`**: Sets up management groups, policies, and RBAC.
  - **`connectivity/`**: Configures networking components like VNets and firewalls.
  - **`landing_zones/`**: Manages subscriptions and workload-specific configurations.

### Usage
1. **Initialize Terraform**:
   ```bash
   terraform init
   ```

2. **Select Environment**:
   Use the appropriate `.tfvars` file for your environment (e.g., `dev.tfvars`).

3. **Plan and Apply**:
   ```bash
   terraform plan -var-file="environments/dev.tfvars"
   terraform apply -var-file="environments/dev.tfvars"
   ```

4. **Verify Deployment**:
   - Check the Azure Portal for deployed resources.
   - Validate policies, RBAC, and networking setup.

### Modules
#### Management Module
- **Purpose**: Sets up management group hierarchy, policies, and RBAC roles.
- **Key Resources**:
  - `azurerm_management_group`
  - `azurerm_policy_assignment`

#### Connectivity Module
- **Purpose**: Configures networking components like hub-and-spoke topology and Azure Firewall.
- **Key Resources**:
  - `azurerm_virtual_network`
  - `azurerm_subnet`
  - `azurerm_firewall`

#### Landing Zones Module
- **Purpose**: Manages subscriptions and workload-specific configurations.
- **Key Resources**:
  - `azurerm_subscription`
  - `azurerm_role_assignment`

### Best Practices
- **State Management**: Use remote state with Azure Storage for collaboration.
- **Environment Separation**: Maintain separate `.tfvars` files for dev, test, and prod.
- **Security**: Store sensitive information in Azure Key Vault.
- **Compliance**: Align with CAF naming conventions and tagging strategy.

## Contributing

Contributions are welcome! Please follow the [contribution guidelines](CONTRIBUTING.md) when submitting changes.

## Project Structure

- Use a modular architecture:
  - `/modules`
  - `/environments`
  - `/core`
  - `/management`
  - `/connectivity`
- Provide separate layers for platform and workload-specific configurations.
- Enable environment separation (e.g., dev, test, prod).

## Landing Zone Components

- **Management group hierarchy** (root, platform, landing zones, sandboxes).
- **Azure Policy** and **Initiatives** for governance and compliance.
- **Role-Based Access Control (RBAC)** with custom roles.
- **Subscription creation** and configuration.
- **Networking**:
  - Hub & spoke topology
  - Azure Firewall
  - DNS
  - (Optional) Virtual WAN
- **Identity integration**:
  - Azure AD tenant setup
  - (Optional) Entra ID PIM
- **Monitoring**:
  - Log Analytics
  - Diagnostic Settings

## Tooling & Best Practices

- Use **Terraform 1.x**.
- Integrate with **Terraform backend** (e.g., Azure Storage with remote state locking via Azure Blob + Key Vault for secrets).
- Optionally include **Azure DevOps** or **GitHub Actions** pipelines for automation.
- Use `.tfvars`, workspace separation, and state management per environment.
- Comply with **CAF naming conventions** and tagging strategy.

## Security

- Use **Key Vault** for sensitive information.
- Implement network security baselines:
  - NSGs
  - Firewall rules
- Ensure secure bootstrapping (e.g., SPN with limited permissions).

## Documentation

- `README.md` explaining setup steps, module usage, and configuration.
- Example `terraform.tfvars` files for common scenarios.

## Optional (Bonus)

- Include blueprint for workload landing zones (e.g., App, Data, AI).
- Add YAML input support for environment-driven provisioning.
- Include automated cost estimation or budget alerts.
