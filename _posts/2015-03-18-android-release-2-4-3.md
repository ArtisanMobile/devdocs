---
layout: docs
title: Android 2.4.3 Release Notes
author: "Artisan"
category: release-notes
description: "What's new in Artisan's Mobile Experience Management platform."
---
# Android 2.4.3 Release Notes

Released {{ page.date | date: "%B %-d, %Y" }}

* [NEW] New API for specifying Artisan Push Notification settings like the icon and color. For more information see <a href="/dev/android/push-notifications/#customizing-notifications">Customizing Artisan Push Notifications</a>.
* [NEW] New API for accessing details about currently running Artisan Power Hook Experiments. For more information see <a href="/dev/android/power-hooks/#experiment-details">Power Hook Experiment Details</a>.
* [DEPRECATED] With the new API for Artisan Push Notification Settings we have deprecated the **ArtisanManager.setPushSenderId(String pushSenderId)** method in favor of using <a href="/dev/android/push-notifications/#artisan-version">ArtisanPushNotificationSettings</a> objects. The **setPushSenderId** method will be removed in a future version of the Artisan SDK.
