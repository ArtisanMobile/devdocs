---
layout: docs
title: "Android 2.3.0 Release Notes"
author: "Artisan"
category: release-notes
description: "What's new in Artisan's Mobile Experience Management platform."
---
#Android SDK 2.3.0 Release Notes

Released {{ page.date | date: "%B %-d, %Y" }}

For customers using the Javascript SDK it is recommended to use version 1.4 or above of the Javascript SDK from this point on. Version 1.4 of the Artisan Javascript SDK includes support for for categories, sub-categories and sub-sub-categories for custom analytics events and purchase workflow tracking.

* [NEW] Added support for categories, sub-categories and sub-sub-categories for custom analytics events both from the native code and from the Artisan Javascript SDK. For more information see <a href="/dev/android/event-tracking">event tracking</a> and <a href="/dev/js/getting-started-with-hybrid-sdk">Artisan Javascript SDK Reference</a>.
* [UPDATED] Removed the category argument from the **ArtisanPurchaseWorkflowManager.removeItemFromCart(String productIdentifier, Number price, String description, int quantity)** method.
