# DevOps Website Design Guide

A comprehensive web application demonstrating DevOps best practices using GitHub, Jenkins, Docker, and Grafana.

## 🚀 Project Overview

This project showcases a complete CI/CD pipeline for a modern web application with:
- **GitHub**: Version control and collaboration
- **Jenkins**: Continuous Integration/Continuous Deployment
- **Docker**: Containerization and orchestration
- **Grafana + Prometheus**: Monitoring and visualization

## 📋 Prerequisites

- Git
- Docker and Docker Compose
- Jenkins (optional for local development)
- Node.js (optional for development)

## 🛠️ Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/devops-website-guide.git
cd devops-website-guide
```

### 2. Run with Docker Compose

```bash
docker-compose up -d
```

### 3. Access Services

- **Website**: http://localhost:8080
- **Prometheus**: http://localhost:9090
- **Grafana**: http://localhost:3000 (admin/admin123)

## 📁 Project Structure

```
devops-website-guide/
├── index.html              # Main HTML file
├── css/
│   └── style.css          # Stylesheet
├── js/
│   └── script.js          # JavaScript
├── Dockerfile             # Docker image configuration
├── docker-compose.yml     # Multi-container setup
├── Jenkinsfile            # CI/CD pipeline definition
├── prometheus/
│   └── prometheus.yml     # Metrics configuration
├── grafana/
│   └── dashboards/        # Grafana dashboard JSONs
├── nginx.conf             # Nginx configuration
└── README.md              # This file
```

## 🔄 CI/CD Pipeline

The Jenkins pipeline includes:

1. **Checkout**: Pull latest code from GitHub
2. **Build**: Prepare application artifacts
3. **Test**: Run automated tests
4. **Docker Build**: Create container image
5. **Push**: Upload to Docker registry
6. **Deploy**: Deploy to environment

## 🐳 Docker Commands

```bash
# Build image
docker build -t devops-website .

# Run container
docker run -d -p 8080:8080 devops-website

# View logs
docker logs devops-website

# Stop container
docker stop devops-website
```

## 📊 Monitoring

Access Grafana dashboards to view:
- Application performance metrics
- Container health and resource usage
- System metrics (CPU, Memory, Disk)
- Custom business metrics

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request


## 👥 Authors

Sriram Balaboina(23261A0504)

## 🙏 Acknowledgments

- Jenkins community
- Docker documentation
- Grafana Labs
- GitHub Actions team
