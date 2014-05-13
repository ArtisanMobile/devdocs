---
layout: docs
title: "Event Tracking"
author: "Artisan"
category: dev/ios
description: "Event tracking with the Artisan iOS SDK"
---
#Event Tracking

Artisan automatically collects analytics events for every user, session, page view, tap and other user interactions. There's nothing you need to add to your app to capture those events. But, there are times when you want to capture an event that doesn't correspond directly to a tap or navigation, or maybe you want to capture more information with a particular tap or event. To capture these custom analytics events we have the ARTrackingManager class in our API.

<ul>
  <li><a href="#trackevent">Track Event</a></li>
  <li><a href="#nameviewcontroller">Naming View Controllers</a></li>
  <li><a href="#nameview">Naming Views</a></li>
</ul>

<div id="trackevent"></div>

##Track Event

ARTrackingManager manages all in-code custom analytics tracking designed for use with Artisan.

The **trackEvent:** and **trackEvent:parameters** methods allow you to track an event by name.

{% highlight objective-c %}
[ARTrackingManager trackEvent:@"itemsInCartAreNowOutofStock"];
{% endhighlight %}

with an optional dictionary of name/value pairs.

{% highlight objective-c %}
[ARTrackingManager trackEvent:@"itemsInCartAreNowOutofStock" parameters:@{@"numberOfItems":@"2"}];
{% endhighlight %}

<div id="nameviewcontroller"></div>

##Naming View Controllers
The Artisan SDK adds the property artisanNameTag to all UIViewController classes through the use of an Objective-C category.

If the artisanNameTag property is assigned the Artisan platform will use the artisanNameTag instead of the generated name when displaying the view controller while building an experiment and in analytic reports.

{% highlight objective-c %}
self.artisanNameTag = @"Login Screen";
{% endhighlight %}

<div id="nameview"></div>

##Naming Views
Each UIView class contains the Apple property \'tag\' allowing you to uniquely identify a view with an NSInteger value.  The Artisan SDK adds the property artisanNameTag to all UIView classes through the use if an Objective-C category.

If the artisanNameTag property is assigned the Artisan platform will use the artisanNameTag instead of the generated name for the view as it appears in the Artisan Canvas and in analytic reports.

{% highlight objective-c %}
button = [UIButton buttonWithType:UIButtonTypeCustom];
button.artisanNameTag = @"Add Button";

[self.view addSubview:button];
{% endhighlight %}

<div class="note note-hint">
  <p>Hint: Using a unique artisanNameTag for UIViews enables the targeting of specific UI changes made with the Artisan Canvas.  This works well for dynamic views that may or may not appear every time a particular screen is displayed.</p>
</div>
