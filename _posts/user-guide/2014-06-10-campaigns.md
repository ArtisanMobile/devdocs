---
layout: user-guide
title: "Campaigns"
author: "Artisan"
category: user-guide
description: "Creating a campaign in Artisan."
---
# Campaigns
Campaigns allow you to create custom workflows to automate your mobile marketing programs. They let you to send push notifications or in app messages, and combine them with capabilities such as Power Hooks to create truly engaging experiences.

To get started, click the new campaign button on the Campaigns page.

<br />
<img src="/images/campaign-types.png" height="402" width="529" alt="The Artisan Campaign Types." />
<br />

<div id="create-push-campaign"></div>

## Creating a Push Campaign

<div class="note note-hint">
  <p>Before you can create a push campaign you need to make sure that push notifications are configured for you account. Learn how to <a href="/dev/ios/push-notifications">setup push for iOS</a> and <a href="/dev/android/push-notifications">Android</a> in the developer documentation. At a minimum ensure you have support for Android 2.3.3 and build against the latest Android SDK.</p>
</div>

From the New Campaign page, click the create push notification button. Give your campaign a name to help you identify it for later. The campaign name is only seen by you and your users will never see it.

<img src="/images/screens/campaign-overview-700x490.png" height="490" width="700" alt="The Artisan Campaign overview screen." />

### Choosing the Campaign Audience

A campaign can be sent to all of your users or you can send personalized content by delivering your campaign to a segment of your users.

To send your campaign to a segment of your users click the **Choose a List** drop down box and pick your list. You can segment users into new lists in the People area. If you want this campaign to be sent to all of your users select the **Everyone** option in the list.

For some campaigns you may want to ensure that you aren't sending too many messages. You can make sure that users only receive a message once during the course of a campaign by checking **List members should only receive this message once**.

## Composing Your Push Notification

To compose your push notification start typing in the **Message** text area. As you type, your notification message will be displayed in the message preview to the right.

<img src="/images/screens/campaign-compose-message-900x320.png" height="320" width="900" alt="Composing a push notification in Artisan." />

<div id="push-notification-size"></div>

#### Push Notification Size (iOS Only)

Apple's Push Notification Service requires the size of their payload to be under **2048 bytes**. This size requirement is enforced when composing your push notification and can be seen just below the preview area. You can learn more from Apple's documentation <a href="https://developer.apple.com/library/ios/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Chapters/ApplePushService.html#//apple_ref/doc/uid/TP40008194-CH100-SW1" target="_blank">here</a>.

### On Open Behavior

The **On Open Bevahior** dictates what should happen when a user opens the message from lock screen or notification center in iOS or Android. Artisan allows you to choose between **opening the app**, setting a **deep link**, or configuring a **power hook**. By default, we'll simply open the app for your user, but you can choose what you would like to happen. Both deep links and power hooks are configured by your development team.

#### Deep Links

Deep Linking is a method in which app developers create custom URL schemes to allow users to navigate directly to app screens from outside of the app. If your app supports deep linking, you can set the on open behavior of your push notification to take your users to a specific screen in your app. You'll need to check with your development team to ensure that deep linking is supported and which URLs you can use in your campaign.

If you have a deep link URL that you would like to use as your on open behavior, select **Deep Link** from the list and enter your link the space provided.

<img src="/images/screens/campaign-compose-deep-link-530x234.png" height="234" width="530" alt="Configuring the deep link on-open behavior." />

#### Configuring a Power Hook

Using a Power Hook as your on open behavior gives you the ultimate in personalizing a user's experience. Power Hooks can be used to configure a simple value or be used to configure workflow once a user opens your message. For example, your developers could build a power hook that takes your user to their shopping cart and automatically applies a discount when they open your push notification.

