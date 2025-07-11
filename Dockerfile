#  STAGE 0 – Dependencies

FROM node:20-alpine AS deps

WORKDIR /app

COPY package*.json ./

RUN npm ci


#  STAGE 1 – Build

FROM node:20-alpine AS builder

WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules

COPY . .

RUN npm run build

# STAGE 2 – Final Image

FROM node:20-alpine

WORKDIR /app

ARG UID=1000
ARG GID=1000

COPY --from=builder /app ./

RUN npx prisma generate

USER node

EXPOSE 3000

CMD ["node", "dist/main"]  