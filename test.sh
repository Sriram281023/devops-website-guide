#!/bin/bash
# Run tests and validations

set -e

echo "🧪 Running tests..."

FAILED=0

echo "Testing Docker build..."
if docker build -t devops-website-test . > /dev/null 2>&1; then
    echo "✓ Docker build successful"
else
    echo "✗ Docker build failed"
    FAILED=1
fi

echo "Testing container health..."
docker run -d --name test-container -p 8888:8080 devops-website-test
sleep 5
if curl -f http://localhost:8888/health > /dev/null 2>&1; then
    echo "✓ Container healthy"
else
    echo "✗ Container unhealthy"
    FAILED=1
fi
docker stop test-container && docker rm test-container

docker rmi devops-website-test || true

if [ $FAILED -eq 0 ]; then
    echo "All tests passed! ✅"
    exit 0
else
    echo "Some tests failed! ❌"
    exit 1
fi
