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
  <li><a href="#status">Status</a></li>
  <li><a href="#segments">Segments</a></li>
  <li><a href="#profiles">Profiles</a></li>
</ul>

<div id="authentication"></div>

## Authentication

Every call made to the Artisan API must be authenticated using a public key and a secret key. For information on how to generate a new pair of keys for your organization, see the guide to [Managing Your Account]({% post_url user-guide/2015-06-10-managing-account %}).

{% highlight rest %}
Accept-Encoding: application/json
Content-Type: application/json
Authorization: Token token="your_secret_key"
public-api-key: your_public_key
{% endhighlight %}

<div id="Status"></div>

## Status Endpoints

### Getting Job Status

`GET /public/api/status`

List all jobs and their statuses.

<div id="Segments"></div>

## Segments Endpoints

Segments allow you to group users into lists based on behavior, in-app events, device type, operating sytem, geography, and other user profile attributes. You can request segment information and export segments using the `/public/api/apps/{app_id}/segments/` endpoint.

### Listing Segments

`GET /public/api/apps/{app_id}/segments/`

List all segments by id and name.

### Exporting Segments

`POST /public/api/apps/{app_id}/segments/{segment_id}`

`Parameters: {"callbackUrl": "callbackUrl"}`

Asynchronously prepare an export file containing all segments. When the export file has been created, `callbackUrl` is called so that the file can be downloaded. `callbackUrl` will include the URL from which to download the export file.

<div id="profiles"></div>

## Profiles Endpoints

### Getting User Profiles by Artisan ID

`GET /public/api/apps/{app_id}/users/{user_id}`

Get a single user profile by their Artisan (device) ID.

`GET /public/api/apps/{app_id}/users`

`Parameters: {"ids": "id_1,id_2"}`

Get a list of profiles by their Artisan (device) IDs.

### Getting User Profiles by Shared User ID

`GET /public/api/apps/{app_id}/users/{user_id}`

`Parameters: {"source": "custom"}`

Get a single user profile by their Shared User ID.

`GET /public/api/apps/{app_id}/users`

`Parameters: {"source": "custom", "ids": "shared_user_id_1,shared_user_id_2"}`

Get a list of user profiles by their Shared User IDs.

### Exporting Profiles

`POST /public/api/apps/{app_id}/users/export`

`Parameters: {"callbackUrl": "callbackUrl"}`

Asynchronously prepare an export file containing all profiles. When the export file has been created, `callbackUrl` is called so that the file can be downloaded.




