---
layout: docs
title: "Android 2.2.6 Release Notes"
author: "Artisan"
category: release-notes
description: "What's new in Artisan's Mobile Experience Management platform."
---
#Android SDK 2.2.6 Release Notes

Released {{ page.date | date: "%B %-d, %Y" }}

* [UPDATE] We have modified our API to provide more information about running Artisan experiments. See <a href="/dev/android/incode-experiments/#advanced">Advanced Experiment Analytics</a> NOTE: The return type of this method has changed, we now return a list of ExperimentDetails objects instead of a Map and we now include **all** experiments and not just in-code experiments.
* [NEW] You can now configure the Artisan Analytics dispatch rate for your app. Read more about it in <a href="/dev/android/advanced/">Advanced Configuration</a>.
