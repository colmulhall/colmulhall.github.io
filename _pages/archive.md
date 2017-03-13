---
layout: page
title: Archive
permalink: /archive/
---

<h3>Search</h3>
<form method="get" id="search" action="http://duckduckgo.com/">
     <input type="hidden" name="sites" value="colm.io"/>
     <input type="hidden" name="ka" value="h"/>
     <input type="hidden" name="k7" value="w"/>
     <input type="hidden" name="kj" value="#223e77"/>
     <input type="hidden" name="ky" value="#e2d6b7"/>
     <input type="hidden" name="kx" value="#000000"/>
     <input type="hidden" name="kt" value="Helvetica"/>
     <input type="text" name="q" maxlength="255" size="40" placeholder="via DuckDuckGo"/>
     <input type="submit" value="Search"  />
</form>

<section id="archive">
  <h3>2017</h3>
  {%for post in site.posts %}
    {% unless post.next %}
      <ul class="this">
    {% else %}
      {% capture year %}{{ post.date | date: '%Y' }}{% endcapture %}
      {% capture nyear %}{{ post.next.date | date: '%Y' }}{% endcapture %}
      {% if year != nyear %}
        </ul>
        <h3>{{ post.date | date: '%Y' }}</h3>
        <ul class="past">
      {% endif %}
    {% endunless %}
      <li><time>{{ post.date | date:"%B %-d" }}: </time><a href="{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
  </ul>
</section>
