#!/usr/bin/env python3

from mako.template import Template
from sys import argv


layout  = Template(filename='/app/content/_layout.html')
nav     = Template(filename='/app/content/_nav.html').render()
foot    = Template(filename='/app/content/_footer.html').render()

content = Template(filename=argv[1]).render()

print(layout.render(navigation_template=nav, content_template=content, footer_template=foot))
