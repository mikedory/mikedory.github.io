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
    {% assign projectlimit = 3 %}
    {% include projects/projects_listing_by_all %}
</div>

{% assign projectlimit = 20 %}
{% include projects/projects_listing_by_tag %}


