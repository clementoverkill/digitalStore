FROM node:20-alpine

WORKDIR /app

# Install dependencies
COPY package.json yarn.lock ./
RUN corepack enable && yarn install --frozen-lockfile

# Copy source code
COPY . .

# Build with increased memory
ENV NODE_OPTIONS=--max-old-space-size=4096
RUN yarn build

# Expose port
EXPOSE 9000

# Start command
CMD ["yarn", "start:prod"]