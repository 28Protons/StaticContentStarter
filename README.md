# StaticContentThingy
A very lightweight Pattern for building Static Website Content. This project is used as an example for some of our containerized development trainings as well as a
tutorial on Amazon Amplify. It is also quite useful as a really slim environment for generating static content.

## Start Clean
`docker-compose up web --force-recreate`

## Create A New Page
To create new content add {{FILE}}.html to the content directory

## Notable Files
* `entrypoint.sh` Runs when the container starts, gets watch.sh and run.sh are running on the container
* `run.sh`  Runs the python Webserver on port 8000 in the /static directory
* `watch.sh` watches for file changes in the content directory and recompiles the layout and nav around the content
* `compile.py`  Uses python templating for convenience, build static versions of content pages
* `_layout.html` The main layout template used to wrap content files, normally used for header, footer and base HTML tags

## Folder Structure
* `/content` Anything you put in here will be compiled in to the static directory using it's given filename.
* `/static` This is where the static page lives, it also contains all assets needed for style and scripting


## Templates
Files in the content folder that being with an underscore are considered templates. When a template is changes ALL files are recompiled. Templates can only be
added by adjusting `compile.py`

## Usage Notes
While you could use this out of the box, You'll probably want to edit the layout to use whatever templates or styles you need. This repository
is a good starter for a very basic static content needs but if you thing you might end up needing something closer to a full featured Content Management system don't reinvent the wheel here.
Use something like Gatsby, Jekyll, or Hogo.
