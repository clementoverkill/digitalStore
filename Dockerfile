FROM node:20-alpine

WORKDIR /app

# Set Node memory limit for 1GB Railway free plan
ENV NODE_OPTIONS=--max-old-space-size=512

# Copy source code
COPY . .

# Install dependencies
RUN corepack enable && yarn install --frozen-lockfile

# Expose port
EXPOSE 9000

# Start command
CMD ["yarn", "start"]