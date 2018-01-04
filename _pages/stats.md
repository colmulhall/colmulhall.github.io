---
layout: page
title: Stats
permalink: /stats/
---


{% comment %} ------------------------------------- Calculate stats ---------------------------------- {% endcomment %}

{% assign total_post_count = site.posts | size %}
{% assign linked_post_count = '' %}
{% assign first_post_date = '' %}
{% assign first_post_url = '' %}
{% assign last_post_date = '' %}
{% assign last_post_url = '' %}
{% assign running_word_count = 0 %}
{% assign total_word_count = 0 %}
{% assign current_post_word_count = 0 %}
{% assign longest_post_title = '' %}
{% assign longest_post_word_count = 0 %}
{% assign longest_post_url = '' %}


{% for post in site.posts %}
	
	{% comment %} Count the linked posts {% endcomment %}
	{% if post.link != null %}
		{% assign linked_post_count = linked_post_count | append: 'x' %}
	{% endif %}

	{% comment %} Get the first and most recent posts {% endcomment %}
	{% if forloop.last %}
		{% assign first_post_date = post.date %}
		{% assign first_post_url = post.url %}
	{% endif %}

	{% if forloop.first %}
		{% assign last_post_date = post.date %}
		{% assign last_post_url = post.url %}
	{% endif %}

	{% comment %} Calculate word counts {% endcomment %}
	{% assign running_word_count = post.content | number_of_words %}
	{% assign total_word_count = total_word_count | plus: running_word_count %}

	{% assign current_post_word_count = post.content | number_of_words %}

	{% if current_post_word_count > longest_post_word_count %}
		{% assign longest_post_word_count = post.content | number_of_words %}
		{% assign longest_post_title = post.title %}
		{% assign longest_post_url = post.url %}
	{% endif %}

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

Below are some mildly interesting stats about the blog:

* *{{ days_since_first_post }}* days have passed between the [first][first] post and the [most recent][last] post
* There has been a total of *{{ total_post_count }}* posts 
* *{{ linked_post_count.size }}* of these are linked, *{{ site.posts | size | minus: linked_post_count.size}}*  are non-linked
* *{{ total_word_count }}* words have been written
* The average word count per post is *{{ total_word_count | divided_by: total_post_count }}*
* The longest post is *"[{{ longest_post_title }}][longest]"* with *{{ longest_post_word_count }}* words

[first]:{{ first_post_url }}
[last]:{{ last_post_url }}
[longest]:{{ longest_post_url }}






