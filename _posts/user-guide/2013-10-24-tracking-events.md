---
layout: user-guide
title: "Tracking and Tagging Events"
author: "Artisan"
category: user-guide/analyze
description: "Getting started with the Artisan MEM platform for developers."
---
# Reports & Analytics

## Tracking and Tagging Events

### What Artisan Collects Automatically

Artisan automatically collects all key information about how your app is used by all of your current users. Events that are automatically collected include:

* Screen Views
* Button Taps
* Segmented Control Taps
* Table Cell Selections
* Session Start and Completion
* In-App Purchases and Commerce Events (iOS Only)
* Social Shares via Social Share API (iOS Only)
* App Crashes (iOS Only)
* Push Notification Opens

All collected events are automatically added to the Artisan Event Library, and will appear on the [Artisan Event Report]({% post_url user-guide/2013-10-24-managing-events %}) in near-real time.  The names and locations for all automatically collected events are inferred from the code of your app, and can be customized in the Artisan Event Report as needed.  

Additionally, Artisan will begin assembling a user profile for all users using the app, which can be used to support [Artisan Personalization and Segmentation]({% post_url user-guide/2014-06-11-people %}).  User profile information that Artisan will automatically collect for each user includes:

* The number of times this user has used this app (since Artisan was installed).
* The last time this user used this app.
* The user's device.
* The user's OS version.
* The user's langauge.
* The user's timezone.
* The version of the app.
* Whether the user has push notifications enabled for this app.
* The user's country.
* The user's state or province.
* The user's city.
* The user's GPS coordinate (using location services if avaiable, IP lookup if not)

### Tracking Additional Custom Events in Artisan

Additional custom events can be manually collected via the Artisan Event Tracking API ([iOS]({% post_url ios/2014-05-09-event-tracking %}), [Android]({% post_url android/2014-05-08-event-tracking %}), [JS]({% post_url js/2014-07-18-hybrid-sdk-reference-guide %}/#trackEvent)). This API is available for capturing events triggered within the business logic of your app or events not automatically collected by Artisan.

All custom events are automatically added to the Artisan Event Library with the name specified in the SDK, and can be tagged and modified as necessary.

<div id="context-tags"></div>

#### Context Tags

The Artisan Event Tracking API can also add context tags and categories to the information that Artisan tracks.  These tags and categories can be used to filter the Artisan Event Report, as well as to see a breakdown of how often a given tagged event occurs in the wild.

For example, an 'Order Complete' event can be tagged with the StoreID where the user placed their order, as well as the CouponID they used when they made the order.  This will allow you to see the breakdown of which coupons users have used in the app, as well as which stores they've placed orders from, as noted in the Artisan Event Report example below.

<p><img src="/images/screens/event-tagging-screenshot-1000x750.png" width="700" height="525" alt="Screen capture of an example of Artisan tags." /></p>

There are three ways in which context tags can be applied to your analytics events:

* Pass them as parameters to a custom Artisan trackEvent call via the Artisan Event Tracking API.
* Attach tags to your app's screens in code to apply them to any event Artisan automatically collects on that screen.  See the [Artisan Event Tracking API]({% post_url ios/2014-05-09-event-tracking %}/#event-tagging) for more detail.
* Register User Profile Variables and use the Artisan Profile Tagging capability to apply them to a specific event.  See [Managing Events]({% post_url user-guide/2013-10-24-managing-events %}/#profile-tags) for more detail.

Through any of these methods, these context tags will automatically be collected to enrich your Artisan analytics data and better illustrate what your users are doing in your app and what you can do to improve it.


