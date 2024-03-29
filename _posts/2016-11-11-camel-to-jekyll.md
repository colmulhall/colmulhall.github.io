---
layout: post
title:  "Camel to Jekyll"
date:   2016-11-11 12:33:00 +0100
category: Development
tags: [blog, dev]
---

When I created this website last year, I decided that I wanted to have more control over how the content gets generated and how the site looked. I went with a blogging engine called '[Camel][camel]', developed by Casey Liss[^1]. This allowed me to get my hands dirty with some web development without having to dive in completely at the deep end. Eleven months on, and a few enhancements later however - I wanted something different.

### Problems with Camel
Camel is a small, open source project that was developed to fit the needs of it's developer. It's fine to use as long as your needs remain the same as Caseys, but if you want to stray away from the master branch of that project you are accepting a responsibility to keeping the engine running smoothly if any of its (many) dependencies change or are discontinued. 

And there lies the problem I had with it. A relatively simple task like adding tag support to posts can soon become a tricky task in a custom JavaScript engine like Camel. It also adds a level of complexity which I don't really want to deal with. If I wanted that kind of control over my site I would write an engine myself. 

Another issue (although not directly related to Camel) is using Heroku to host the website. Heroku is very easy to set up and is also very functional, but it has two problems. One issue I had was with Dropbox sync. Several times, Dropbox sync stopped working when attempting deployments on Heroku. This meant that each time this happened I had to re-link my whole project which often meant I was left with a whole duplicate project. Another issue is the limitations with free usage of Heroku. Because I wasn't prepared to pay for the service [^2] , for periods during the app on which the website runs was going into a sleep mode. During these periods it would take longer than expected to load web pages - and that's annoying when it happens literally every other hour.

### Benefits of Jekyll
Jekyll is really simple. It generates a static website with each build, so there is no need for a database or any sort of querying to view posts. At any given time the whole website is contained in HTML files within the '_site' folder. The pages are generated using templating which is similar to Camel, and posts are written in Markdown. Jekyll uses [Liquid templating][lqd] which allows easy support of tagging and categories, which is something which would have been a pain to to add in Camel. 

Another benefit of using Jekyll is it's close link to GitHub Pages [^3]. With Pages, I can host the website in its own public repository. Any code changes or new blog posts are commited to GitHub just like any other project which makes tracking changes easy.  GitHub Pages doesn't suffer from the pricing model limitations that Heroku does which I mentioned above. So far I've had zero issues with it. 

The use of [YAML front matter][yaml] and [variables][var] make it easy to add features like pagination, recent posts, archive pages and more. With all of this built in, there is almost no limitations to what you can add to a website, and most importantly - it's all documented. Right now it ticks all the boxes for me. I'll revisit this in another year and see if that's still the case. 

[^1]: Casey is a co-host on one of my favourite podcasts, [Accidental Tech Podcast][atp].

[^2]: I view this website as a hobby. Unless I am making some money from it I don't see the point in it becoming a money drain no matter how cheap Heroku is. There are plenty of other free options.

[^3]: Jekyll is the engine behind GitHub Pages, and was created by one of GitHubs founders. 

[camel]:https://github.com/cliss/camel
[atp]:http://atp.fm/
[lqd]:http://shopify.github.io/liquid/
[yaml]:https://jekyllrb.com/docs/frontmatter/
[var]:https://jekyllrb.com/docs/variables/
