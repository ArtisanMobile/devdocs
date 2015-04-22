---
layout: user-guide
title: "Campaigns"
author: "Artisan"
category: user-guide/campaigns
description: "Creating a campaign in Artisan."
---
# Campaigns

## Creating a Push Campaign

<div class="note note-hint">
  <p>Before you can create a push campaign, you'll need ensure sure that push notifications are configured for you account. Learn how to set up push for <a href="/dev/ios/push-notifications">iOS</a> and <a href="/dev/android/push-notifications">Android</a> in the developer documentation.</p>
</div>

From the 'Campaign' area, click the 'New Campaign' button.  Then click 'Create Push Notification'. This will create a draft for your new push campaign and bring you to the Campaign Settings screen.

<img src="/images/screens/campaign-push-settings-1051x1195.png" height="796" width="700" class="border-full" alt="The Artisan Campaign overview screen." />

### Configuring Your Campaign Settings

#### Selecting Your Campaign Audience

A campaign can be sent to either all of your users or to a specific targeted segment.

To send your campaign to a segment of your users, click the **Choose a List** drop down box and pick your list. You can segment users into new lists via the [Artisan People]({% post_url user-guide/2014-06-11-people %}) area. If you want this campaign to be sent to all of your users select the **Everyone** option in the list.

For some campaigns, you may want to ensure that you aren't sending too many messages. You can make sure that users only receive a message once during the course of a campaign by checking **List members should only receive this message once**.

#### Choosing a Conversion Goal

You can configure an Artisan Campaign to have a specific conversion goal.  This is an event or metric that reflects a successful 'conversion' of users who have received this push notification, which can be either:

* The user triggers a specific action in your app after opening the push notificaiton.
* The user spends a certain length of time in your app after opening the push notification.

