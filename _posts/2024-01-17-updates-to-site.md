---
layout: post
title:  "Website Updates"
date:   2024-01-17 12:00:00 +0100
category: Blogging
tags: [blog, dev]
---

In an effort to not completely abandon this website, I have updated some basic stuff behind the scenes to keep it in a state where it can be updated properly. 

The updates include:
- Creating a 'development' branch for testing changes
- Adding a gitignore file to shrink the size of the repo
- Updating the Gemfile versions where necessary

I had not been using Jekyll or GitHub Pages correctly for a long time. I would usually just create/update posts from within the GitHub website directly. 

That is admittedly a useful benefit of GitHub Pages and cuts out a lot of effort, but it leads to loads of unnecessary commits and makes testing any config or library changes more or less impossible. 

These changes are minor [^1] but they allow me to test changes locally on the website before pushing them, and bring some form of [SDLC][sdlc] to the content here. 

[^1]:And about 5 years late. I was doing things right for the first few months!

[sdlc]:https://en.wikipedia.org/wiki/Systems_development_life_cycle
