#!/bin/bash

# 🚀 deploy.sh — Automates infrastructure deployment and service startup

set -e  # Stop on error

echo "📦 Starting deployment..."

# Step 1: Cleanup previous Docker containers/images if needed
echo "🧹 Cleaning previous Docker state..."
docker-compose down
docker system prune -f

# Step 2: Infrastructure Deployment (example using Terraform)
echo "☁️ Deploying cloud infrastructure..."
cd infra/aws  # Change to azure/ or gcp/ depending on provider
terraform init
terraform apply -auto-approve
cd ../..

# Step 3: Build backend
echo "🔨 Building backend services..."
cd backend
docker build -t company-backend .
cd ..

# Step 4: Build frontend
echo "🌐 Building frontend app..."
cd frontend
npm install
npm run build
cd ..

# Step 5: Start Docker containers
echo "🐳 Starting services with Docker Compose..."
docker-compose up -d

echo "✅ Deployment complete."
