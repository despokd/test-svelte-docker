# pull saserver image
FROM ubuntu

# production directory
WORKDIR /app

# install nginx
RUN apt-get update
RUN apt-get install nginx -y

# use this directory
COPY . .

# standard port
EXPOSE 81

# default params for container
CMD ["nginx","-g","daemon off;"]

# TODO server response: ERR_EMPTY_RESPONSE
# maybe link to main file index.html is missing