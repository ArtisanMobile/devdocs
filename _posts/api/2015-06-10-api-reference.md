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
  <li><a href="#segments">Segments</a>
  	<ul>
  		<li><a href="#listSegments">Listing Segments</a></li>
  		<li><a href="#exportSegments">Exporting Segments</a></li>
  	</ul>
  </li>
  <li><a href="#profiles">Profiles</a>
  	<ul>
  		<li><a href="#getIndividualProfilesArtisanId">Getting Individual User Profiles by Artisan ID</a></li>
      <li><a href="#getMultipleProfilesArtisanId">Getting Multiple User Profiles by Artisan ID</a></li>
  		<li><a href="#getProfilesSUID">Getting User Profiles by Shared User ID</a></li>
  		<li><a href="#exportProfiles">Exporting Profiles</a></li>
  	</ul>
  </li>
  <li><a href="#jobs">Jobs</a>
  	<ul>
  		<li><a href="#getJobs">Getting Details For All Jobs</a></li>
  		<li><a href="#getJob">Getting Individual Job Details</a></li>
  		<li><a href="#getJobsByStatus">Getting Jobs By Status</a></li>
  	</ul>
  </li>
</ul>

<div id="authentication"></div>

## Authentication

Every call made to the Artisan API must be authenticated using a public key and a secret key. For information on how to generate a new pair of keys for your organization, see the guide to [Managing Your Account]({% post_url user-guide/2015-06-10-managing-account %}).

Authenticate your API calls by including the following headers:

{% highlight rest %}
Accept-Encoding: application/json
Content-Type: application/json
Authorization: Token token="your_secret_key"
public-api-key: your_public_key
{% endhighlight %}

<div id="segments"></div>

## Segment Endpoints

Segments allow you to group users into lists based on behavior, in-app events, device type, operating sytem, geography, and other user profile attributes. You can request segment information and export segments using the `/public/api/apps/{app_id}/segments/` endpoint.

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
      "name": "20 to 28 year-olds"
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
POST /public/api/apps/{app_id}/segments/{segment_id}
Parameters: {"callbackUrl": "your_callback_url"}
{% endhighlight %}

Once the requested segment export finishes, the callback URL (specified by `your_callback_url`) will be sent the download path for the file. This URL should point to a local server with the appropriate port open. Make sure to replace `{app_id}` with your unique application ID, and `{segment_id}` with the ID of the segment you wish to export.

Example response:

{% highlight json %}

{% endhighlight %}

<div id="profiles"></div>

## Profile Endpoints

<div id="getIndividualProfilesArtisanId"></div>

### Getting Individual User Profile Details by Artisan ID

{% highlight rest %}
GET /public/api/apps/{app_id}/users/{user_id}
{% endhighlight %}

Get a single user profile by their Artisan (device) ID. Make sure to replace `{app_id}` with your unique application ID.

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

<div id="getMultipleProfilesArtisanId"></div>

### Getting Multiple User Profile Details by Artisan ID

{% highlight rest %}
POST /public/api/apps/{app_id}/users
Parameters: {"ids": "id_1,id_2"}
{% endhighlight %}

Get a list of profiles by their Artisan (device) IDs, where `"id_1,id_2"` is a comma-separated string of the Artisan IDs of the desired profiles. Make sure to replace `{app_id}` with your unique application ID.

Example response:

{% highlight json %}

{% endhighlight %}

<div id="getProfilesSUID"></div>

### Getting User Profiles by Shared User ID

{% highlight rest %}
POST /public/api/apps/{app_id}/users/{user_id}
Parameters: {"source": "custom"}
{% endhighlight %}

Get a single user profile by their Shared User ID. Make sure to replace `{app_id}` with your unique application ID. 

{% highlight rest %}
POST /public/api/apps/{app_id}/users
Parameters: {"source": "custom",
             "ids": "shared_user_id_1,shared_user_id_2"}
{% endhighlight %}

Get a list of user profiles by their Shared User IDs, where `"shared_user_id_1,shared_user_id_2"` is a comma-separated string of the Shared User IDs of the desired profiles. Make sure to replace `{app_id}` with your unique application ID.

Example response:

{% highlight json %}

