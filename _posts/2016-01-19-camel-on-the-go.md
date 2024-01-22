---
layout: post
title:  "Camel on the go"
date:   2016-1-19 17:14:07 +0100
category: Blogging
tags: [dev, blog]
---

I am very happy with [Camel][cmlgit] having used it for the past two months, but the one thing I was missing was the ability to publish new posts or make edits on the go via mobile devices. I remembered [reading][uncomfortablecamel] about this issue on Casey Liss's site a while back so I said I would venture back through the archives to see was there any follow up to the problem. 

Turns out [there is][solution]!

Heroku can be connected to Dropbox which enables publishing on the go. The steps are easy, as Casey explains:

>My mobile workflow is as follows:
>	1.	Open up a text editor that speaks Dropbox and Markdown. For me, that’s Byword
>	2.	Add/edit the files that need updating
>	3.	Make sure those changes are saved to Dropbox
>	4.	Go to the Heroku Dashboard, find the app in question, and open the Code tab
>	5.	Add a commit message, and then click/tap Deploy

This also means there is no longer a need to use Git when deploying any changes which is another win. I now have most of the benefits of a more traditional CMS without any of the downsides. 

[cmlgit]: https://github.com/cliss/camel
[uncomfortablecamel]: https://www.caseyliss.com/2014/10/6/uncomfortable-riding-this-camel
[solution]: https://www.caseyliss.com/2014/11/19/heroku-adds-dropbox-support