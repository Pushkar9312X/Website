FROM louislam/uptime-kuma:latest

# Set environment variables
ENV TZ=UTC
ENV UPTIME_KUMA_PORT=3001

# Expose the default port
EXPOSE 3001

# Create volume mount point for data persistence
VOLUME ["/app/data"]

# Health check
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD node /app/extra/healthcheck.js || exit 1

# Uptime Kuma runs on Node.js
CMD ["node", "server/server.js"]
