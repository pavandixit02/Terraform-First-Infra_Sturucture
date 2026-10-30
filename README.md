# AWS Infrastructure Management with Terraform

## Project Summary

This repository presents a small Infrastructure as Code (IaC) project built around Amazon Web Services (AWS). It focuses on the relationship between Terraform, AWS authentication, and the files used to describe and track cloud infrastructure.

The project is intended to demonstrate foundational cloud infrastructure concepts in a clear, maintainable repository. Its emphasis is on infrastructure definition, resource management, configuration tracking, and responsible handling of cloud credentials and state data.

## Project Objectives

The main objectives of this project are to:

- Explore how declarative infrastructure management differs from manual cloud administration.
- Understand the role of Terraform providers when working with cloud platforms.
- Recognize how local AWS credential configuration supports authenticated API access.
- Identify the purpose of the main Terraform configuration and state files.
- Apply source-control and security principles to infrastructure repositories.
- Build a foundation for more advanced cloud automation and DevOps projects.

## Terraform and Infrastructure as Code

[Terraform](https://developer.hashicorp.com/terraform) is an Infrastructure as Code tool developed by HashiCorp. It enables teams to describe infrastructure in human-readable configuration files and manage supported resources through providers.

With IaC, infrastructure definitions can be reviewed, maintained, shared, and tracked as code. This helps make infrastructure changes more transparent and repeatable, particularly when projects grow beyond a small number of manually managed resources.

### Core Concepts

**Infrastructure as Code (IaC)**  
A practice of representing infrastructure in files so its intended design can be reviewed and maintained alongside application code.

**Provider**  
A Terraform component that integrates with an external platform or service. The AWS provider allows Terraform to interact with supported AWS resources.

**Resource**  
A declaration representing an infrastructure object that Terraform can manage, such as an EC2 instance.

**Desired state**  
The infrastructure condition expressed by the configuration. Terraform uses this declaration when determining how managed resources should be reconciled.

**State**  
A record Terraform maintains to associate configuration with the infrastructure it manages. State is important for planning changes and tracking managed objects.

## AWS Authentication Model

Terraform generally does not use an interactive AWS Management Console session as its authentication mechanism. Instead, its AWS provider obtains credentials from supported sources and uses them to sign requests to AWS APIs.

For a local development environment, a common arrangement is to configure credentials through the AWS Command Line Interface (AWS CLI). The standard shared files are:

```text
~/.aws/credentials
~/.aws/config
```

The credentials file can store access-key information, while the configuration file can hold settings such as named profiles and default preferences. The AWS provider may also obtain credentials through environment variables, IAM roles, IAM Identity Center, or other supported mechanisms. The source selected depends on the environment and the AWS SDK credential resolution process.

This separation is useful because the infrastructure definition does not need to contain secret access keys. Authentication can be managed independently from the files that describe infrastructure.

### Credential Safety

- Do not write access keys, secret keys, or session tokens directly into Terraform configuration.
- Do not upload credential files to a public or shared source-code repository.
- Prefer temporary credentials or IAM roles when practical.
- Apply least-privilege permissions so the identity has only the access it requires.
- Review repository history if a secret is accidentally committed; removing it from the latest version alone may not remove it from earlier commits.
- Rotate exposed credentials promptly and follow the relevant AWS security guidance.

## Repository Layout

```text
.
├── Images/
│   ├── command-run.png
│   ├── EC2-Instace.png
│   └── main-file-code.png
├── main.tf
└── terraform.tfstate
```

### Repository Components

| Component | Role in the project |
|---|---|
| `Images/` | Holds visual reference material associated with the project. |
| `command-run.png` | Captures terminal activity associated with the project. |
| `EC2-Instace.png` | Provides a visual reference for the AWS resource view. |
| `main-file-code.png` | Shows the configuration file in the code editor. |
| `main.tf` | The primary Terraform configuration file for this project. |
| `terraform.tfstate` | Local state data used by Terraform to track the infrastructure it manages. |

The image files are listed to document the repository layout; this README does not embed or display them.

## Why Terraform State Matters

Terraform state helps maintain the connection between the declarations in a project and the real infrastructure tracked by Terraform. It stores resource-related information used during planning and subsequent management operations.

The local file `terraform.tfstate` is therefore operational data, not simply a documentation file. Depending on the resources and attributes involved, it may expose infrastructure details or sensitive values.

### State Management Recommendations

- Treat state as sensitive data and restrict access to it.
- Avoid publishing local state files in public repositories.
- Exclude state files from source control unless a deliberate, secure workflow specifically requires otherwise.
- For team environments, evaluate a remote backend with appropriate access controls, encryption, and locking capabilities.
- Keep backups and recovery procedures aligned with the importance of the managed infrastructure.
- Avoid manually changing state contents; use documented Terraform state-management features when intervention is necessary.

## Engineering Practices Demonstrated

This project introduces practices that are useful in cloud engineering and DevOps work:

### Declarative Infrastructure

Infrastructure requirements are represented as configuration rather than being recorded only as a series of manual console actions.

### Separation of Configuration and Credentials

Infrastructure code and authentication material are managed separately, reducing the risk of exposing secrets in source control.

### Change Awareness

Infrastructure-as-code workflows support review of proposed changes before those changes affect cloud resources. This is an important habit for reducing accidental modifications.

### Source-Control Readiness

Configuration files can be tracked in Git so changes are reviewable and the project can be maintained over time. Sensitive runtime data must be handled separately from ordinary source files.

### Resource Accountability

Cloud resources should have clear ownership, appropriate permissions, and a defined purpose. They should also be reviewed periodically so unused resources do not remain active unnecessarily.

## Security, Reliability, and Cost Awareness

Cloud resources may create costs even in small learning environments. Charges depend on the resource type, Region, storage, network usage, account eligibility, and the current AWS pricing terms. Check the applicable pricing before using resources and review the account's billing information regularly.

For a safer infrastructure workflow:

- Use an AWS identity with narrowly scoped permissions.
- Keep secrets out of source files and repository history.
- Protect state files and other operational artifacts.
- Review infrastructure changes carefully before approving them.
- Use clear resource tags and naming conventions where appropriate.
- Monitor the resources that exist in the AWS account and remove those no longer required through the workflow that manages them.

## Skills and Concepts Covered

This project supports learning in the following areas:

- Infrastructure as Code fundamentals
- Terraform's provider and resource model
- AWS API authentication concepts
- Local AWS CLI credential configuration
- Terraform state awareness
- Git repository hygiene for infrastructure projects
- Cloud security and least-privilege access
- Cost awareness when working with cloud resources

## Further Reading

- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [AWS Provider for Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS CLI Configuration Files](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
- [AWS Identity and Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)
- [Amazon EC2 Documentation](https://docs.aws.amazon.com/ec2/)
- [Terraform State Documentation](https://developer.hashicorp.com/terraform/language/state)

---

**Project category:** Cloud Infrastructure / Infrastructure as Code  
**Platform:** Amazon Web Services (AWS)  
**IaC tool:** Terraform  
**Configured AWS Region:** `eu-north-1` (Europe — Stockholm)
