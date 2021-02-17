# StaticContentThingy
A very lightweight Pattern for building Static Website Content. This project is used as an example for some of our containerized development trainings as well as a
tutorial on Amazon Amplify. It is also quite useful as a really slim environment for generating static content.

## Development happens on docker-compose

##Start Clean
`docker-compose up web --force-recreate`

## Create A New Page
To create new content add <filename>.html to the content directory

## Notable Files
* run.sh  Runs the python Webserver on port 8000 in the /static directory
* watch.sh watches for file changes in the content directory and recompiles the layout and nav around the content
* compile.py  Uses python templating for convenience, build static versions of content pages

## Folder Structure
* `/content` Anything you put in here will be compiled in to the static directory using it's given container_name
* `/static` This is where the static page lives, it also contains all assets needed for style and scripting

## Templates
Files in the content folder that being with an underscore are considered templates. When a template is changes ALL files are recompiled. Templates can only be
added by adjusting `compile.py`
