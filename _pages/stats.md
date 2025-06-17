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
{% assign monday_count = 0 %}
{% assign tuesday_count = 0 %}
{% assign wednesday_count = 0 %}
{% assign thursday_count = 0 %}
{% assign friday_count = 0 %}
{% assign saturday_count = 0 %}
{% assign sunday_count = 0 %}
{% assign january_count = 0 %}
{% assign february_count = 0 %}
{% assign march_count = 0 %}
{% assign april_count = 0 %}
{% assign may_count = 0 %}
{% assign june_count = 0 %}
{% assign july_count = 0 %}
{% assign august_count = 0 %}
{% assign september_count = 0 %}
{% assign october_count = 0 %}
{% assign november_count = 0 %}
{% assign december_count = 0 %}


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

	{% comment %} Calculate post count per day {% endcomment %}
	{% capture day %}{{ post.date | date: '%A' }}{% endcapture %}
	{% case day %}
	  {% when 'Monday' %}
	  	{% assign monday_count = monday_count | plus: 1 %}
	  {% when 'Tuesday' %}
	  	{% assign tuesday_count = tuesday_count | plus: 1 %}
	  {% when 'Wednesday' %}
	  	{% assign wednesday_count = wednesday_count | plus: 1 %}
	  {% when 'Thursday' %}
	  	{% assign thursday_count = thursday_count | plus: 1 %}
	  {% when 'Friday' %}
	  	{% assign friday_count = friday_count | plus: 1 %}
	  {% when 'Saturday' %}
	  	{% assign saturday_count = saturday_count | plus: 1 %}
	  {% when 'Sunday' %}
	  	{% assign sunday_count = sunday_count | plus: 1 %}
	{% endcase %}

	{% capture month %}{{ post.date | date: '%B' }}{% endcapture %}
	{% case month %}
	  {% when 'January' %}
	  	{% assign january_count = january_count | plus: 1 %}
	  {% when 'February' %}
	  	{% assign february_count = february_count | plus: 1 %}
	  {% when 'March' %}
	  	{% assign march_count = march_count | plus: 1 %}
	  {% when 'April' %}
	  	{% assign april_count = april_count | plus: 1 %}
	  {% when 'May' %}
	  	{% assign may_count = may_count | plus: 1 %}
	  {% when 'June' %}
	  	{% assign june_count = june_count | plus: 1 %}
	  {% when 'July' %}
	  	{% assign july_count = july_count | plus: 1 %}
	  {% when 'August' %}
	  	{% assign august_count = august_count | plus: 1 %}
	  {% when 'September' %}
	  	{% assign september_count = september_count | plus: 1 %}
	  {% when 'October' %}
	  	{% assign october_count = october_count | plus: 1 %}
	  {% when 'November' %}
	  	{% assign november_count = november_count | plus: 1 %}
	  {% when 'December' %}
	  	{% assign december_count = december_count | plus: 1 %}
	{% endcase %}

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

{% assign years_since_first_post = days_since_first_post | divided_by: 365 %}
{% assign remaining_days = days_since_first_post | modulo: 365 %}
{% assign months_since_first_post = remaining_days | divided_by: 30 %}


{% comment %} ------------------------------------ Display the stats --------------------------------- {% endcomment %}

Below are some mildly interesting stats about the blog:

* *{{ days_since_first_post }} days* have passed between the [first][first] post and the [most recent][last] post.

	* {{ days_since_first_post | days_to_ym }}

* There has been a total of *{{ total_post_count }}* posts.

	* *{{ linked_post_count.size }}* of these are linked, *{{ site.posts | size | minus: linked_post_count.size}}*  are non-linked.

* There has been *{{ monday_count }}* posts on a *Monday*, *{{ tuesday_count }}* on a *Tuesday*, *{{ wednesday_count }}* on a *Wednesday*, *{{ thursday_count }}* on a *Thursday*, *{{ friday_count }}* on a *Friday*, *{{ saturday_count }}* on a *Saturday* and *{{ sunday_count }}* on a *Sunday*.

* There has been *{{ january_count }}* posts in the month of *January*, *{{ february_count }}* in *February*, *{{ march_count }}* in *March*, *{{ april_count }}* in *April*, *{{ may_count }}* in *May*, *{{ june_count }}* in *June*, *{{ july_count }}* in *July*, *{{ august_count }}* in *August*, *{{ september_count }}* in *September*, *{{ october_count }}* in *October*, *{{ november_count }}* in *November* and *{{ december_count }}* in *December*.

* *{{ total_word_count }}* words have been written.

	* The average word count per post is *{{ total_word_count | divided_by: total_post_count }}*.

	* The longest post is *"[{{ longest_post_title }}][longest]"* with *{{ longest_post_word_count }}* words.

[first]:{{ first_post_url }}
[last]:{{ last_post_url }}
[longest]:{{ longest_post_url }}


