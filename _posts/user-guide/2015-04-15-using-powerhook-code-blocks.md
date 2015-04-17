---
layout: user-guide
title: "Campaign Summary"
author: "Artisan"
category: user-guide/powerhooks
description: "Using Power Hooks Code Blocks in Artisan."
---
# Power Hooks

## Using Power Hook Code Blocks

Power Hook Code Blocks are special actions coded into your app that can be used to trigger custom actions and events for your push notications and in-app messages.  Some examples of uses for Power Hook Code Blocks include:

* Showing a specific ad unit or special offer.
* Automatically navigating the user to a shopping cart while offering a discount code.
* Adding a favorited item to a customer's account.
* Triggering a support email when a user encounters an error message.
* Navigating the user to a special offers area within the app,

Power Hook Code Blocks can be integrated into your app via the instructions in the [iOS]({% post_url ios/2014-05-09-power-hooks %}/#code-blocks) and [Android]({% post_url android/2014-05-08-power-hooks %}/#code-blocks) Developer Guides.

Once added, you can use Power Hook Code Blocks in a number of different ways.

### Controlling Power Hook Blocks via the Power Hook Control Panel

By default, when called, Power Hook blocks will execute according to the parameters passed via the Control Panel.  For example, if I have a Power Hook block that automatically navigates the user to their shopping cart and takes a discount code to display as a parameter, that discount code will be whatever is set in the Power Hook Control Panel.

<img src="/images/screens/powerhooks-block-1400x445.png" height="223" width="700" alt="The Artisan Campaign In App Compose Screen - Triggers." />

You can therefore change, A/B test, and personalize the value of this code the same way as a normal Power Hook.  Update the value in the 'Draft Value' column, hit the 'Preview' option to connect your device, navigate to the part of your app that executes the Power Block, and watch it spring into action with the new values in place.

### Using Power Hook Blocks as Campaign Actions

You can make a Power Hook Block be the action that's triggered when a user opens an Artisan push notification, or clicks the Call-To-Action button on an In-App Notification.  While building the campaign, specifiy if you want to use a Power Hook Block as your notification's aciton, and specify the parameter values you want the action to use.  This block will automatically be triggered (with the correct parameters) when the user interacts with the notification.

See [Creating A Push Campaign]({% post_url user-guide/2014-06-10-campaign-create-in-app %}/#power-hook) and [Creating an In-App Campaign]({% post_url user-guide/2014-06-10-campaign-create-push %}/#power-hook) for more information.

