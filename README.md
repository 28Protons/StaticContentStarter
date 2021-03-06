# A Static Content Starter
A lightweight container pattern for building static website content. This project is used as an example for some of our containerized development trainings as well as a
tutorial about Amazon Amplify. It is also quite useful as a really slim environment for generating static content. There are lots of solutions available for developing static websites and in most cases you should probably use one of them. 

This solution was built to minimize effort to get started, if you have a working docker/docker-compose installation that supports linux containers you have all the dependencies. So we focus on the benefits of out of the box containerization, have very few dependencies on the container itself, and use libraries that are not likely to require regular updates to maintain the project. 

## Start Clean
`docker-compose up web --force-recreate`

## Create A New Page
To create new content add {{FILE}}.html to the content directory. For example if you want to add an About Us page.  Add about_us.html to the /content directory containing only the content that is specific to that page. The watcher on the container will automatically wrap _layout.html around it, place it in the /static directory and it should be available immediately at localhost:8000/about_us.html  

You can add stylesheets and javascript directly to /static/assets to get the styles and interaction you want and add them to the _layout.html template. 

## Notable Files
* `entrypoint.sh` Runs when the container starts, ensures watch.sh and run.sh are running on the container
* `run.sh`  Runs the python Webserver on port 8000 in the /static directory
* `watch.sh` watches for file changes in the content directory and recompiles the layout and nav around the content
* `compile.py`  Uses python templating for convenience, build static versions of content pages
* `_layout.html` The main layout template used to wrap content files, normally used for header, footer and base HTML tags

## Folder Structure
* `/content` Anything you put in here will be compiled in to the static directory using it's given filename.
* `/static` This is where the static page lives, it also contains all assets needed for style and scripting


## Partial Templates
Files in the content folder that begin with an underscore are considered partials. When a partial template is changed ALL files are recompiled. Templates can only be
added by adjusting `compile.py`

## Usage Notes
While you could use this out of the box, You'll probably want to edit the layout to use whatever templates or styles you need. This repository
is a good starter for a very basic static content needs but if you thing you might end up needing something closer to a full featured Content Management system don't reinvent the wheel here.
Use something like Gatsby, Jekyll, or Hogo.
