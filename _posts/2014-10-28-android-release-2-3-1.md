---
layout: docs
title: "Android 2.3.1 Release Notes"
author: "Artisan"
category: release-notes
description: "What's new in Artisan's Mobile Experience Management platform."
---
#Android SDK 2.3.1 Release Notes

Released {{ page.date | date: "%B %-d, %Y" }}

This is a very important release for the Artisan Android SDK for two reasons. First, we were able to remove the requirement to have the GET_TASKS permission, which we know is something that shoppers in the Play store are never eager to give out. Second, we found and fixed a critical issue that was causing a crash having to do with our Artisan Playlist download timer. The crash was caused by multiple threads canceling and scheduling the same timer object.

For both of these reasons we hope that you will upgrade to Artisan SDK 2.3.1 as soon as possible.

* [UPDATED] We no longer require the GET_TASKS permission. After upgrading to Artisan 2.3.1 you may remove this permission from your AndroidManifest.xml if your app and other dependencies do not depend on it.
* [UPDATED] Under the hood we are using a new library for http uploads. If you are using artisan_library.jar this will not affect you, but if you are using the unbundled version of the Artisan SDK jar, you should check the artisan/Support folder in your Artisan SDK download to get the new dependency.
* [FIX BUG] We fixed a critical bug that was causing crashes having to do with the Artisan playlist download timer being started and stopped from multiple threads.
