#1: Specify the base image
FROM node:lts-alpine
#2 we're telling Docker to create a directory named /usr/src/app 
WORKDIR /usr/src/app  
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
#3 Install dependencies
RUN npm install --production --silent && mv node_modules ../
#4 Copy application files to the container
COPY /src /usr/src/app       
#5 Specify the environment variable
ENV NODE_ENV=production

EXPOSE 3000
RUN chown -R node /usr/src/app
USER node
#6 Define the default command
# The last instruction that we need for our application is to specify the default command that will be executed 
# when the Docker container starts from the image we'll build from this Dockerfile
# in this case "node indext.js"
CMD ["node", "index.js"]
