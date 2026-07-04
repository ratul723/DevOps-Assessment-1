# Terraform CLI Commands

A concise reference for essential Terraform lifecycle, state, and utility commands.

---

## 1. Core Workflow

| Command                  | Action                                              | Common Flags                                |
| :----------------------- | :-------------------------------------------------- | :------------------------------------------ |
| **`terraform init`**     | Initializes directory, downloads providers/modules. | `-upgrade`, `-reconfigure`                  |
| **`terraform validate`** | Checks syntax and configuration validity.           | None                                        |
| **`terraform plan`**     | Previews infrastructure changes (Dry-run).          | `-out=file.tfplan`, `-var-file=vars.tfvars` |
| **`terraform apply`**    | Executes changes to match desired state.            | `file.tfplan`, `-auto-approve`              |
| **`terraform destroy`**  | Purges all managed remote infrastructure.           | `-auto-approve`                             |

---

## 2. State Management

| Command                              | Action                                                        |
| :----------------------------------- | :------------------------------------------------------------ |
| **`terraform state list`**           | Lists all resources currently tracked in the state file.      |
| **`terraform state show <addr>`**    | Displays detailed attributes of a specific resource.          |
| **`terraform state mv <src> <dst>`** | Renames or moves a resource within the state file.            |
| **`terraform state rm <addr>`**      | Stops tracking a resource without deleting it from the cloud. |
| **`terraform refresh`**              | Syncs the state file with actual real-world infrastructure.   |

---

## 3. Utilities & Troubleshooting

- **`terraform fmt`**: Rewrites HCL files to canonical format (`-check` checks without overwriting, `-recursive` scans subdirectories).
- **`terraform console`**: Opens an interactive prompt to test expressions, variables, and functions.
- **`terraform output`**: Extracts output values from the state file (`-json` formats for automation scripts).
- **`terraform version`**: Shows current CLI and active provider plugin versions.

---

## 4. Standard Pipeline Sequence

`Modify HCL` ➔ `terraform fmt` ➔ `terraform init` ➔ `terraform plan` ➔ `terraform apply`
