FROM node:23-alpine AS base
WORKDIR /app
COPY ./react-app/package.json ./
RUN npm install --ignore-scripts
COPY ./react-app/ ./

FROM base AS development 
CMD [ "npm", "run", "dev", "--", "--host", "0.0.0.0" ]

FROM base AS build
RUN npm run build

FROM nginx:1.27 AS prod
COPY --from=build /app/dist /usr/share/nginx/html
