# Terraform CLI Commands

A concise reference for essential Terraform lifecycle, state, and utility commands.

---

## Core Workflow

| Command                  | Action                                              | Common Flags                                |
| :----------------------- | :-------------------------------------------------- | :------------------------------------------ |
| **`terraform init`**     | Initializes directory, downloads providers/modules. | `-upgrade`, `-reconfigure`                  |
| **`terraform validate`** | Checks syntax and configuration validity.           | None                                        |
| **`terraform plan`**     | Previews infrastructure changes (Dry-run).          | `-out=file.tfplan`, `-var-file=vars.tfvars` |
| **`terraform apply`**    | Executes changes to match desired state.            | `file.tfplan`, `-auto-approve`              |
| **`terraform destroy`**  | Purges all managed remote infrastructure.           | `-auto-approve`                             |
