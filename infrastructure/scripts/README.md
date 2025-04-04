# 🌐 Cloud Migration Project - Infra Setup & Automation

This project provides the configuration and tools to deploy and automate a microservices-based solution using Docker containers, infrastructure as code (IaC), and public cloud services (AWS, Azure, GCP).

---

## 📁 Repository Structure

```plaintext
.
├── cleanup.sh
├── README.md
├── deploy.sh
```

---

## 🚀 Objective

Migrate a monolithic application to a cloud-based microservices architecture, focusing on:

- Scalability 📈
- Elasticity ⚖️
- Security 🔒
- Client Isolation 🧩
- CI/CD Automation 🤖
- FinOps Optimization 💸

---

## 🧪 Prerequisites

- Docker 🐳
- Node.js & npm
- Terraform / Bicep (optional, per cloud)
- Cloud provider accounts (AWS / Azure / GCP)
- VS Code + Recommended extensions

---

## ⚙️ Available Scripts

| Script        | Description                                      |
|---------------|--------------------------------------------------|
| `cleanup.sh`  | 🧼 Cleans containers, images, and temp files     |
| `deploy.sh`   | 🚀 Automates stack deployment (optional)         |

---

## 📦 Cloud Services Used

### AWS

- EC2, RDS, Lambda, DynamoDB, CloudWatch

### Azure

- App Services, Cosmos DB, Azure Functions, Monitor

### GCP

- Compute Engine, Firestore, Cloud Run, Logging

---

## 📊 Cost & Location

**São Paulo** was selected as the recommended region for LATAM due to its balance of **low latency** and **moderate costs**.
Check the [cost comparison report](docs/costs.md) 📄.

---

## 📅 Timeline

Refer to the estimated work timeline in [this Gantt diagram](docs/cronograma-gantt.png) 📆.

---

## ✨ JAMStack & Architecture

- Static frontend can be hosted on **Netlify**, or migrated to **Azure Static Web Apps** or **CloudFront + S3**.
- Decoupled backend (NestJS / Express) orchestrated via containers or serverless functions (FaaS).

---

## 🔐 Security & Best Practices

- Private networks, firewalls, WAF setup
- Least privilege IAM roles
- Enabled auditing
- Secret management via Key Vault / Secret Manager

---

## 📜 License

MIT © 2025 – Your Company or Name

---
