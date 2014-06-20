---
layout: docs
title: "Android 2.1.6 Release Notes"
author: "Artisan"
category: release-notes
description: "What's new in Artisan's Mobile Experience Management platform."
---
#2.1.6 Release Notes

Released {{ page.date }}

Added automatic view-detection support for fragments.  Small fixes and whitelisting updates.

* [NEW] Added ArtisanFragmentActivity interface to automatically track Fragment Views.
* [UPDATED] Added device name to set of information passed over when connecting an app to artisantools.com (to use for device whitelisting purposes)
* [UPDATED] Logging tweaks.
* [FIXED] Update to ensure all active variations for a given user are coming through their 'Backgrounded' analytics messages. 