---
layout: docs
title: "Android 2.2.2 Release Notes"
author: "Artisan"
category: release-notes
description: "What's new in Artisan's Mobile Experience Management platform."
---
#Android SDK 2.2.2 Release Notes

Released {{ page.date | date: "%B %-d, %Y" }}

With this release we now support the Recency and Frequency reports for your Android apps.

<img src="/images/recency_frequency_tabs_for_android.png" width="700" height="480" alt="New frequency and recency reports for Android apps. You can find these new reports under Analyze in Artisan Tools once you upgrade to Android 2.2.2" />

Once you upgrade if you connect your device to Artisan you should see the new reports in your app's Analytics on Artisan Tools.

<div class="note note-hint">
  <p>NOTE: Only your app users who have upgraded to the version of your app that has Artisan v2.2.2 will be sending analytics to populate these reports, so you may see a difference in the session totals for these reports versus your other session reports until most of your users have upgraded to the latest version of your app.</p>
</div>

* [NEW] Artisan Android SDK now supports the Recency and Frequency reports.
* [UPDATED] the Artisan Android installer will now explicitly ask whether you want to use Artisan Push before adding the additional permissions and configuration for push to your AndroidManifest.xml.
