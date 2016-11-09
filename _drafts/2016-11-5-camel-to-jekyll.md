---
layout: post
title:  "Camel to jekyll"
date:   2016-11-5 22:05:00 +0100
category: Development
tags: [blog, jekyll, camel]
---

When I created this website last year, I decided that I wanted to have more control over how the content gets generated and how the site looked. I went with a blogging engine called "[Camel][camel]", developed by Casey Liss[^1]. This allowed me to get my hands dirty with some web development without having to dive in completely at the deep end. Eleven months on, and a few enhancements later however - I wanted something different.

### Problems with Camel
Camel is a small, open source project that was developed to fit the needs of it's developer. It's fine to use as long as your needs remain the same as Caseys, but if you want to stray away from the master branch of that project you are accepting a responsibility to keeping the engine running smoothly if any of its (many) dependencies change or are discontinued. 

And there lies the problem I had with it. A relatively simple task like adding tag support to posts can soon become a tricky task in a custom JavaScript engine like Camel. It also adds a level of complexity which I don't really want to deal with. If I want that kind of control over my site I would write an engine myself. 

Another issue (although not directly related to Camel) is using Heroku to host the website. Heroku is very easy to est up and is also very functional, but it has two problems. One issue I had was with Dropbox sync. Several times, I had issues where Dropbox sync stopped working when attempting deployments on Heroku. This meant that each time this happened I had to re-link my whole project which often meant I was left with a whole duplicate project. Another issue is the limitations with free usage of Heroku. Because I wasn't prepared to pay for the service [^2], for periods during the app on which the website runs was going into a sleep mode. During these periods it would take longer than expected to load web pages - and thats annoying when it happens literally every other hour.

### Benefits of Jekyll


[^1]: Casey is a co-host on one of my favourite podcasts, [Accidental Tech Podcast][atp].
[^2]: I view this website as a hobby. Unless I am making some money from it I don't see the point in it becoming a money drain no matter how cheap Heroku is. There are plenty of other free options.

[camel]:https://github.com/cliss/camel
[atp:h]:http://atp.fm/