For the former, you can select any event that has been collected by Artisan.  See [Managing Events]({% post_url user-guide/2013-10-24-managing-events %}/#event-library) for more information.

For whatever goal you choose, Artisan will track how your push camapign is performing in real-time, both in terms of what percentage of users open the push notification and what percentage ultimately trigger your conversion goal.  Artisan considers a push to have 'converted' if the conversion event is triggered within the next seven days after the push is initially received.

#### Choosing a Start and End Date

You can configure your Artisan Campaign to start immediately and run indefinitely, or to begin and end at a specific date and time.  The campaign will start transmitting at the specified time, and will continue to send push notifications to users (per the settings of the campaign) until the end time is reached.

## Composing Your Push Notification

To compose your push notification, click 'Continue' from the Campaign Details screen and start typing in the **Message** text area. As you type, your notification message will be displayed in the message preview adjacent to the text area.

<img src="/images/screens/campaign-compose-message-900x320.png" height="320" width="900" class="border-full" alt="Composing a push notification in Artisan." />

If you wish to compose multiple variations of this push campaign as part of an A/B test, see [A/B Testing Campaigns]({% post_url user-guide/2014-06-10-campaign-ab-testing %}).

<div id="push-notification-size"></div>

### Push Notification Size (iOS Only)

Apple's Push Notification Service requires the size of their payload to be under **2048 bytes**. This size requirement is enforced when composing your push notification and can be seen just below the preview area. You can learn more from Apple's documentation <a href="https://developer.apple.com/library/ios/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Chapters/ApplePushService.html#//apple_ref/doc/uid/TP40008194-CH100-SW1" target="_blank">here</a>.

### On Open Behavior

The **On Open Bevahior** dictates what should happen when a user opens the message from lock screen or notification center in iOS or Android. Artisan allows you to choose between **opening the app**, setting a **deep link**, or configuring a **power hook**. By default, we'll simply open the app for your user, but you can choose what you would like to happen. Both deep links and power hooks are configured by your development team.

### Deep Links (iOS Only)

Deep Linking is a method in which app developers create custom URL schemes to allow users to navigate directly to app screens from outside of the app. If your app supports deep linking, you can set the on open behavior of your push notification to take your users to a specific screen in your app. You'll need to check with your development team to ensure that deep linking is supported and which URLs you can use in your campaign.

If you have a deep link URL that you would like to use as your on open behavior, select **Deep Link** from the list and enter your link the space provided.

<img src="/images/screens/campaign-compose-deep-link-530x234.png" height="234" width="530" class="border-full" alt="Configuring the deep link on-open behavior." />

<div id="power-hook"></div>

### Configuring a Power Hook

Using a Power Hook as your on open behavior gives you the ultimate in personalizing a user's experience. Power Hooks can be used to configure a simple value or be used to configure workflow once a user opens your message. For example, your developers could build a power hook that takes your user to their shopping cart and automatically applies a discount when they open your push notification.

<div class="note note-hint">
  <p>Power Hooks must be added to your app before you can configure them in a campaign.
  Power Hooks used for push notifications get sent as part of the push notification payload. That paylod's size must not exceed **2048 bytes** due to <a href='https://developer.apple.com/library/ios/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Chapters/ApplePushService.html#//apple_ref/doc/uid/TP40008194-CH100-SW1'>limits imposed by the Apple Push Notification Service</a>.
  Learn more about creating power hooks for <a href="/dev/ios/power-hooks/">iOS</a> and <a href="/dev/android/power-hooks/">Android</a>.</p>
</div>

To use a power hook as your on open behavior select **Power Hook** from the On Open Behavior list. Once you select **Power Hook** you'll be asked to select which power hook to use.

<img src="/images/screens/campaign-compose-power-hook-530x420.png" height="420" width="530" class="border-full" alt="Configuring the power hook on-open behavior." />

After you select your power hook a list of configurable values will be displayed under the **Personalized Power Hook Values** section. Your power hooks and values are specific to your app, so if you aren't sure what each power hook value does consult your development team.

### Setting the Push Time

Setting the push time indicates what time of the day your notification should be sent. Messages are sent according to the time you specify, according to the timezone you specified for your campaign. You can also configure your campaign to send the push notification in the user's local time. For example, if you say to send the notification at 1:00 PM local time, users on Eastern Standard Time will receive the push at 1:00 PM their time, and then an hour later, users on Central Standard Time will receive the push at 1:00 PM their time.

<img src="/images/screens/campaign-compose-time-474x289.png" height="289" width="474" class="border-full" alt="Setting the push notification time." />

<div id="testing-your-push-campaign"></div>

## Publishing Your Campaign

To publish your campaign, click 'Continue' from the Compose screen.  Here, you can validate all of your settings, send yourself a test notification, and confirm that your push campaign is ready to broadcast.

### Sending a Test Message

To send yourself a test push notification, click on the **Send Test Message** located under the message preview image. Select the device you would like to send your test to and then click **Send Test Message**. If haven't added any devices, click the **Connect Your Device** button and follow the instructions to enable your device to receive test push notifications.

If you've tried to send yourself a push notification, but didn't actually receive the message your device may not be configured properly.

Here are some common issues when trying to send push notifications:

* **iOS Only** -- You are using the Xcode simulator instead of a physical device. Apple does not allow sending push notifications to simulators.
* **iOS Only** -- Your app has been not been built with the provisioning profile that matches the APN certificate you uploaded when configuring push notifications.
* You have not accepted to receive push notifications for this app.
* You have not configured push in your app settings and have not received a push with those uploaded credentials.
* Your device is not connected to the network.

<div class="note note-hint">
  <p>If you've recently deleted and then reinstalled the app on your device you'll need to reconnect your device to Artisan and send the test push again.</p>
</div>

### Starting Your Campaign

If all of your settings are correct and your test message is received successfully, hit 'Start Campaign' to publish your campaign draft.  The campaign will begin when it reaches the start time you specified.  If you do not wish to publish your campaign just yet, you can leave this screen and come back to your campaign draft at any time.

## Editing a Push Campaign

You can edit any active campaign or campaign draft at any time.  Options include:

* Cloning existing campaigns or drafts.
* Stopping running campaigns.
* Editing the text, schedule, and content of active campaigns.
* Deleting completed campaigns or campaign drafts.

To access these editing options, navigate to the 'Campaigns' area in Artisan and click the Campaign you wish to edit.