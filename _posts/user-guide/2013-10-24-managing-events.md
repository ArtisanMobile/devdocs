---
layout: user-guide
title: "Managing Events"
author: "Artisan"
category: user-guide
description: "Getting started with the Artisan MEM platform for developers."
---
# Reports & Analytics

## Managing Events

The Event Report provides visibility into the actions triggered by users within your app (e.g. screens viewed, buttons tapped, events instrumented via the [iOS]({% post_url ios/2014-05-09-event-tracking %}), [Android]({% post_url android/2014-05-08-event-tracking %}) or [Javascript]({% post_url js/2014-07-18-hybrid-sdk-reference-guide %}#trackingapi) Event Tracking APIs, etc.).  

<p><img src="/images/screens/reports-event-example-700x576.jpg" width="700" height="576" alt="Screen capture of a sample event report." /></p>

<div id="event-library"></div>

### The Artisan Event Library

The left side of the screen shows your current event library.  You can add items to the event library by clicking the `Discover` button in the top-left corner of the screen.  This will open up the Event Discovery modal, where you can (a) select new events from the complete list of actions Artisan has automatically tracked, or (b) connect your device directly to Artisan to find the events you want to add to your library.

<p><img src="/images/screens/discovering-event-1247x817.gif" width="700" height="459" alt="Screen capture of a sample event report discovery." /></p>

Selecting an event from the event library will produce a report on how many times that event has occurred as well as how many times that event has occurred per user.

### Context Tags

As noted in [Tracking and Tagging Events]({% post_url user-guide/2013-10-24-tracking-events %}/#profile-tags), the Artisan Event Tracking API can add context tags and categories to the information that Artisan tracks.  These tags and categories can be used to filter the event report, as well as to see a breakdown of how often a given tagged event occurs in the wild.

For example, an 'Order Complete' event can be tagged with the StoreID where the user placed their order, as well as the CouponID they used when they made the order.  This will allow you to see the breakdown of which coupons users have used in the app, as well as which stores they've placed orders from.

<p><img src="/images/screens/event-tagging-screenshot-1000x750.png" width="700" height="525" alt="Screen capture of an example of Artisan tags." /></p>

<div id="profile-tags"></div>

### Profile Tags

Artisan can also filter events by the Aritsan User Profile attributes of the users who triggered them.  This breakdown is achieved through Artisan Profile Tags.  For an event that you want to see broken down by a profile attribute, click 'Add Profile Tag' under 'Manage Tags' and select the profile attributes for which you want to see this event broken down.  

Artisan will automatically scan the history of the event to see how often it has occurred for every possible value of that profile variable, and will keep that breakdown up-to-date in real time.

<p><img src="/images/screens/creating-profile-tag-1423x988.gif" width="700" height="486" alt="Screen capture of an example of creating an Artisan Profile Tag." /></p>

### Tag Families

If you want to see an event broken down by more than one tag at a time, you can use Artisan Tag Families.  Tag families are tags that been formed into a parent-child relationship, so you can see how often a given event occurred where the parent tag was one value and the child tag was another.

For example, if your app has a 'Redeem Coupon' event that has two tags -- Coupon ID and Store ID -- you can see how often each Coupon ID was redeemed for each store.  Build a Tag Family where the Store ID is the parent and the Coupon ID is the child, and you can see a breakdown of that event as follows:

<p><img src="/images/screens/reports-tag-family-1246x1233.png" width="700" height="693" alt="Screen capture of how to create tagged families." /></p>


