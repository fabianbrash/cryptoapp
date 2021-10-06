FROM node:14.18.0-alpine3.12 AS build
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
# Install our dependencies
RUN npm ci --production --silent
# Copy our code note you need a .dockerignore file so you are not copying things like node_modules etc.
COPY . .

# Don't I need the key here so it can get injected properly
ENV REACT_APP_RAPIDAPI_KEY='29077e77f1msheb1aef984c01bd4p15567fjsnca20cd397bf4'
# Build our app
RUN npm run build

FROM node:14.18.0-alpine3.12
LABEL maintainer="Fabian Brash"
COPY --from=build /usr/src/app/build/ /opt/app
RUN npm install -g serve --silent
WORKDIR /opt/app
USER 1000
EXPOSE 5000
CMD ["serve", "-s"]