---
layout: page
title: Archive
permalink: /archive/
---

Post list by category can be found [here](/archive/categories).


<section id="archive">
  {% assign current_year = "" %}
  {% for post in site.posts %}
    {% capture post_year %}{{ post.date | date: '%Y' }}{% endcapture %}
    {% if post_year != current_year %}
      {% unless forloop.first %}</ul>{% endunless %}
      <h3>{{ post_year }}</h3>
      <ul>
      {% assign current_year = post_year %}
    {% endif %}
    <li><time>{{ post.date | date:"%b %-d" }}: </time><a href="{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
  </ul>
</section>
