---
layout: page
title: Archive
permalink: /archive/
---

Post list by category can be found [here][categories].


<section id="archive">
  <h3>2025</h3>
  {%for post in site.posts %}
    {% unless post.next %}
      <ul class="this-year">
    {% else %}
      {% capture year %}{{ post.date | date: '%Y' }}{% endcapture %}
      {% capture nyear %}{{ post.next.date | date: '%Y' }}{% endcapture %}
      {% if year != nyear %}
        </ul>
        <h3>{{ post.date | date: '%Y' }}</h3>
        <ul class="past-year">
      {% endif %}
    {% endunless %}
      <li><time>{{ post.date | date:"%b %-d" }}: </time><a href="{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
  </ul>
</section>


[categories]: /archive/categories
