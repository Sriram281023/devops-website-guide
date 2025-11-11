FROM nginx:alpine
LABEL maintainer="devops-team@example.com"
LABEL description="DevOps Website Guide - Comprehensive tutorial application"

RUN rm -rf /usr/share/nginx/html/*

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/css/
COPY script.js /usr/share/nginx/html/js/

RUN addgroup -g 1001 -S nginx-user && \
    adduser -S -D -H -u 1001 -h /var/cache/nginx -s /sbin/nologin -G nginx-user -g nginx-user nginx-user

RUN chown -R nginx-user:nginx-user /usr/share/nginx/html

USER nginx-user

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:8080 || exit 1

CMD ["nginx", "-g", "daemon off;"]
