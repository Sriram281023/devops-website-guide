#!/bin/bash
# Quick monitoring dashboard in terminal

echo "📊 DevOps Website Monitoring Dashboard"
echo "======================================"
echo ""

echo "🐳 Container Status:"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
echo ""

echo "🏥 Application Health:"
if curl -s http://localhost:8080/health > /dev/null; then
    echo "  Website: ✅ Healthy"
else
    echo "  Website: ❌ Unhealthy"
fi

if curl -s http://localhost:9090/-/healthy > /dev/null; then
    echo "  Prometheus: ✅ Healthy"
else
    echo "  Prometheus: ❌ Unhealthy"
fi

if curl -s http://localhost:3000/api/health > /dev/null; then
    echo "  Grafana: ✅ Healthy"
else
    echo "  Grafana: ❌ Unhealthy"
fi
echo ""

echo "💻 Resource Usage:"
docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"
