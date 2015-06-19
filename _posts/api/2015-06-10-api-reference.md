---
layout: docs
title: "Artisan API"
author: "Artisan"
category: dev/api
description: "Artisan API Reference Guide"
---

# Artisan API Reference Guide

This document provides an overview of the REST API endpoints for the Artisan platform.

## Table of Contents

<ul>
  <li><a href="#authentication">Authentication</a></li>	
  <li><a href="#apps">Apps</a>
    <ul>
      <li><a href="#listApps">Listing Apps</a></li>
    </ul>
  </li>
  <li><a href="#profiles">Profiles</a>
    <ul>
      <li><a href="#getProfiles">Getting User Profile Information</a></li>
      <li><a href="#exportProfiles">Exporting User Profiles</a></li>
    </ul>
  </li>
  <li><a href="#segments">Segments</a>
  	<ul>
  		<li><a href="#listSegments">Listing Segments</a></li>
  		<li><a href="#exportSegments">Exporting Segments</a></li>
  	</ul>
  </li>
  <li><a href="#jobs">Jobs</a>
  	<ul>
  		<li><a href="#listJobs">Listing Jobs</a></li>
  		<li><a href="#getJob">Getting Individual Job Details</a></li>
      <li><a href="#downloadJob">Downloading A Job</a></li>
  	</ul>
  </li>
</ul>

<div id="authentication"></div>

## Authentication

Every call made to the Artisan API must be authenticated using a public key and a secret key. For information on how to generate a pair of keys for your organization, see the [Getting Started Guide]({% post_url api/2015-06-10-getting-started-api %}).

Authenticate your API calls by including the following headers:

{% highlight rest %}
Accept-Encoding: application/json
Content-Type: application/json
Authorization: Token token="your_secret_key"
public-api-key: your_public_key
{% endhighlight %}

<div id="apps"></div>

## App Endpoints

<div id="listApps"></div>

### Listing Apps

{% highlight rest %}
GET /public/api/apps
{% endhighlight %}

List all the apps belonging to your organization by app ID and name.

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

<div id="profiles"></div>

## Profile Endpoints

User profiles contain information about the users for an app, and can be queried using their Artisan-assigned IDs or their Shared User IDs. Multiple user profiles can be exported and downloaded as a JSON file.

<div id="getProfiles"></div>

### Getting User Profile Information

#### Getting User Profile Information by Artisan ID

{% highlight rest %}
GET /public/api/apps/{app_id}/users/{user_id}
{% endhighlight %}

Get details for a single user profile by their Artisan (device) ID. Make sure to replace `{app_id}` with your unique application ID.

#### Getting User Profile Information by Shared User ID

{% highlight rest %}
GET /public/api/apps/{app_id}/users/shared_id/{shared_user_id}
{% endhighlight %}

Get details for a single user profile by their Shared User ID. Make sure to replace `{app_id}` with your unique application ID and `{shared_user_id}` with the shared user ID of the profile you wish to fetch.

Example of a successful response:

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

Example of an unsuccessful response:

{% highlight json %}
{
  "success": false,
  "error": "Profile with the key 123456789 does not exist."
}
{% endhighlight %}

<div id="exportProfiles"></div>

### Exporting Profiles

#### Exporting Profiles by Artisan ID

{% highlight rest %}
POST /public/api/apps/{app_id}/users/export
Parameters: {"ids": "id_1,id_2",
             "callback_url": "your_callback_url"}
{% endhighlight %}

Request an export of the profiles denoted by `id_1,id_2`, a comma-separated string of Artisan IDs. Make sure to replace `{app_id}` with your unique application ID.

Once the requested profiles export finishes, the callback URL (specified by `your_callback_url`) will be sent the download path for the file. This URL should point to a local server with the appropriate port open.

#### Exporting Profiles by Shared User ID

{% highlight rest %}
POST /public/api/apps/{app_id}/users/shared_id/export
Parameters: {"ids": "shared_user_id_1,shared_user_id_2",
             "callback_url": "your_callback_url"}
{% endhighlight %}

Request an export of the profiles denoted by `shared_user_id_1,shared_user_id_2`, a comma-separated string of Shared User IDs. Make sure to replace `{app_id}` with your unique application ID.

Once the requested profiles export finishes, the callback URL (specified by `your_callback_url`) will be sent the download path for the file. This URL should point to a local server with the appropriate port open.

Example response:

{% highlight json %}
{
  "message": "Job queued successfully.",
  "job": "55809c9c7d891cb1bc000001"
}
{% endhighlight %}

<div id="segments"></div>

## Segment Endpoints

Segments allow you to group users into lists based on behavior, in-app events, device type, operating sytem, geography, and other user profile attributes. You can request segment information and export segments using the `/public/api/apps/{app_id}/segments` endpoint.

<div id="listSegments"></div>

### Listing Segments

{% highlight rest %}
GET /public/api/apps/{app_id}/segments/
{% endhighlight %}

List all segments by segment ID and name. Make sure to replace `{app_id}` with your unique application ID.

Example response:

{% highlight json %}
{
  "segments": [
    {
      "id": "557ee4697d891cd26f000003",
      "name": "Philadelphians"
    },
    {
      "id": "557ee4757d891cd26f000005",
      "name": "Under 20"
    },
    {
      "id": "557ee49c7d891cd26f000007",
      "name": "20 to 28 year olds"
    },
    {
      "id": "557ee4a77d891cd26f000009",
      "name": "Over 28"
    }
  ]
}
{% endhighlight %}

<div id="exportSegments"></div>

### Exporting Segments

{% highlight rest %}
POST /public/api/apps/{app_id}/segments/{segment_id}/export
Parameters: {"callback_url": "your_callback_url"}
{% endhighlight %}

Once the requested segment export finishes, the callback URL (specified by `callback_url`) will be sent the download path for the file. This URL should point to a local server with the appropriate port open. Make sure to replace `{app_id}` with your unique application ID, and `{segment_id}` with the ID of the segment you wish to export.

Example response:

{% highlight json %}
{
  "message": "Job queued successfully.",
  "job": "558093b47d891c3089000001"
}
{% endhighlight %}

<div id="jobs"></div>

## Job Endpoints

The jobs endpoint allows you to view all jobs for your organization, filter jobs by status, and download the results when a job is finished.

<div id="listJobs"></div>

### Listing Jobs

{% highlight rest %}
GET /public/api/jobs
{% endhighlight %}

List all jobs for your organization and their associated information.

{% highlight rest %}
GET /public/api/jobs?status={job_status}
{% endhighlight %}

List all jobs with the status specified by `{job_status}`. Valid statuses are `QUEUED`, `RUNNING`, `COMPLETE`, and `FAILED`.

Example response:

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

<div id="getJob"></div>

### Getting Individual Job Details

{% highlight rest %}
GET /public/api/jobs/{job_id}
{% endhighlight %}

List details for the job denoted by `{job_id}`.

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

<div id="downloadJob"></div>

### Downloading A Job

{% highlight rest %}
GET /public/api/jobs/{job_id}/download
{% endhighlight %}

Retrieve the results of the specified job after the job is finished.  

Example response:

{% highlight json %}
TODO
{% endhighlight %}