<div class="note note-hint">
  <p>Power Hooks must be added to your app before you can configure them in a campaign.
  Power Hooks used for push notifications get sent as part of the push notification payload. That paylod's size must not exceed **2048 bytes** due to <a href='https://developer.apple.com/library/ios/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Chapters/ApplePushService.html#//apple_ref/doc/uid/TP40008194-CH100-SW1'>limits imposed by the Apple Push Notification Service</a>.
  Learn more about creating power hooks for <a href="/dev/ios/power-hooks/">iOS</a> and <a href="/dev/android/power-hooks/">Android</a>.</p>
</div>

To use a power hook as your on open behavior select **Power Hook** from the On Open Behavior list. Once you select **Power Hook** you'll be asked to select which power hook to use.

<img src="/images/screens/campaign-compose-power-hook-530x420.png" height="420" width="530" alt="Configuring the power hook on-open behavior." />

After you select your power hook a list of configurable values will be displayed under the **Personalized Power Hook Values** section. Your power hooks and values are specific to your app, so if you aren't sure what each power hook value does consult your development team.

## Setting the Push Time

Setting the push time simply lets us know what time of the day we should send your notification. Messages are sent in Eastern Time. You can also configure your campaign to send the push notification in the user's local time. For example if you say to send the notification at 1:00 PM, the user will receive the message at 1:00 PM no matter what their time zone.

<img src="/images/screens/campaign-compose-time-530x242.png" height="242" width="530" alt="Setting the push notification time." />

<div id="testing-your-push-campaign"></div>

## Testing Your Campaign

To send yourself a test push notification, click on the **Send Test Message** located under the message preview image. Select the device you would like to send your test to and then click **Send Test Message**. If haven't added any devices, click the **Connect Your Device** button and follow the instructions to enable your device to receive test push notifications.

### I didn't receive my test message.

If you've tried to send yourself a push notification, but didn't actually receive the message your device may not be configured properly.

Here are some common issues when trying to send push notifications:

* **iOS Only** -- Make sure you're using a physical device and not the Xcode simulator. Apple does not allow sending push notifications to simulator devices.
* **iOS Only** -- Your app has been built with the provisioning profile that matches the APN certificate you uploaded when configuring push.
* You have accepted to receive push notifications for this app.
* You have correctly configured push in your app settings and have received a push with those uploaded credentials.
* Your app has a version of Artisan SDK greater than 2.1.4 installed. We added support for push notifications in version 2.1.5.
* Your device is connected to a wireless provider.
* If you've recently deleted and then reinstalled the app on your device you'll need to reconnect your device to Artisan and send the test push again.

## Scheduling Your Campaign

You can set your campaign to run one time, between a start/end date, or run indefinitely.

<img src="/images/screens/campaign-schedule-530x375.png" height="375" width="530" alt="Scheduling the campaign." />

After you've scheduled your campaign you'll get a chance to confirm and edit all of the details. Once you're ready, click **Start Campaign**.

<div id="create-in-app-campaign"></div>

## Creating an In App Campaign

<div class="note note-hint">
  <p>In app campaigns are currently supported in iOS only and require SDKs of 2.2.3 or greater.</p>
</div>

From the New Campaign page, click the create in app message button. Give your campaign a name to help you identify it for later. The campaign name is only seen by you and your users will never see it.

<img src="/images/screens/campaign-overview-700x490.png" height="490" width="700" alt="The Artisan Campaign overview screen." />

### Choosing the Campaign Audience

A campaign can be sent to all of your users or you can send personalized content by delivering your campaign to a segment of your users.

To send your campaign to a segment of your users click the **Choose a List** drop down box and pick your list. You can segment users into new lists in the People area. If you want this campaign to be sent to all of your users select the **Everyone** option in the list.

For some campaigns you may want to ensure that you aren't sending too many messages. You can make sure that users only receive a message once during the course of a campaign by checking **List members should only receive this message once**.

## Composing Your In App Message

### Select A Layout

To compose your in app message, start by selecting a layout: two button (a call to action and cancel), one button (a call to action), and no buttons (an actionable content area).

<img src="/images/screens/campaign-in-app-layouts-390x200.png" height="200" width="390" alt="The Artisan Campaign In App Compose Screen - Layouts." />

### Customize Your Message

