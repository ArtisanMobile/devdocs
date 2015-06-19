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
  <li><a href="#rb-apps">Apps</a>
    <ul>
      <li><a href="#rb-listApps">list_apps()</a></li>
    </ul>
  </li>
  <li><a href="#rb-profileapi">Profiles</a>
    <ul>
      <li><a href="#rb-getProfiles">get_profile(application_id, artisan_id: nil, shared_user_id: nil)</a></li>
      <li><a href="#rb-exportProfiles">export_profiles(application_id, callback_url, artisan_ids: nil, shared_user_ids: nil)</a></li>
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
      <li><a href="#rb-listJobs">list_jobs(status=nil)</a></li>
      <li><a href="#rb-getJob">get_job(job_id)</a></li>
      <li><a href="#rb-downloadJob">download_job(job_id, download_path)</a></li>
    </ul>
  </li>
</ul>

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

<div id="rb-getProfiles"></div>

### get_profile(application_id, artisan_id: nil, shared_user_id: nil)

#### Parameters

* `application_id`: (String) Application ID for your app.
* `artisan_id`: (String) Artisan-assigned ID (device ID) for the profile you want to fetch.
* `shared_user_id`: (String) Shared User ID for the profile you want to fetch.

Returns a JSON object containing details about the requested profile. Note that you must pass in either `artisan_id` or `shared_user_id`, but not both.

{% highlight ruby %}
@client = Useartisan::Client.new("https://artisantools.com","your_public_api_key","your_secret_api_key")
puts @client.get_profile("your_app_id", artisan_id: "555652247d891c8b7a000002")
puts @client.get_profile("your_app_id", shared_user_id: "z5k5x7tcpmmr5p4on3aw")
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

<div id="rb-exportProfiles"></div>

### export_profiles(application_id, callback_url=nil, artisan_ids: nil, shared_user_ids: nil)

#### Parameters

* `application_id`: (String) Application ID for your app.
* *(optional)* `callback_url`: (String) Once the job finishes, this URL will be sent the download path for the file. This URL should point to a local server with the appropriate port open.
* `artisan_ids`: (array) Device IDs for the profiles you want to fetch.
* `shared_user_ids`: (array) Shared User IDs for the profiles you want to fetch.

Request the specified user profile(s) to be exported. Note that you must pass in either `artisan_ids` or `shared_user_ids`, but not both.

{% highlight ruby %}
@client = Useartisan::Client.new("https://artisantools.com","your_public_api_key","your_secret_api_key")
@client.export_profiles("your_app_id", "your_callback_url", artisan_ids: ["555652247d891c8b7a000002", "15652247d891c8b7a000504"])
@client.export_profiles("your_app_id", "your_callback_url", shared_user_ids: ["shared_id_1", "shared_id_2"])
{% endhighlight %}

Returns a JSON object upon success that contains the job ID, which can be used to download the export when it is complete. (See the <a href="#rb-downloadJob">job download</a> section for details.)

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

### export_segment(application_id, segment_id, callback_url=nil)

#### Parameters

* `application_id`: (String) Application ID for your app.
* `segment_id`: (String) ID of the segment to be exported.
* *(optional)* `callback_url`: (String) Once the job finishes, this URL will be sent the download path for the file. This URL should point to a local server with the appropriate port open.

Request the specified segment to be exported.

{% highlight ruby %}
@client = Useartisan::Client.new("https://artisantools.com","your_public_api_key","your_secret_api_key")
@client.export_segment(app,segment,"your_callback_url")
{% endhighlight %}

<div id="rb-jobapi"></div>

## Status API

<div id="rb-listJobs"></div>

### list_jobs(status=nil)

#### Parameters

* *(optional)* `status`: (String) If specified, only jobs with this status will be listed. Valid statuses are `QUEUED`, `RUNNING`, `COMPLETE`, and `FAILED`.

List details for all jobs that have the specified status. If no status is specified, all jobs for the organization will be listed.

{% highlight ruby %}
@client = Useartisan::Client.new("https://artisantools.com","your_public_api_key","your_secret_api_key")
all_jobs = @client.list_jobs()
completed_jobs = @client.list_jobs("COMPLETE")
{% endhighlight %}

Example response (stored in `completed_jobs`):

{% highlight json %}
{
  "jobs": [
    {
      "id": "5584469c7d891c1d06000001",
      "type": "Segments Export",
      "created_at": "2015-06-19T16:43:08Z",
      "start": "2015-06-19T16:33:56+00:00",
      "end": null,
      "status": "QUEUED"
    },
    {
      "id": "55844c787d891c7f56000001",
      "type": "Segments Export",
      "created_at": "2015-06-19T17:08:08Z",
      "start": "2015-06-19T17:04:16+00:00",
      "end": null,
      "status": "QUEUED"
    },
    {
      "id": "5584566b7d891ce0ab000001",
      "type": "Segments Export",
      "created_at": "2015-06-19T17:50:35Z",
      "start": "2015-06-19T17:50:10+00:00",
      "end": null,
      "status": "COMPLETE"
    }
  ]
}
{% endhighlight %}

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
  "_id": "5584566b7d891ce0ab000001",
  "created_at": "2015-06-19T17:50:35Z",
  "description": "",
  "end": null,
  "identifier": "sgmt-export",
  "organization_id": "52e7df69e206e7f84e000005",
  "start": "2015-06-19T17:50:10+00:00",
  "status": "COMPLETE",
  "type": "Segments Export",
  "updated_at": "2015-06-19T17:51:55Z"
}
{% endhighlight %}

<div id="rb-downloadJob"></div>

### download_job(job_id, download_path)

#### Parameters

* `job_id`: (String) ID of the job you wish to retrieve details for.
* `download_path`: (String) Path to a local file where the downloaded results will be saved. If the file exists, its previous contents will be overwritten; if it doesn't exist, it will be created.

Download the results of the specified job to the file at `download_path`.

{% highlight ruby %}
@client = Useartisan::Client.new("https://artisantools.com","your_public_api_key","your_secret_api_key")
# ...
# After the job has been created and the callback URL has been called,
# indicating that the job is complete
# ...
@client.download_job(job_id, "/tmp/job-export-results.json")
{% endhighlight %}

Example response:

{% highlight json %}
TODO
{% endhighlight %}
