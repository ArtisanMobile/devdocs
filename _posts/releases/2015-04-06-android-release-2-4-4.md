---
layout: docs
title: Android 2.4.4 Release Notes
author: "Artisan"
category: release-notes
description: "What's new in Artisan's Mobile Experience Management platform."
---
# Android 2.4.4 Release Notes

Released April 6, 2015

With this release we have taken a big step to alleviate the impact that the Artisan SDK has on your app's method count (65k dex limit). We have reduced the SDK's method count by about 50%.

* [UPDATED] We have replaced our Jackson dependency with gson, resulting in a ~50% cut in the method count for the final SDK. The total method count for artisan_library.jar is ~3,700.
* [UPDATED] The Artisan Power Hook API has been updated to prevent registering power hook blocks with null values in the default data.
