---
layout: docs
title: "Event Tracking"
author: "Artisan"
category: dev/android
description: "Event tracking with the Artisan Android SDK"
---

#Event Tracking

Artisan automatically collects analytics events for every user, session, page view, tap and other user interactions. There's nothing you need to add to your app to capture those events. But, there are times when you want to capture an event that doesn't correspond directly to a tap or navigation, or maybe you want to capture more information with a particular tap or event. To capture these custom analytics events we have the ArtisanTrackingManager class in our API.

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