FROM node:20-alpine

WORKDIR /app

# Copy source code first
COPY . .

# Install dependencies
RUN corepack enable && yarn install

# Build with increased memory
ENV NODE_OPTIONS=--max-old-space-size=4096
RUN yarn build

# Expose port
EXPOSE 9000

# Start command
CMD ["yarn", "start:prod"]