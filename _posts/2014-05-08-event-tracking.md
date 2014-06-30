---
layout: docs
title: "Event Tracking"
author: "Artisan"
category: dev/android
description: "Event tracking with the Artisan Android SDK"
---

#Event Tracking

Artisan automatically collects analytics events for every user, session and page views. There's nothing you need to add to your app to capture those events. To capture other analytics events like taps and other user interactions we have the ArtisanTrackingManager class in our API.

<ul>
  <li><a href="#trackevent">Track Event</a></li>
</ul>

<div id="trackevent"></div>

##Track Event

ArtisanTrackingManager manages all in-code custom analytics tracking designed for use with Artisan.

The **trackEvent:** method with optional parameters allows you to track an event by name.

{% highlight java %}
ArtisanTrackingManager.trackEvent("Product Purchased");
{% endhighlight %}

with an optional dictionary of name/value pairs.

{% highlight java %}
Map<String, String> parameters = new HashMap<String, String>();
parameters.put("sku", "A0123456789");
parameters.put("product name", "Artisan Developer T-Shirt");
ArtisanTrackingManager.trackEvent("Product Purchased", parameters);
{% endhighlight %}
