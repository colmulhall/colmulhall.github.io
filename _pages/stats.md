---
layout: page
title: Stats
permalink: /stats/
---


{% comment %} ------------------------------------- Calculate stats ---------------------------------- {% endcomment %}

{% comment %} 
	Count all posts and linked posts. 
{% endcomment %}

{% assign total_post_count = site.posts | size %}
{% assign linked_post_count = '' %}
{% assign first_post_date = '' %}
{% assign last_post_date = '' %}
{% assign running_word_count = 0 %}
{% assign total_word_count = 0 %}

{% for post in site.posts %}
	
	{% if post.link != null %}
		{% assign linked_post_count = linked_post_count | append: 'x' %}
	{% endif %}

	{% if forloop.last %}
		{% assign first_post_date = post.date %}
	{% endif %}

	{% if forloop.first %}
		{% assign last_post_date = post.date %}
	{% endif %}

	{% assign running_word_count = post.content | number_of_words %}
	{% assign total_word_count = total_word_count | plus: running_word_count %}

{% endfor %}

{% comment %} 
	Convert our dates to Number of seconds since 1970-01-01 00:00:00 UTC 
	Credit: https://stackoverflow.com/a/37343774
{% endcomment %}

{% assign first_post = first_post_date | date: '%s' %}
{% assign last_post = last_post_date | date: '%s' %}
{% assign todays_date = 'now' | date: '%s' %}

{% assign diff_seconds_first_post = todays_date | minus: first_post %}
{% assign days_since_first_post = diff_seconds_first_post | divided_by: 3600 | divided_by: 24 %}

{% assign diff_seconds_last_post = todays_date | minus: last_post %}
{% assign days_since_last_post = diff_seconds_last_post | divided_by: 3600 | divided_by: 24 %}


{% comment %} ------------------------------------ Display the stats --------------------------------- {% endcomment %}

* Total posts: {{ total_post_count }} 
* Linked posts: {{ linked_post_count.size }} 
* Non-linked posts: {{ site.posts | size | minus: linked_post_count.size}} 
* Words written: {{ total_word_count }}
* Average words per post: {{ total_word_count | divided_by: total_post_count }}






