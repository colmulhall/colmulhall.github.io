---
layout: page
title: Posts by Category
permalink: /archive/categories
---

{% for category in site.categories %}
  <div class="archive-group">
    {% capture category_name %}{{ category | first }}{% endcapture %}
    <div id="#{{ category_name | slugize }}"></div>
    <p></p>
    
    <h3 class="category-head">{{ category_name }}</h3>
    <a name="{{ category_name | slugize }}"></a>

    <ul>
    {% for post in site.categories[category_name] %}
        <li><a href="{{ site.baseurl }}{{ post.url }}">{{post.title}}</a></li>
    {% endfor %}
    </ul>
{% endfor %}
</div>
