# Set the base image to Node 17.1.0-alpine
FROM node:17.1.0-alpine

# Set the working directory
WORKDIR /app/medusa

# Copy the necessary files
COPY package.json .
COPY develop.sh .
COPY yarn.* .

# Run the apk update command to update package information
RUN apk update

# RUN apk add redis
# RUN rc-service redis status
# RUN rc-service redis start

# RUN apk add postgresql
# RUN rc-service postgresql status
# RUN rc-service postgresql start

# Install dependencies
# RUN yarn --network-timeout 1000000

# Install the medusa-cli
RUN yarn global add @medusajs/medusa-cli@latest

# Add the remaining files
COPY . .

RUN yarn install

# Set the default command to run when the container starts
ENTRYPOINT ["sh", "develop.sh"]