{% endhighlight %}

<div id="exportProfiles"></div>

### Exporting Profiles

{% highlight rest %}
POST /public/api/apps/{app_id}/users/export
Parameters: {"callbackUrl": "your_callback_url"}
{% endhighlight %}

Once the requested profiles export finishes, the callback URL (specified by `your_callback_url`) will be sent the download path for the file. This URL should point to a local server with the appropriate port open. Make sure to replace `{app_id}` with your unique application ID.

Example response:

{% highlight json %}

{% endhighlight %}

<div id="jobs"></div>

## Job Endpoints

<div id="getJobs"></div>

### Getting Details For All Jobs

{% highlight rest %}
GET /public/api/jobs
{% endhighlight %}

List all jobs for your organization and their associated information, including:

* job ID

* job description

* job status (queued, running, completed, or failed)

* start and end times

* the result URL. This URL points to the location from which to download the results of the job, and will also be sent to the callback URL associated with the job (if applicable). 

Example response:

{% highlight json %}
{
  "jobs": [
    {
      "jobs": {
        "_id": "557b14cb2e62106169000002",
        "created_at": "2015-06-12T17:20:11Z",
        "description": "",
        "end": null,
        "result_url": null,
        "identifier": "",
        "organization_id": "556cb0c52e62109ed6000006",
        "start": "2015-06-12T17:14:17+00:00",
        "status": "RUNNING",
        "type": "",
        "updated_at": "2015-06-12T18:39:07Z"
      }
    },
    {
      "jobs": {
        "_id": "557b2f092e62106169000003",
        "created_at": "2015-06-12T19:12:09Z",
        "description": "",
        "end": null,
        "identifier": "",
        "organization_id": "556cb0c52e62109ed6000006",
        "result_url": null,
        "start": "2015-06-12T17:14:17+00:00",
        "status": "QUEUED",
        "type": "",
        "updated_at": "2015-06-12T19:12:27Z"
      }
    }
  ]
}
{% endhighlight %}

<div id="getJob"></div>

### Getting Individual Job Details

{% highlight rest %}
GET /public/api/jobs/{job_id}
{% endhighlight %}

List details for the job denoted by `{job_id}`. See the previous section for a description of what information is included among these details.

Example response:

{% highlight json %}
{
  "jobs": [
    {
      "jobs": {
        "_id": "557b14cb2e62106169000002",
        "created_at": "2015-06-12T17:20:11Z",
        "description": "",
        "end": null,
        "result_url": null,
        "identifier": "",
        "organization_id": "556cb0c52e62109ed6000006",
        "start": "2015-06-12T17:14:17+00:00",
        "status": "RUNNING",
        "type": "",
        "updated_at": "2015-06-12T18:39:07Z"
      }
    }
  ]
}
{% endhighlight %}

<div id="getJobsByStatus"></div>

### Getting Jobs By Status

{% highlight rest %}
GET /public/api/jobs/status/{status}
{% endhighlight %}

List details for all jobs that have the specified status. Make sure to replace `{status}` with the desired status you wish to query for. Valid statuses are `QUEUED`, `RUNNING`, `COMPLETED`, and `FAILED`.

Example response:

{% highlight json %}
{
  "jobs": [
    {
      "jobs": {
        "_id": "557b14cb2e62106169000002",
        "created_at": "2015-06-12T17:20:11Z",
        "description": "",
        "end": null,
        "result_url": null,
        "identifier": "",
        "organization_id": "556cb0c52e62109ed6000006",
        "start": "2015-06-12T17:14:17+00:00",
        "status": "COMPLETE",
        "type": "",
        "updated_at": "2015-06-12T18:39:07Z"
      }
    },
    {
      "jobs": {
        "_id": "557ed46a2e621085d0000001",
        "created_at": "2015-06-15T13:37:15Z",
        "description": "",
        "end": null,
        "result_url": null,
        "identifier": "",
        "organization_id": "556cb0c52e62109ed6000006",
        "start": "2015-06-15T13:34:34+00:00",
        "status": "COMPLETE",
        "type": "",
        "updated_at": "2015-06-15T13:37:15Z"
      }
    }
  ]
}
{% endhighlight %}

