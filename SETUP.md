# Setup and Deployment Guide

## Step-by-Step Setup Instructions

### 1. Initialize Git Repository

```bash
cd devops-website-guide
git init
git add .
git commit -m "Initial commit: DevOps website project"
```

### 2. Create GitHub Repository

1. Go to GitHub.com and create a new repository named `devops-website-guide`
2. Do NOT initialize with README (we already have one)
3. Copy the repository URL

### 3. Push to GitHub

```bash
git remote add origin https://github.com/YOUR_USERNAME/devops-website-guide.git
git branch -M main
git push -u origin main
```

### 4. Set Up GitHub Secrets (for Actions)

Go to Repository Settings → Secrets and Variables → Actions, and add:

- `DOCKER_USERNAME`: Your Docker Hub username
- `DOCKER_PASSWORD`: Your Docker Hub password/token

### 5. Local Development Setup

```bash
# Option 1: Using Docker Compose (Recommended)
docker-compose up -d

# Option 2: Direct Docker
docker build -t devops-website .
docker run -p 8080:8080 devops-website
```

### 6. Jenkins Setup

1. Install Jenkins or use Docker:
```bash
docker run -d -p 8082:8080 -p 50000:50000 jenkins/jenkins:lts
```

2. Access Jenkins at http://localhost:8082
3. Install required plugins:
   - Git Plugin
   - Docker Plugin
   - Docker Pipeline

4. Create a new Pipeline job pointing to your GitHub repository

### 7. Access Monitoring

- **Prometheus**: http://localhost:9090
- **Grafana**: http://localhost:3000
  - Username: admin
  - Password: admin123

### 8. Configure Grafana

1. Add Prometheus as data source (http://prometheus:9090)
2. Import dashboard from `grafana/dashboards/dashboard.json`
3. Customize panels as needed

## Troubleshooting

### Docker Issues
```bash
# Check running containers
docker ps

# View logs
docker logs <container_name>

# Restart services
docker-compose restart
```

### Port Conflicts
```bash
# Check what's using a port
lsof -i :8080

# Change ports in docker-compose.yml if needed
```
