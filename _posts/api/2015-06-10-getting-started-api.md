---
layout: docs
title: "Artisan API"
author: "Artisan"
category: dev/api
description: "Getting Started with the Artisan API"
---

# Getting Started with the Artisan API

<div id="installation"></div>

## Generating API Keys

To use the Artisan API, you must first create an API Key and Secret Key:

<img src="/images/screens/api-key-generate-736x253.png" class="border-full"/>

<ol>
	<li>Login to <a href="https://artisantools.com" target="_blank">https://artisantools.com</a> and go to 'Account Settings'.</li>
	<li>Under API Settings, click the button to generate a new key.<br /><strong>NOTE:</strong> Make sure to note down the secret key in a secure place, because this is the only time it will be shown. After this point, if you lose the secret key, you will have to revoke API access and generate a new public-private key pair.</li>
	<li>Create an entry in the IP whitelist for the IP address(es) from which you will be making API calls, specified in <a href="">CIDR format</a>. You may add as many IP ranges as you like, but you must include the one you intend to use to make API calls.</li>
</ol>

## Calling the Artisan API

See the [Artisan API Reference]({% post_url api/2015-06-10-api-reference %}) for a list of available calls, their parameters, and sample responses.

## Installing the Ruby Gem

Artisan provides a Ruby gem wrapper for the API. Read more in the [Ruby Gem Guide]({% post_url api/2015-06-10-api-rubygem %}).