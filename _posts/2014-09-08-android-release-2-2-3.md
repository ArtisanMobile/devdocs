---
layout: docs
title: "Android 2.2.3 Release Notes"
author: "Artisan"
category: release-notes
description: "What's new in Artisan's Mobile Experience Management platform."
---
#Android SDK 2.2.3 Release Notes

Released {{ page.date | date: "%B %-d, %Y" }}

This release includes some useful additions to our API for Android, including a way to explicitly clear variable values (equivalent to setting the values to null), and methods to get all of the in-code experiments for your app and for getting all of the Artisan variation ids for your currently running experiments.

* [NEW API] You can now explicitly clear Artisan User Profile Variables with a call to ArtisanProfileManager.clearVariableValue(VARIABLE_NAME)
* [NEW API] New API call to get information about all currently running In-code experiments including the current variation, default variation and whether the experiment is running. See ArtisanExperimentManager.getCurrentExperimentDetails()
* [NEW API] New API call to get variation ids for all of the currently running experiments. This variation ids are Strings and they uniquely identify a variation for an experiment. This method returns variation ids for all Artisan experiments, not just In-code experiments. See ArtisanExperimentManager.getCurrentVariationIds()
* [NEW API] Added new methods to the ArtisanProfileManager for more extensive and structured user profiles. See [User Profile API Reference](/dev/android/user-profiles/) for more details.
* [UPDATE] We have deprecated ArtisanProfileManager.setPushEnabled(pushEnabled) in favor of ArtisanProfileManager.setOptedOutOfPush(optedOutOfPush). Note: the values of these are inverted, so use care when converting your API calls over. Both methods will now be respected for the time being when calculating whether the device should be eligible to participate in Artisan Push campaign if you are using Artisan Push. ArtisanProfileManager.setPushEnabled(pushEnabled) will be removed in a future release of Artisan.
