---
layout: post
title:  "Better footnotes with bigfoot.js "
date:   2016-4-15 17:14:07 +0100
category: Development
tags: [bigfoot, footnotes]
---

Chris Sauvé on why footnotes on the web are a pain:

>Footnotes on the web are a pain in the ass. You click on a tiny number, get transported somewhere near the bottom of the page, find the footnote you were looking for, and click on a link to go back to where you were on the page.

Chris created a solution to this problem in the form of a jQuery plugin called [bigfoot][bgft]. Bigfoot allows you to click on a footnote and instead of getting pushed down to your footnote at the bottom of the page, you get a nice little pop up. [^1] I decided to implement these as part of [a todo list][todocolmio] which I am still working my way through. I'm not a heavy footnote user, but I've seen bigfoot used on enough websites now to know that I don't want to go back to traditional footnotes.

Camel, the engine which powers this blog, already supports footnotes thanks to [this][camelupdate] update last year. Luckily it's fairly easy to implement bigfoot on top of this. The first step is to download the project from the [website][bgft] into your Camel file system. Although they can be put together into one file I chose to separate the bigfoot CSS from my site CSS [^2]:


{% highlight html %}
<!-- Stylesheets --> 
<link rel="stylesheet" type="text/css" href="/css/site.css">
<link rel="stylesheet" type="text/css" href="/css/bigfoot.css">
{% endhighlight %}


Next, I downloaded jQuery from the [official website][jquery]. Once it was downloaded I added it to my file system in a 'js' folder, along with the bigfoot resources. The last thing you need to do is add the following anywhere on the page to enable bigfoot:

{% highlight html %}
<!-- jQuery -->
<script type="text/javascript" src="/js/jquery/jquery-2.2.3.min.js"></script>

<!-- Bigfoot Footnotes -->
<script type="text/javascript" src="/js/bigfoot/dist/bigfoot.min.js"></script>
<script type="text/javascript">
    $.bigfoot();
</script>
{% endhighlight %}

In order for bigfoot to work, you need to make sure that footnotes resemble something like this in your code:

{% highlight html %}
<p>
    <sup id="fnref:1">
        <a href="#fn:1" rel="footnote">1</a>
    </sup>
</p>
{% endhighlight %}

Luckily, Camel supports MultiMarkdown which displays footnotes like this. But if you are using a different engine/CMS this may be done differently. 

I had to do a *lot* of tweaking of the CSS to make the footnotes look how I wanted. [^3] Funnily enough that is what took me the longest to figure out, and it still isn't perfect (CSS gradients are confusing). It's also worth noting that there are several bigfoot [options][bgoptions] available to you, each of which are detailed on the website. I wanted to retain the footnotes with anchor links as the bottom of my posts. To do this you can use the actionOriginalFN: "ignore" option. This does exactly what you would think in that it ignores any original footnote markup. This can be added to the bigfoot script tag:

{% highlight html %}
 <!-- Bigfoot Footnotes -->
<script type="text/javascript" src="/js/bigfoot/dist/bigfoot.min.js"></script>
<script type="text/javascript">
    $.bigfoot({
        actionOriginalFN: "ignore"
    });
</script>
{% endhighlight %}

And that's it! This was an interesting exercise to undertake and I think it makes a big difference to the browsing experience on the website. I may revisit the CSS of the footnotes at a later stage but for now I am happy.


[^1]: Like this!
[^2]: I changed the name of 'bigfoot-default.css' to 'bigfoot.css'.
[^3]: Like a lot of things on this site, they are heavily influenced by [Marco.org][marcoorg].

[bgft]:http://bigfootjs.com/
[todocolmio]:http://www.colm.io/2016/4/4/what-needs-fixing
[camelupdate]:https://www.caseyliss.com/2015/1/15/camel-changes
[jquery]:http://jquery.com/download/
[marcoorg]:https://marco.org/