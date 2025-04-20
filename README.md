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
