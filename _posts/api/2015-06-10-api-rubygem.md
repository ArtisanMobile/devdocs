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
  <li><a href="#rb-installation">Installation</a></li>
  <li><a href="#rb-apps">Apps</a>
    <ul>
      <li><a href="#rb-listApps">Listing Apps</a></li>
    </ul>
  </li>
  <li><a href="#rb-profileapi">Profiles</a>
    <ul>
      <li><a href="#rb-getProfileById">get_profile_by_artisan_id(application_id, profile)</a></li>
      <li><a href="#rb-getProfileById">get_profile_by_shared_user_id(application_id, shared_user_id)</a></li>
      <li><a href="#rb-getProfilesById">get_profiles_by_artisan_id(application_id, [profiles])</a></li>
      <li><a href="#rb-getProfilesById">get_profiles_by_shared_user_id(application_id, [shared_user_ids])</a></li>
    </ul>
  </li>
  <li><a href="#rb-segmentapi">Segments</a>
    <ul>
      <li><a href="#rb-listSegments">list_segments(application_id)</a></li>
      <li><a href="#rb-segmentExport">export_segment(application_id, segment_id, callback_url)</a></li>
    </ul>
  </li>
  <li><a href="#rb-jobapi">Jobs</a>
    <ul>
      <li><a href="#rb-getJob">get_job(job_id)</a></li>
      <li><a href="#rb-listJobs">list_jobs(status)</a></li>
    </ul>
  </li>
</ul>

<div id="rb-installation"></div>

## Installation

(TODO once we decide where to keep the gem? i.e. in the rubygems repo?)

<div id="rb-apps"></div>

## Apps API

<div id="rb-listApps"></div>

### list_apps()


List all the apps belonging to your organization by app ID and name.

Example call:

{% highlight ruby %}
@client = Useartisan::Client.new("https://artisantools.com","your_public_api_key","your_secret_api_key")
puts @client.list_apps()
{% endhighlight %}

Example response:

{% highlight json %}
{
  "apps": [
    {
      "id": "5550dd57330eb93d8700000c",
      "name": "Demo App 1"
    },
    {
      "id": "5564e1bf330eb98a9a00003a",
      "name": "Demo App 2"
    }
  ]
}
{% endhighlight %}

<div id="rb-profileapi"></div>

## Profile API

<div id="rb-getProfileById"></div>

### get_profile_by_artisan_id(application_id, profile)<br />get_profile_by_shared_user_id(application_id, shared_user_id)

#### Parameters

* `application_id`: (String) Application ID for your app.
* `profile`: (String) Artisan-assigned ID (device ID) for the profile you want to fetch.
* `shared_user_id`: (String) Shared User ID for the profile you want to fetch.

Returns a JSON object containing details about the requested profile.

{% highlight ruby %}
@client = Useartisan::Client.new("https://artisantools.com","your_public_api_key","your_secret_api_key")
puts @client.get_profile_by_artisan_id("your_app_id", "555652247d891c8b7a000002")
puts @client.get_profile_by_shared_user_id("your_app_id", "z5k5x7tcpmmr5p4on3aw")
{% endhighlight %}

Example response:

{% highlight json %}
{
  "success": true,
  "response": {
    "identifier": "bdbbf66f-d661-4236-8237-76d4159344fe",
    "identifierSource": "artisan",
    "href": "https://artisantools.com/public/api/apps/557ade8b7d891cee96000001/users/bdbbf66f-d661-4236-8237-76d4159344fe?source=artisan",
    "attributes": {
      "osVersion": "7.1.2",
      "geo-administrativeArea": "PA",
      "userSessionCount": "1",
      "appBuild": "2.0",
      "geo-coordinate": "48.8600,2.3500",
      "geo-locality": "Philadelphia",
      "lastSessionDate": "",
      "sdkVersion": "2.2.8",
      "artisanSessionCount": "3",
      "geo-countryCode": "US",
      "interfaceIdiom": "iPhone",
      "appVersion": "1.2",
      "currentSegments": "",
      "minutesFromGMT": "570",
      "deviceToken": "bdbbf66f-d661-4236-8237-76d4159344fe",
      "hardwareType": "iPhone5,2",
      "age": "54",
      "pushEnabled": "NO",
      "artisanAppId": "557ade8b7d891cee96000001",
      "language": "ru",
      "sharedUserId": "3ebb8a9f-6a36-43b2-82da-1f785c562fdd",
      "osName": "iPhone OS"
    }
  }
}
{% endhighlight %}

