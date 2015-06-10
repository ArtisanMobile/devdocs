---
layout: docs
title: "Artisan API"
author: "Artisan"
category: dev/api
description: "Artisan API Ruby Gem Guide"
---

# Ruby gem API

This document provides an overview of the Ruby gem wrapper for the Artisan API.

<ul>
  <li><a href="#rb-profileapi">Profiles</a>
    <ul>
      <li><a href="#rb-getProfileById">get_profile_by_artisan_id(application_id, profile)</a></li>
      <li><a href="#rb-getProfileById">get_profile_by_shared_user_id(application_id, shared_user_id)</a></li>
      <li><a href="#rb-getProfileById">get_profiles_by_artisan_id(application_id, [profile])</a></li>
      <li><a href="#rb-getProfileById">get_profiles_by_shared_user_id(application_id, [shared_user_id])</a></li>
      <li><a href="#rb-downloadProfileExport">download_profile_export(url, path)</a></li>
    </ul>
  </li>
  <li><a href="#rb-segmentapi">Segments</a>
    <ul>
      <li><a href="#rb-listSegments">list_segments(application_id)</a></li>
      <li><a href="#rb-segmentExport">export_segment(application_id, segment_id, callback_url))</a></li>
      <li><a href="#rb-segmentExport">download_export(url, path)</a></li>
    </ul>
  </li>
  <li><a href="#rb-statusapi">Status</a>
    <ul>
      <li><a href="#rb-listJobs">list_jobs</a></li>
    </ul>
  </li>
</ul>

<div id="rb-profileapi"></div>

## Profile API

<div id="rb-getProfileById"></div>

### get_profile_by_artisan_id(application_id, profile)<br />get_profile_by_shared_user_id(application_id, shared_user_id)<br />get_profiles_by_artisan_id(application_id, [profile])<br />get_profiles_by_shared_user_id(application_id, [shared_user_id]

#### Parameters

* application_id: (String) Application ID for your app.

* profile: (String) Artisan-assigned ID (device ID) for the profile you want to fetch.

* shared_user_id: (String) Shared User ID for the profile you want to fetch.

* \[profile]: (array) Device IDs for the profiles you want to fetch.

* \[shared_user_id]: (array) Shared User IDs for the profiles you want to fetch.

(INSERT DESCRIPTION OF OUTPUT)

{% highlight ruby %}
@client = Useartisan::Client.new("https://artisantools.com","your_public_api_key","your_secret_api_key")
@client.get_profile_by_artisan_id("your_app_id", "555652247d891c8b7a000002")
@client.get_profile_by_shared_user_id("your_app_id", "z5k5x7tcpmmr5p4on3aw")
@client.get_profiles_by_artisan_id("your_app_id", ["555652247d891c8b7a000002", "15652247d891c8b7a000504"])
@client.get_profiles_by_shared_user_id("your_app_id", ["shared_user_id_1", "shared_user_id_2"])
{% endhighlight %}

<div id="rb-downloadProfileExport"></div>

### download_profile_export(url,path)

#### Parameters

* url: (String) Endpoint from which to download the segment.

* path: (String) Local path to which the downloaded profile export will be saved.

Download the export file containing the requested user profile data.

{% highlight ruby %}
path = "/tmp/profile.json"
url = @client.endpoint + "/public/api/apps/#{app}/users/#{segment}/download"
@client.download_segment_export(url,path)
{% endhighlight %}

<div id="rb-segmentapi"></div>

## Segments API

<div id="rb-listSegments"></div>

### list_segments(application_id)

(TODO)

<div id="rb-segmentExport"></div>

### export_segment(application_id, segment_id, callback_url)<br />download_export(url,path)

#### Parameters

* application_id: (String) Application ID for your app.

* segment_id: (String) ID of the segment to be exported

* callback_url: (String) (INSERT DESCRIPTION HERE)

Request the specified segment to be exported. (INSERT MORE ABOUT DOWNLOADING THE EXPORT HERE)

<div id="rb-statusapi"></div>

## Status API

<div id="rb-listJobs"></div>

### list_jobs

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