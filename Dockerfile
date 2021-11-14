FROM node:15
WORKDIR /home/meghana/Documents/Devops/
COPY package*.json ./ 
RUN npm install
COPY . . 
EXPOSE 8000
CMD [ "node", "server.js" ]