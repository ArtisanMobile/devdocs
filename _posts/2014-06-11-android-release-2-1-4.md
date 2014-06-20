---
layout: docs
title: "Android 2.1.4 Release Notes"
author: "Artisan"
category: release-notes
description: "What's new in Artisan's Mobile Experience Management platform."
---
#2.1.4 Release Notes

Released {{ page.date | date: "%B %-d, %Y" }}

Updates to Push Notifications capability.

* [UPDATED] Added support for 'sticky' flag for new push notifications.
* [UPDATED] Added forced push token invalidation for when users delete and reinstall the same app.
* [UPDATED] Added ouptut of push token to console for development debugging.
* [FIXED] Resolved how push notification Power Block parameters were interpreted to ensure the values included with the push are used.