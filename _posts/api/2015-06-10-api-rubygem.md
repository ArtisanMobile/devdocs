---
layout: docs
title: "Artisan API"
author: "Artisan"
category: dev/api
description: "Artisan API Ruby Gem Guide"
---

# Ruby Gem API

This document provides an overview of the Ruby gem wrapper for the Artisan API.

<ul>
  <li><a href="#rb-installation">Installation</a>
  <li><a href="#rb-profileapi">Profiles</a>
    <ul>
      <li><a href="#rb-getProfileById">get_profile_by_artisan_id(application_id, profile)</a></li>
      <li><a href="#rb-getProfileById">get_profiles_by_artisan_id(application_id, [profiles])</a></li>
      <li><a href="#rb-getProfileById">get_profile_by_shared_user_id(application_id, shared_user_id)</a></li>
      <li><a href="#rb-getProfileById">get_profiles_by_shared_user_id(application_id, [shared_user_ids])</a></li>
      <li><a href="#rb-profileExport">export_profiles(application_id, callback_url)</a></li>
    </ul>
  </li>
  <li><a href="#rb-segmentapi">Segments</a>
    <ul>
      <li><a href="#rb-listSegments">list_segments(application_id)</a></li>
      <li><a href="#rb-segmentExport">export_segment(application_id, segment_id, callback_url)</a></li>
    </ul>
  </li>
  <li><a href="#rb-statusapi">Status</a>
    <ul>
      <li><a href="#rb-listJobs">list_jobs()</a></li>
    </ul>
  </li>
</ul>

<div id="rb-installation"></div>

## Installation

(TODO once we decide where to keep the gem? i.e. in the rubygems repo?)

<div id="rb-profileapi"></div>

## Profile API

<div id="rb-getProfileById"></div>

### get_profile_by_artisan_id(application_id, profile)<br />get_profiles_by_artisan_id(application_id, [profiles])<br />get_profile_by_shared_user_id(application_id, shared_user_id)<br />get_profiles_by_shared_user_id(application_id, [shared_user_ids])

#### Parameters

* `application_id`: (String) Application ID for your app.
* `profile`: (String) Artisan-assigned ID (device ID) for the profile you want to fetch.
* `shared_user_id`: (String) Shared User ID for the profile you want to fetch.
* `[profiles]`: (array) Device IDs for the profiles you want to fetch.
* `[shared_user_ids]`: (array) Shared User IDs for the profiles you want to fetch.

Returns a JSON object containing details about the requested profile(s).

{% highlight ruby %}
@client = Useartisan::Client.new("https://artisantools.com","your_public_api_key","your_secret_api_key")
@client.get_profile_by_artisan_id("your_app_id", "555652247d891c8b7a000002")
@client.get_profile_by_shared_user_id("your_app_id", "z5k5x7tcpmmr5p4on3aw")
@client.get_profiles_by_artisan_id("your_app_id", ["555652247d891c8b7a000002", "15652247d891c8b7a000504"])
@client.get_profiles_by_shared_user_id("your_app_id", ["shared_user_id_1", "shared_user_id_2"])
{% endhighlight %}

<div id="rb-profileExport"></div>

### export_profiles(application_id, callback_url)

#### Parameters

* `application_id`: (String) Application ID for your app.
* `callback_url`: (String) Once the job finishes, this URL will be sent the download path for the file. This URL should point to a local server with the appropriate port open.

Request all user profiles to be exported.

{% highlight ruby %}
@client = Useartisan::Client.new("https://artisantools.com","your_public_api_key","your_secret_api_key")
@client.export_profiles("your_app_id", "your_callback_url")
{% endhighlight %}

<div id="rb-segmentapi"></div>

## Segments API

<div id="rb-listSegments"></div>

### list_segments(application_id)

#### Parameters

* `application_id`: (String) Application ID for your app.

List segments with ID and name.

{% highlight ruby %}
@client = Useartisan::Client.new("https://artisantools.com","your_public_api_key","your_secret_api_key")
segments = @client.list_segments(app)
puts segments
{% endhighlight %}

<div id="rb-segmentExport"></div>

### export_segment(application_id, segment_id, callback_url)

#### Parameters

* `application_id`: (String) Application ID for your app.
* `segment_id`: (String) ID of the segment to be exported.
* `callback_url`: (String) Once the job finishes, this URL will be sent the download path for the file. This URL should point to a local server with the appropriate port open.

Request the specified segment to be exported.

{% highlight ruby %}
@client = Useartisan::Client.new("https://artisantools.com","your_public_api_key","your_secret_api_key")
@client.export_segment(app,segment,"your_callback_url")
{% endhighlight %}

<div id="rb-statusapi"></div>

## Status API

<div id="rb-listJobs"></div>

### list_jobs()

Return a list of jobs and their statuses for the client.

{% highlight ruby %}
@client = Useartisan::Client.new("https://artisantools.com","your_public_api_key","your_secret_api_key")
jobs = @client.list_jobs
{% endhighlight %}

<div id=""></div>

<div id=""></div>

<div id=""></div>

<div id=""></div>

<div id=""></div>