<div id="rb-getProfilesById"></div>

### get_profiles_by_artisan_id(application_id, [profiles])<br />get_profiles_by_shared_user_id(application_id, [shared_user_ids])

#### Parameters

* `application_id`: (String) Application ID for your app.
* `[profiles]`: (array) Device IDs for the profiles you want to fetch.
* `[shared_user_ids]`: (array) Shared User IDs for the profiles you want to fetch.
* `callback_url`: (String) Once the job finishes, this URL will be sent the download path for the file. This URL should point to a local server with the appropriate port open.

Request the specified user profile(s) to be exported.

{% highlight ruby %}
@client = Useartisan::Client.new("https://artisantools.com","your_public_api_key","your_secret_api_key")
@client.get_profiles_by_artisan_id("your_app_id", ["555652247d891c8b7a000002", "15652247d891c8b7a000504"], "your_callback_url")
@client.get_profiles_by_shared_user_id("your_app_id", ["shared_user_id_1", "shared_user_id_2"], "your_callback_url")
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

<div id="rb-jobapi"></div>

## Status API

<div id="rb-getJob"></div>

### get_job(job_id)

#### Parameters

* `job_id`: (String) ID of the job you wish to retrieve details for.

Returns a JSON object containing details for the specified job.

{% highlight ruby %}
@client = Useartisan::Client.new("https://artisantools.com","your_public_api_key","your_secret_api_key")
puts @client.get_job("your_job_id")
{% endhighlight %}

Example response:

{% highlight json %}
{
  "jobs": [
    {
      "id": "your_job_id",
      "type": "",
      "created_at": "2015-06-12T17:14:58Z",
      "start": "2015-06-12T17:14:17+00:00",
      "end": null,
      "status": "RUNNING",
      "result_url": null
    }
  ]
}
{% endhighlight %}

<div id="rb-listJobs"></div>

### list_jobs(status)

#### Parameters

* *(optional)* `status`: (String) If specified, only jobs with this status will be listed. Valid statuses are `QUEUED`, `RUNNING`, `COMPLETE`, and `FAILED`.

List details for all jobs that have the specified status.

{% highlight ruby %}
@client = Useartisan::Client.new("https://artisantools.com","your_public_api_key","your_secret_api_key")
all_jobs = @client.list_jobs
completed_jobs = @client.list_jobs("COMPLETE")
{% endhighlight %}

Example response:

{% highlight json %}
{
  "jobs": [
    {
      "id": "557b14cb2e62106169000002",
      "type": "",
      "created_at": "2015-06-12T17:20:11Z",
      "start": "2015-06-12T17:14:17+00:00",
      "end": null,
      "status": "COMPLETE",
      "result_url": null
    },
    {
      "id": "557b2f092e62106169000003",
      "type": "",
      "created_at": "2015-06-12T19:12:09Z",
      "start": "2015-06-12T17:14:17+00:00",
      "end": null,
      "status": "COMPLETE",
      "result_url": null
    },
    {
      "id": "557b39552e62101883000001",
      "type": "",
      "created_at": "2015-06-12T19:59:00Z",
      "start": "2015-06-12T19:55:52+00:00",
      "end": null,
      "status": "COMPLETE",
      "result_url": null
    }
  ]
}
{% endhighlight %}

<div id=""></div>

<div id=""></div>

<div id=""></div>

<div id=""></div>

<div id=""></div>