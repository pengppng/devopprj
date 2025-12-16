# Terraform + Ansible Multi-Cloud Deployment

This project demonstrates a complete Infrastructure as Code (IaC) and Configuration Management workflow using **Terraform** and **Ansible** across **multiple cloud providers** including **DigitalOcean, AWS, and Google Cloud Platform (GCP)**.

The goal of this project is to provision a Linux server using Terraform and configure it using Ansible in an automated, repeatable, and cloud-agnostic manner.

---

## 📌 Project Overview

The workflow follows industry best practices:

```

Terraform  →  Provision Cloud Infrastructure
↓
Ansible → Configure Server & Deploy Application

```

This separation allows infrastructure provisioning and configuration management to be handled independently and efficiently.

---

## ☁️ Supported Cloud Providers

- **DigitalOcean** (Droplets)
- **Amazon Web Services (AWS)** – EC2
- **Google Cloud Platform (GCP)** – Compute Engine

You can use **any one** of these providers based on your preference.

---

## 📁 Project Structure

```

project/
├── terraform/
│   ├── digitalocean/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   ├── aws/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   └── gcp/
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
└── ansible/
├── inventory.ini
├── setup.yml
└── roles/
├── base/
├── nginx/
├── app/
└── ssh/

````

---

## 🛠 Prerequisites

### Local Machine
- Terraform ≥ 1.5
- Ansible ≥ 2.14
- SSH key pair (`~/.ssh/id_rsa`)

### Cloud Accounts
- DigitalOcean API token
- AWS IAM user with EC2 access
- GCP project with Compute Engine enabled

---

## 🚀 Terraform Setup

### DigitalOcean
```bash
cd terraform/digitalocean
terraform init
terraform apply
````

### AWS

```bash
cd terraform/aws
aws configure
terraform init
terraform apply
```

### GCP

```bash
export GOOGLE_APPLICATION_CREDENTIALS=~/gcp-key.json
cd terraform/gcp
terraform init
terraform apply
```

Each Terraform configuration outputs the public IP address of the created server.

---

## ⚙️ Ansible Configuration

### Update Inventory

After provisioning, add the server IP to the Ansible inventory file:

```ini
[web]
<SERVER_IP> ansible_user=ubuntu
```

### Run All Roles

```bash
ansible-playbook -i inventory.ini setup.yml
```

### Run a Specific Role

```bash
ansible-playbook -i inventory.ini setup.yml --tags nginx
ansible-playbook -i inventory.ini setup.yml --tags app
```

---

## 📦 Ansible Roles

| Role    | Description                                             |
| ------- | ------------------------------------------------------- |
| `base`  | Updates system, installs utilities, configures fail2ban |
| `ssh`   | Adds SSH public key to the server                       |
| `nginx` | Installs and configures Nginx                           |
| `app`   | Deploys static HTML application                         |

---

## 🌍 Application Deployment

The application is deployed to:

```
/var/www/html
```

Once deployment is complete, the website is accessible via:

```
http://<SERVER_IP>
```

---

## 🔐 Security Considerations

* SSH key-based authentication
* fail2ban enabled
* Least-privilege cloud credentials
* Separation of infrastructure and configuration concerns

---

## 🔁 Stretch Goals Implemented

* Multi-cloud deployment support
* Modular Terraform configurations
* Role-based Ansible execution using tags

Future enhancements may include:

* HTTPS with Let’s Encrypt
* Firewall and security group automation
* CI/CD integration
* Auto-generated Ansible inventory

---

## 🧠 Key Concepts Learned

* Infrastructure as Code (Terraform)
* Configuration Management (Ansible)
* Multi-cloud provisioning
* SSH automation
* Role-based configuration
* DevOps best practices