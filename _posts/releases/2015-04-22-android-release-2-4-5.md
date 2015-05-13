---
layout: docs
title: Android 2.4.5 Release Notes
author: "Artisan"
category: release-notes
description: "What's new in Artisan's Mobile Experience Management platform."
---
# Android 2.4.5 Release Notes

Released April 22, 2015

* [FIXED] Fixed a bug with the <a href="/dev/android/user-profiles/">Artisan User Profile</a> variable registration. In previous versions of the SDK if you set a default value when you registered a variable in your Application class registerUserProfileVariables method, that default value would replace any other value that got set on every startup of the Artisan Service. If you were previously registering with a default value we strongly recommend that you upgrade to this version of the SDK and make sure that the correct values get set for your users to update their profiles.
