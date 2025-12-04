# TerraPress (WordPress deployed on an EC2 instance using Terraform) 🟣🛠️

TerraPress (a play on Terraform and WordPress) is an infrastructure as code project that deploys WordPress on an EC2 instance using Terraform.

This project was made for learning purposes with a focus on understanding Terraform structure, modules, variables and automation.

## Project Overview - What It Uses

TerraPress uses Terraform to create:
- A custom VPC
- Subnet
- Internet gateway
- Route table
- Security group
- EC2 instance running WordPress
- Cloud-init script that automates all WordPress and database setup

## Architecture diagram
![TERRAPRESS](https://github.com/user-attachments/assets/bf5e454c-6fbb-473f-bf21-ccdb553117b2)


## Project Tree
```
.
├── README.md
├── cloud-init.sh
├── main.tf
├── modules
│   ├── ec2
│   │   ├── main.tf
│   │   └── variables.tf
│   └── vpc
│       ├── main.tf
│       └── outputs.tf
├── provider.tf
├── terraform.tfstate
└── terraform.tfstate.backup
```

## How This Works

**1st** - Terraform builds the AWS network using:
- VPC
- Subnet
- Internet gateway
- Route table

Then links them all together.

**2nd** - Terraform creates security groups:

Inbound:
- HTTP (80)
- SSH (22)

Outbound:
- All (-1)

**3rd** - Terraform deploys an EC2 instance with a cloud-init script that:
- Installs Apache
- Installs PHP and extensions
- Downloads the latest WordPress build
- Sets correct permissions
- Sets up MySQL database and links to WordPress
- Configures WordPress correctly with necessary API keys
- Creates WordPress virtual host
- Makes the server ready to use for WordPress account creation and use

## Deployment Instructions

```bash
git clone https://github.com/iqzy21/TerraPress.git
cd TerraPress
terraform init
terraform plan
terraform apply
```

Open your EC2 instance's public IPv4 address in the browser.

To destroy everything, run:
```bash
terraform destroy
```

## Disclaimer

Requires an AWS account and credentials configured via environment variables or AWS CLI.

**Project created by Iqbaal Elhajoui (IQZY)**
