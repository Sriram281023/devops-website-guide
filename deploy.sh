#!/bin/bash
# Automated deployment script

set -e

echo "🚀 Starting deployment process..."

echo "Step 1: Stopping existing containers..."
docker-compose down || true

echo "Step 2: Pulling latest changes from GitHub..."
git pull origin main

echo "Step 3: Building Docker image..."
docker build -t devops-website:latest .

echo "Step 4: Starting services with Docker Compose..."
docker-compose up -d

echo "Step 5: Waiting for services to start..."
sleep 10

echo "Step 6: Running health checks..."
if curl -f http://localhost:8080/health > /dev/null 2>&1; then
    echo "✅ Application is healthy!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "🎉 Deployment completed successfully!"
echo ""
echo "Access your application at:"
echo "  - Website: http://localhost:8080"
echo "  - Prometheus: http://localhost:9090"
echo "  - Grafana: http://localhost:3000"
