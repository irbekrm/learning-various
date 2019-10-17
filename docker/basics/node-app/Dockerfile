FROM node:alpine

# Specify working directory. Any following commands will be executed relative to this directory
WORKDIR /usr/app

# Copy 'from' 'to'. 'From' is relative to build context
# Here copy only package.json to avoid 'npm install' being re-run if source code has been changed
COPY ./package.json ./

RUN npm install

COPY ./ ./

CMD ["npm", "start"]