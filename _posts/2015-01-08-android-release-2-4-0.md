---
layout: docs
title: Android 2.4.0 Release Notes
author: "Artisan"
category: release-notes
description: "What's new in Artisan's Mobile Experience Management platform."
---
# Android 2.4.0 Release Notes

Released {{ page.date | date: "%B %-d, %Y" }}

This release includes a major new feature for Android and Analytics--We now offer auto-collection of analytics events for user interactions like button taps and checkboxes. There is nothing you need to add to your app to take advantage of this new functionality, but for best results we recommend that you have good Android resource names for your views that users are interacting with. For more information about Analytics events and auto-collection see our <a href="/dev/android/event-tracking">event tracking</a> documentation.

This also signals the final retirement of the Android AspectJ instrumentation, which was the solution that we offered previously for auto-instrumentation of user interactions. Artisan AspectJ is no longer supported and has been removed from this release.

* [NEW] Added auto-collection of analytics events for user interactions with views in your app. This includes most views with click handlers that are under the contentView for your Activities that are instrumented with Artisan.
* [UPDATED] Updates to support Artisan JS SDK 2.1 including auto-instrumentation for dynamic web elements.
* [FIXED] Bug where analytics variables were occasionally duplicated on Analytics events.
* [FIXED] Bug that in rare occasions caused the app to crash after connecting to Artisan.
