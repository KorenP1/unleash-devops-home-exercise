FROM docker.io/node:lts-alpine AS build
WORKDIR /build
COPY . .
RUN npm install
RUN npm run build

FROM docker.io/node:lts-alpine
WORKDIR /app
COPY --from=build /build/dist /build/package.json /build/package-lock.json ./
RUN npm clean-install --production

ARG PORT=3000
ENV PORT=${PORT} BUCKET_NAME=''
EXPOSE ${PORT}/tcp

ENTRYPOINT ["node", "index.js"]
CMD []
