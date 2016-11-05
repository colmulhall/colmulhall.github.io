---
layout: page
title: Archive
permalink: /archive/
---

### Recent Posts
<ul>
{% for post in site.posts limit:5 %}
	<li><a href="{{ post.url }}">{{post.title}}</a></li>
{% endfor %}
</ul>

### Posts By Month
<p>
{% for post in site.posts %}
  {% assign month_with_year = post.date | date: '%B %Y' %}
  {% if month_with_year != date %}
    <a href="" id="y{{month_with_year}}">{{ month_with_year }}</a><br>
    {% assign date = month_with_year %} 
  {% endif %}
{% endfor %}
</p>

### Posts By Year
<p>
{% for post in site.posts %}
  {% assign year = post.date | date: '%Y' %}
  {% if year != date %}
    <a href="" id="y{{year}}">{{ year }}</a><br>
    {% assign date = year %} 
  {% endif %}
{% endfor %}
</p>

<ul>
{% for post in site.posts %}
  {% assign currentdate = post.date | date: "%Y" %}
  {% if currentdate != date %}
    <li id="y{{currentdate}}">{{ currentdate }}</li>
    {% assign date = currentdate %} 
  {% endif %}
    <li><a href="{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
</ul>