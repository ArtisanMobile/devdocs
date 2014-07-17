---
layout: docs
title: "Android 2.1.7 Release Notes"
author: "Artisan"
category: release-notes
description: "What's new in Artisan's Mobile Experience Management platform."
---
#Android SDK 2.1.7 Release Notes

Released {{ page.date | date: "%B %-d, %Y" }}

* [NEW] Added <a href="/dev/android/event-tracking/#commerce">ArtisanPurchaseWorkflowManager</a> for tracking of commerce-specific analytics.
* [NEW] Added <a href="/dev/android/event-tracking/#social">ArtisanSocialSharingManager</a> for tracking of social share events for analytics.
* [NEW] Added <a href="/dev/android/callbacks">playlist and power hook callbacks</a> for Android! Now you can register for callbacks when the first playlist is downloaded, or when you power hook values change. You can even grab a reference to an individual power hook and register a call back for when that specific value changes. <a href="/dev/android/callbacks">Read more about it</a>.
* [UPDATED] We now support the option to automatically clear a notification after it is opened. Look for the option when you are creating your <a href="/user-guide/campaigns">Artisan Push Campaign</a>.
* [FIXED] Bug with Push Notification open actions so that the app is actually launched. This defect was introduced when we rolled out the auto-clear feature above. If you are using Artisan Push we recommend that you upgrade to Android 2.1.7 to get this fix.
