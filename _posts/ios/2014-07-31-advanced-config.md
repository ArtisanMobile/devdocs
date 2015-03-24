---
layout: docs
title: "Advanced Configuration"
author: "Artisan"
category: dev/ios
description: "Advanced Configuration for the Artisan iOS SDK"
---
#Advanced Configuration

The Artisan iOS SDK has a number of additional configurations that can be applied to tailor your installation.  This guide describes the means to apply these advanced configurations and deploy them within your Artisan-enabled app.

<ul>
  <li><a href="#config-dictionary">The Artisan Configuration Dictionary</a></li>
  <li><a href="#pii-filters">Filtering Personally Identifiable Information from Artisan Analytics</a></li>
  <li><a href="#disable-gesture">Disable the Artisan Gesture</a></li>
  <li><a href="#enable-gesture">Enable the Artisan Gesture</a></li>
</ul>

<div id="config-dictionary"></div>

## The Artisan Configuration Dictionary

The `[ARManager startWithAppId:]` command in Objective-C, ARManager.startWithAppId command in Swift, used to start Artisan can optionally accept an NSDictionary of configuration parameters.  This NSDictionary can contain any or all of the advanced configuration options described later in this guide.  The following is an example usage of the configuration dictionary to permanently disable the Artisan Gesture:

{% highlight objective-c %}
// Objective-C

NSDictionary *advancedConfig = @{@"override_enable_artisan_gesture" : @NO,
                                 @"never_enable_artisan_gesture" : @YES};

[ARManager startWithAppId:@"YOUR_APP_ID" options:advancedConfig];
{% endhighlight %}

{% highlight swift %}
// Swift

let advancedConfig = ["override_enable_artisan_gesture":false,
                      "never_enable_artisan_gesture":true]
ARManager.startWithAppId("YOUR_APP_ID", options:advancedConfig)
{% endhighlight %}

<div id="pii-filters"></div>

## Filtering Personally Identifiable Information from Artisan Analytics

If your application needs to filter PII (personally identifiable information) at the app level to prevent transmission of sensitive information to Artisan, you can set list of regular expressions for data that needs to be redacted in your advanced configuration (see above).

{% highlight objective-c %}
// Objective-C

NSDictionary *advancedConfig = [NSMutableDictionary dictionary];
NSString *longNumberFilter = @"^[1-9][0-9]{5,50}$";
NSString *emailAddressFilter = @"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$";
[advancedConfig setValue:@[longNumberFilter,emailAddressFilter] forKey:@"PIIRegexFilters"];
[ARManager startWithAppId:@"YOUR_APP_ID" options:advancedConfig];
{% endhighlight %}

All analytics variables will be compared against the supplied regular expressions. This includes <a href="/dev/ios/user-profiles/">user profile variable</a> values, <a href="/dev/ios/event-tracking/#artisan-event-tags">tags for automatically collected events</a>, <a href="/dev/ios/event-tracking/#trackevent">custom event</a> metadata and <a href="/dev/ios/event-tracking/#commerce">commerce</a> and <a href="/dev/ios/event-tracking/#social">social</a> event metadata.

Values that match the supplied regular expressions will be replaced with REDACTED before they leave the device and are sent over to Artisan. You may see these in your Events report on Artisan tools as tags or category values.

<div class="note note-hint">
<p>This feature is available on Artisan 2.4.3 and above.</p>
</div>

<div id="disable-gesture"></div>

## Disable the Artisan Gesture

The Artisan Gesture is enabled by default to allow you to connect your app to the artisantools.com Design Center. The gesture is only accessible when a user within your organization is actively viewing the 'Connect Your Device' dialog for that app.  However, there are instances where you might prefer that the gesture be disabled permanently -- for example, when submitting the production version of your app through the App Store.

To permanently disable the gesture, set the `@"never_enable_artisan_gesture"` option to `@YES` in Objective-C, `"never_enable_artisan_gesture"` and `true` respectively in Swift, in the configuration dictionary passed into `startWithAppId:options:`.

{% highlight objective-c %}
// Objective-C

NSDictionary *advancedConfig = @{@"never_enable_artisan_gesture" : @YES};

[ARManager startWithAppId:@"YOUR_APP_ID" options:advancedConfig];
{% endhighlight %}

{% highlight swift %}
// Swift

let advancedConfig = ["never_enable_artisan_gesture" : true]

ARManager.startWithAppId("YOUR_APP_ID", options:advancedConfig)
{% endhighlight %}

When disabled this way, the Artisan gesture for your app will never be accessible regardless of what users within your organization are doing on artisantools.com.

<div id="enable-gesture"></div>

## Enable the Artisan Gesture

There may be instances where you want the Artisan Gesture to always be available (such as when building tests using a local or TestFlight deployment).  

The gesture can be made permanently accessible, set the `@"override_enable_artisan_gesture"` option to `@YES` in Objective-C, `"override_enable_artisan_gesture"` and `true` respectively in Swift, in the configuration dictionary passed into `startWithAppId:options:`.

{% highlight objective-c %}
// Objective-C

NSDictionary *advancedConfig = @{@"override_enable_artisan_gesture" : @YES};

[ARManager startWithAppId:@"YOUR_APP_ID" options:advancedConfig];
{% endhighlight %}

{% highlight swift %}
// Swift

advancedConfig = ["override_enable_artisan_gesture" : true]

ARManager.startWithAppId("YOUR_APP_ID", options:advancedConfig)
{% endhighlight %}

When overridden this way, the Artisan gesture for your app will always be accessible regardless of what users within your organization are doing on artisantools.com.
