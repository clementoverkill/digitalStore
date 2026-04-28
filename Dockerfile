FROM node:20-alpine

WORKDIR /app

# Set Node memory limit for 1GB Railway free plan
ENV NODE_OPTIONS=--max-old-space-size=768

# Copy source code (includes pre-built .medusa/server)
COPY . .

# Install dependencies
RUN corepack enable && yarn install --frozen-lockfile

# Expose port
EXPOSE 9000

# Start command (skip build since it's pre-built)
CMD ["yarn", "start"]