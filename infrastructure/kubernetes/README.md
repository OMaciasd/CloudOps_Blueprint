# 🚀 Kubernetes Deployment for NestJS + MongoDB

This project contains Kubernetes manifests for deploying a **NestJS** application connected to a **MongoDB** database, following best practices including Namespaces, ConfigMaps, Secrets, Ingress, and Auto-scaling.

---

## 📁 Project Structure

```bash
.
├── namespace.yaml
├── secrets.yaml
├── configmap.yaml
├── mongodb-deployment.yaml
├── nest-backend-deployment.yaml
├── ingress.yaml
├── autoscaler.yaml
└── README.md
```

---

## ✅ Prerequisites

- Kubernetes cluster (Minikube, AKS, EKS, GKE, or Docker Desktop)
- kubectl configured
- Ingress Controller (NGINX)
- Docker image for NestJS app (hosted on DockerHub or private registry)

---

## ⚙️ Environment Variables

Defined using Secrets and ConfigMap:

- MONGO_USER
- MONGO_PASSWORD
- MONGO_HOST
- MONGO_PORT
- MONGO_DB

---

## 🧪 Deployment Steps

Apply the Kubernetes resources in the following order:

```bash
kubectl apply -f namespace.yaml
kubectl apply -f secrets.yaml
kubectl apply -f configmap.yaml
kubectl apply -f mongodb-deployment.yaml
kubectl apply -f nest-backend-deployment.yaml
kubectl apply -f ingress.yaml
kubectl apply -f autoscaler.yaml
```

---

## 🌐 Access

Your backend will be available at the following URL (if Ingress is configured):

```bash
http://api.yourdomain.com
```

---

## 📈 Auto-scaling

Includes a Horizontal Pod Autoscaler (HPA) configured based on CPU usage:

- Min replicas: 2
- Max replicas: 5
- Automatically scales based on CPU thresholds

---

## 📦 Technologies Used

Includes a Horizontal Pod Autoscaler (HPA) configured based on CPU usage:

- 🟣 NestJS
- 🍃 MongoDB
- ☸️ Kubernetes
- 🔐 Secrets & ConfigMaps
- 🌐 Ingress (NGINX)
- 📊 HPA (Horizontal Pod Autoscaler)

---

## 👨‍💻 Author

- Developed by **Oscar Macias**
- License: MIT

---

### Let me know if you'd like this turned into a downloadable file or included in a GitHub repository structure!

---
