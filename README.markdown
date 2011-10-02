Jekyll plugins
=====

External Static Files
---

This one is intended for use with my fork of Jekyll. The goal of this fork is to keep content files/images in a separate folder. That way, this folder can be shared as a dropbox folder with the client, and they'll have an admin-less CMS.

This plugin solves the problem of having template-related static files (logos, icons, etc) outside the _content folder. 


Sorted Pages
---

1. Put in _plugins folder

2. use order: (number) in the YAML section of the pages

3. loop over site.sorted_pages to build your menu