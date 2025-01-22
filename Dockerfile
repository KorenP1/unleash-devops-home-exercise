FROM docker.io/node:lts-slim AS build
WORKDIR /build
COPY . .
RUN npm install
RUN npm run build

FROM docker.io/node:lts-slim
WORKDIR /app
COPY --from=build /build/dist /build/package.json /build/package-lock.json ./
RUN npm clean-install --production

ENV BUCKET_NAME=''
ARG PORT=3000
ENV PORT=${PORT}
EXPOSE ${PORT}/tcp

ENTRYPOINT ["node", "index.js"]
CMD []
