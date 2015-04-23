---
layout: user-guide
title: "Campaign Summary"
author: "Artisan"
category: user-guide/powerhooks
description: "Installing and Registering New Power Hooks in Artisan."
---
# Power Hooks

## Installation

Power Hooks are declared and installed directly in the code of your app.  The following guides are available for getting Power Hooks installed into both iOS and Android apps:

* [iOS Power Hook Developer Guide]({% post_url ios/2014-05-09-power-hooks %})
* [Android Power Hook Developer Guide]({% post_url android/2014-05-08-power-hooks %})

You can also reference declared Power Hooks within the HTML5 content of your native app:

* [JS Power Hook Developer Reference]({% post_url js/2014-07-18-hybrid-sdk-reference-guide %}/#powerhookapi)

## Initial Registration

Once your Power Hooks have been successfully integrated into your application code, those Power Hooks can be registered with artisantools.com so you can control them remotely via the Aritsan Power Hooks Control Panel.  Registration requires having an instance of the app (with Power Hook code) available, either running on a device or in a local simulator.

To register and synchronize your Power Hooks, observe the following steps:

<img src="/images/screens/powerhooks-register-hooks-1343x826.gif" height="430" width="700" class="border-full" alt="Initial synchronizaton of Power Hooks." />

* Log into artisatnools.com.
* Navigate to the Aritsan Power Hooks area via the top navigation bar.
* Click 'Sync Power Hooks'
* Follow the instructions to connect your device to Artisan Tools.

All of the Power Hooks declared in the app should be registered automatically.  These Power Hooks should appear immediately in the Control Panel, with default values that match what was configured in code.

## Synchronizing Power Hooks

In instances where additional Power Hooks have been added to your app or existing Power Hooks have been removed from your app, the Synchronize feature is available to keep the Artisan Power Hook Control Panel up to date.  

To synchronize the Power Hooks in your app, navigate to the 'Power Hooks' area in Artisan and click 'Sync Power Hooks'.  You will be asked to connect your device to Artisan.  Once you connect your app, all new Power Hooks (and Code Blocks) will be added to the Control Panel.  

#### Removed Power Hooks

Any removed Power Hooks will be moved to the 'Inactive' tab of the Control Panel upon synchronization.  The values for these Power Hooks will still be transmitted to your apps.  These values are preserved to support older versions of your app that may still be using the now-deleted Power Hooks, and you will still be able to change these values as you need to modify these older versions.

