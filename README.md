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
