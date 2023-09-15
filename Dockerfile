FROM node:18.17.1 as build-stage
WORKDIR /nuxtapp
COPY . .
RUN npm install
RUN npm run build
FROM node:18.17.1-alpine3.18 as prod-stage
WORKDIR /nuxtapp
COPY --from=build-stage /nuxtapp/.output/  ./.output/
CMD [ "node", ".output/server/index.mjs" ]