Once a desired layout has been selected, start typing in the **Title** and **Body** text areas. As you type, your in app message will be displayed in the message preview to the right. You can further customize your content's color.

<img src="/images/screens/campaign-in-app-message-700x344.png" height="344" width="700" alt="The Artisan Campaign In App Compose Screen - Message." />

The **background** of your content area is customizable, as are buttons if the layout selected has them. Color, overlay, and image (standard and retina) are all configurable.

<img src="/images/screens/campaign-in-app-background-700x339.png" height="339" width="700" alt="The Artisan Campaign In App Compose Screen - Background." />

### Customize Behaviors

**Behaviors** dictate what should happen when a user interacts with your message. Interacting can be clicking on the call to action button, cancel button, or content area, depending on the layout chosen. Artisan allows you to choose between **opening the app**, setting a **deep link**, or configuring a **power hook**. Deep links and power hooks are configured by your development team.

<img src="/images/screens/campaign-in-app-button-470x560.png" height="339" width="700" alt="The Artisan Campaign In App Compose Screen - Button." />

#### Deep Links

Deep Linking is a method in which app developers create custom URL schemes to allow users to navigate directly to app screens. If your app supports deep linking, you can set the on open behavior of your in app message to take your users to a specific screen in your app. You'll need to check with your development team to ensure that deep linking is supported and which URLs you can use in your campaign.

If you have a deep link URL that you would like to use as your on open behavior, select **Deep Link** from the list and enter your link the space provided.

<img src="/images/screens/campaign-compose-in-app-deep-link-480x217.png" height="234" width="530" alt="Configuring the deep link on-open behavior." />

#### Configuring a Power Hook

Using a Power Hook as your on open behavior gives you the ultimate in personalizing a user's experience. Power Hooks can be used to configure a simple value or be used to configure workflow once a user interacts with your message. For example, your developers could build a power hook that takes your user to their shopping cart and automatically applies a discount when they open your in app message.

<div class="note note-hint">
  <p>Power Hooks must be added to your app before you can configure them in a campaign. Learn more about creating power hooks for <a href="/dev/ios/power-hooks/">iOS</a> and <a href="/dev/android/power-hooks/">Android</a>.</p>
</div>

To use a power hook as your on open behavior select **Power Hook** from the On Open Behavior list. Once you select **Power Hook** you'll be asked to select which power hook to use.

<img src="/images/screens/campaign-compose-in-app-power-hook-478x419.png" height="420" width="530" alt="Configuring the power hook on-open behavior." />

After you select your power hook a list of configurable values will be displayed under the **Personalized Power Hook Values** section. Your power hooks and values are specific to your app, so if you aren't sure what each power hook value does consult your development team.

#### Configuring Triggers

Configuring when an in app message is triggered is critical and plays a significant role in a user's experience. **Triggers** are the application events Artisan collects: when screens are viewed, when elements such as buttons or table cell views are tapped or selected, etc. In addition to the trigger, the **frequency** for the in app message is selected. Does the message happen once, every time, X times per session, once every X days, or X number of times an event occurs.

<img src="/images/screens/campaign-compose-trigger-475x300.png" height="300" width="475" alt="The Artisan Campaign In App Compose Screen - Triggers." />

<div class="note note-hint">
  <p><strong>NOTE:</strong> For In-App message triggers, the <strong>Starts App</strong> event actually corresponds to the first time the Artisan playlist is downloaded after the user starts the app. That way you can be sure the latest In-App messages are present when the first one is triggered.</p>
</div>

## Testing Your Campaign

To send yourself a test in app message, click on the **Preview On Device** located under the message preview image. You must connect your device.

## Scheduling Your Campaign

You can set your campaign to run one time, between a start/end date, or run indefinitely.

<img src="/images/screens/campaign-schedule-530x375.png" height="375" width="530" alt="Scheduling the campaign." />

After you've scheduled your campaign you'll get a chance to confirm and edit all of the details. Once you're ready, click **Start Campaign**.

Next Up: <a href="/user-guide/campaigns/campaign-summary">Viewing your campaign results</a>.