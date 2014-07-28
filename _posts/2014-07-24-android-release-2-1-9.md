---
layout: docs
title: "Android 2.1.9 Release Notes"
author: "Artisan"
category: release-notes
description: "What's new in Artisan's Mobile Experience Management platform."
---
#Android SDK 2.1.9 Release Notes

Released {{ page.date | date: "%B %-d, %Y" }}

* [NEW] Added optional flags to the API so that you can disable the artisan gesture in production and prevent the Artisan Gesture overlay from being added to your Activities. For non-production builds there is also a new disableGestureAndLoginOnForeground method that is an alternative for connecting to Artisan without the gesture. See <a href="/dev/android/advanced/">Advanced Configuration</a> for more details.
