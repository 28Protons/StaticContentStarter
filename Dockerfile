FROM python:rc-alpine3.13

RUN apk update
RUN apk upgrade
RUN apk add bash
RUN apk add inotify-tools  #to watch for changes in a directory
RUN apk add strace         #to view the output of baground processes

RUN python3 -m pip install mako

#create a working directory, other paths mapped to the container will be relative to This
#to maintain base container indepdendence you should not use the root of the container
#as your working directory
WORKDIR /app/static

# Expose port 4000 to the Docker host, so we can access it
# from the outside.
EXPOSE 8000

CMD /app/entrypoint.sh
