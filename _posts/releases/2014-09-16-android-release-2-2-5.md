---
layout: docs
title: "Android 2.2.5 Release Notes"
author: "Artisan"
category: release-notes
description: "What's new in Artisan's Mobile Experience Management platform."
---
#Android SDK 2.2.5 Release Notes

Released {{ page.date | date: "%B %-d, %Y" }}

* [FIXED] Artisan Push Messages were replacing each other rather than remaining in the notification center. They will now stay until explicitly cleared, even if new Artisan Pushes are received.
* [FIXED] Improved the Installation script to work with gradle projects. If you place the artisan folder in your app folder, next to your build.gradle file you can take advantage of the install script to update your manifest, add an application class if needed, and copy the Artisan jar and resources to your project. NOTE: If you don't already have your libs directory included in your gradle dependencies you will have to update that manually.
