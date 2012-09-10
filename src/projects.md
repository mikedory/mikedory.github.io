---
layout: page
title: Mike Dory | Projects
tagline: 
category: projects
tags: [projects, portfolio, page]
group: navigation
headertext: Hi! I'm Mike.
headertextsmall: I make things and drink coffee.
categories:
    - title: Writing
      tag: writing
    - title: Teaching
      tag: teaching
    - title: Speaking
      tag: speaking
    - title: ITP
      tag: itp
    - title: Socialbomb
      tag: socialbomb
---

<!-- set up the clicky nav -->
<ul class="nav nav-tabs center project-sort-buttons">
    <li class="all span2 active"><a href="#all" class="clickable">All</a></li>
    <li class="writing span2"><a href="#writing" class="clickable">Writing</a></li>
    <li class="itp span2"><a href="#itp" class="clickable">Building</a></li>
    <li class="teaching span2"><a href="#teaching" class="clickable">Teaching</a></li>
    <li class="speaking span2"><a href="#speaking" class="clickable">Speaking</a></li>
    <!-- <li class="socialbomb span2"><a href="#socialbomb" class="clickable">Socialbomb</a></li> -->
</ul>

<!-- show the "all" div filled with three of each post  -->
<div id="all" class="all post-group post-group-all">
{% for category in page.categories %}
    <h1 class="{{ category.tag }} page-header"><a href="#{{ category.tag }}" class="clickable">{{ category.title }} &raquo;</a></h1>
    <!-- get three portfolio posts -->

    {% assign projects = site.tags.[category.tag] %}
    {% if projects %}
        {% for project in projects limit:3 %}

            {% comment %} shell out the row structure {% endcomment %}
            {% if forloop.index0 % 3 == 0 %}
            <div class="row" >
            {% endif %}
                <div class="span4">
                    <!-- render_portfolio_excerpt(project, 'post'+' '+tag) -->
                    <article class='{{ project.class }}' >

                        {% comment %} the post's title {% endcomment %}
                        <h2><a href="{{ project.url }}">{{ project.title }}</a></h2>

                        {% comment %} if there's a thumb, load both color and b/w versions {% endcomment %}
                        {% if project.thumb %}
                        <a href="{{ project.url }}" class="bwrollover">
                            <img src="http://dory-magickly.herokuapp.com?src={{ project.thumb }}&grayscale=true&thumb=300x200%23" class="gray"/>
                            <img src="http://dory-magickly.herokuapp.com?src={{ project.thumb }}&thumb=300x200%23" class="color" style="display:none"/>
                        </a>
                        {% endif %}
                        
                        {% comment %} blurb! {% endcomment %}
                        {{ project.excerpt }}
                        
                        {% comment %}read more? {% endcomment %}
                        <!-- <a href="{{ content_url(res.url) }}">Read more &raquo;</a> -->

                    </article>

                </div>
            {% if (forloop.index0 % 3 == 2) or (forloop.last) %}
            </div>
            {% endif %}

        {% endfor %}
    {% endif %}

{% endfor %}
</div>


<!-- list out each category's posts -->
{% for category in page.categories %}
<!-- {{ title }} -->    
<div id="{{ category.tag }}" class="{{ category.tag }} post-group" style="display:none">
    {% assign projects = site.tags.[category.tag] %}
    {% if projects %}
        {% for project in projects limit %}

            {% comment %} shell out the row structure {% endcomment %}
            {% if forloop.index0 % 3 == 0 %}
            <div class="row" >
            {% endif %}
                <div class="span4">
                    <!-- render_portfolio_excerpt(project, 'post'+' '+tag) -->
                    <article class='{{ project.class }}' >

                        {% comment %} the post's title {% endcomment %}
                        <h2><a href="{{ project.url }}">{{ project.title }}</a></h2>

                        {% comment %} if there's a thumb, load both color and b/w versions {% endcomment %}
                        {% if project.thumb %}
                        <a href="{{ project.url }}" class="bwrollover">
                            <img src="http://dory-magickly.herokuapp.com?src={{ project.thumb }}&grayscale=true&thumb=300x200%23" class="gray"/>
                            <img src="http://dory-magickly.herokuapp.com?src={{ project.thumb }}&thumb=300x200%23" class="color" style="display:none"/>
                        </a>
                        {% endif %}
                        
                        {% comment %} blurb! {% endcomment %}
                        {{ project.excerpt }}
                        
                        {% comment %}read more? {% endcomment %}
                        <!-- <a href="{{ content_url(res.url) }}">Read more &raquo;</a> -->

                    </article>

                </div>
            {% if (forloop.index0 % 3 == 2) or (forloop.last) %}
            </div>
            {% endif %}

        {% endfor %}
    {% endif %}
</div>
{% endfor %}
