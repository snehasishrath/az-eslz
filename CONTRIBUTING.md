# Contributing to Azure Enterprise-Scale Landing Zone (ESLZ)

We welcome contributions to this project! Please follow the guidelines below to ensure a smooth contribution process.

## How to Contribute

1. **Fork the Repository**:
   - Create a fork of this repository in your GitHub account.

2. **Clone the Repository**:
   - Clone your forked repository to your local machine:
     ```bash
     git clone https://github.com/<your-username>/az-eslz.git
     cd az-eslz
     ```

3. **Create a Branch**:
   - Create a new branch for your feature or bug fix:
     ```bash
     git checkout -b feature/your-feature-name
     ```

4. **Make Changes**:
   - Add your changes to the appropriate files.
   - Ensure your code follows the project's coding standards.

5. **Test Your Changes**:
   - Test your changes locally to ensure they work as expected.
   - Use tools like `terraform validate` and `terraform plan` to validate your Terraform configurations.

6. **Commit Your Changes**:
   - Write clear and concise commit messages:
     ```bash
     git add .
     git commit -m "Add feature: your-feature-name"
     ```

7. **Push Your Changes**:
   - Push your branch to your forked repository:
     ```bash
     git push origin feature/your-feature-name
     ```

8. **Submit a Pull Request**:
   - Open a pull request (PR) from your branch to the `main` branch of this repository.
   - Provide a detailed description of your changes in the PR.

## Code of Conduct

Please adhere to the [Code of Conduct](CODE_OF_CONDUCT.md) when contributing to this project.

## Reporting Issues

If you encounter any issues, please open an issue in the repository with a detailed description and steps to reproduce the problem.

## Style Guide

- Follow the [Terraform Style Guide](https://www.terraform.io/docs/language/syntax/style.html).
- Use meaningful variable names and comments.
- Ensure all resources are tagged appropriately.

## License

By contributing to this project, you agree that your contributions will be licensed under the [MIT License](LICENSE).