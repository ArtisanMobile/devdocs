---
layout: docs
title: Android 2.4.1 Release Notes
author: "Artisan"
category: release-notes
description: "What's new in Artisan's Mobile Experience Management platform."
---
# Android 2.4.1 Release Notes

Released {{ page.date | date: "%B %-d, %Y" }}

* [NEW] New support for PII filtering of Artisan analytics. If your application needs to filter PII (personally identifiable information) at the application level to prevent transmission of sensitive information to Artisan, you can set list of regular expressions for data that needs to be redacted with **ArtisanManager.setPIIRegularExpressionStrings**. For more information see <a href="/dev/android/advanced/#pii-filters">Advanced Configuration</a>.
* [NEW] Added support for hybrid apps using <a href="https://crosswalk-project.org/">Crosswalk</> webviews (org.xwalk.core.XWalkView). For more information see <a href="/dev/js/getting-started-with-hybrid-sdk/#android">Getting Started with the Artisan Javascript SDK</a>.
