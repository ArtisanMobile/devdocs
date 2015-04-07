---
layout: user-guide
title: "Campaigns"
author: "Artisan"
category: user-guide/campaigns
description: "Creating a campaign in Artisan."
---
# Campaigns

## Creating an In-App Campaign

<div class="note note-hint">
  <p>In app campaigns are currently supported in iOS only and require SDKs of 2.2.3 or greater.</p>
</div>

From the 'Campaign' area, click the 'New Campaign' button.  Then click 'Create In-App Message'.  This will bring up the different options of In-App message that Artisan supports:

<img src="/images/screens/campaign-compose-in-app-options-818x378.png" height="323" width="700" alt="ARtisan in-app campaign types." />

Artisan currently supports the following in-app message types:

* **Pop Up**
    Pop Up Notifications appear as a dialog box in the middle of the user's screen and contain a header, body text, and up to two action buttons.

* **Slide In**
    Slide In Notifications are narrow notifications that slide in from the edge of the screen with some notification text, and can trigger an action if tapped.

* **Take Over**
    Take Over messages are full-screen images that cover the entirety of the user's screen, and can trigger an action if tapped.

Click the desired message type to create a draft campaign of that message.

<img src="/images/screens/campaign-push-settings-1051x1195.png" height="796" width="700" alt="The Artisan Campaign overview screen." />

### Configuring Your Campaign Settings

#### Selecting Your Campaign Audience

A campaign can be sent to either all of your users or to a specific targeted segment.

To send your campaign to a segment of your users, click the **Choose a List** drop down box and pick your list. You can segment users into new lists via the [Artisan People]({% post_url user-guide/2014-06-11-people %}) area. If you want this campaign to be sent to all of your users select the **Everyone** option in the list.

#### Choosing a Conversion Goal

You can configure an Artisan Campaign to have a specific conversion goal.  This is an event or metric that reflects a successful 'conversion' of users who have received this in-app notification, which can be either:

* The user triggers a specific action in your app after receiving the in-app notificaiton.
* The user spends a certain length of time in your app after receiving the in-app notification.

For the former, you can select any event that has been collected by Artisan.  See [Managing Events]({% post_url user-guide/2013-10-24-managing-events %}/#event-library) for more information.

For whatever goal you choose, Artisan will track how your in-app camapign is performing in real-time, both in terms of what percentage of users hit the notificaiton's call-to-action button and what percentage ultimately trigger your conversion goal.

#### Choosing a Start and End Date

You can configure your Artisan Campaign to start immediately and run indefinitely, or to begin and end at a specific date and time.  The campaign will start transmitting at the specified time, and will continue to send notifications to users (per the settings of the campaign) until the end time is reached.

## Composing Your In App Message

### Select A Layout

To compose your in-app message, start by selecting a layout.  Layout options depend on the type of message being composed.  For Pop Up messages, you can select between: two buttons (a call to action and cancel), one button (a call to action), and no buttons (an actionable content area).

<img src="/images/screens/campaign-in-app-layouts-390x200.png" height="200" width="390" alt="The Artisan Campaign In App Compose Screen - Layouts." />

For Slide In messages, you can choose the side of the screen the slide in will appear from, as well as how long the message will remain on screen.

For Take Over messages, you can choose way in which the message transitions onto the screen, along with the background overlay.

### Customize The Content

Once a desired layout has been selected, start typing in the text areas. As you type, your in-app message will be displayed in the message preview.

<img src="/images/screens/campaign-in-app-message-700x344.png" height="344" width="700" alt="The Artisan Campaign In App Compose Screen - Message." />

You can also further customize your content's color and background image.

<img src="/images/screens/campaign-in-app-background-700x339.png" height="339" width="700" alt="The Artisan Campaign In App Compose Screen - Background." />

### Customize Behaviors

**Behaviors** dictate what should happen when a user interacts with your message. Interacting can be clicking on the call to action button, cancel button, or content area, depending on the layout chosen. Artisan allows you to choose between **opening the app**, setting a **deep link**, or configuring a **power hook**. Deep links and power hooks are configured by your development team.

<img src="/images/screens/campaign-in-app-button-470x560.png" height="339" width="700" alt="The Artisan Campaign In App Compose Screen - Button." />

#### Deep Links

Deep Linking is a method in which app developers create custom URL schemes to allow users to navigate directly to app screens. If your app supports deep linking, you can set the on open behavior of your in-app message to take your users to a specific screen in your app. You'll need to check with your development team to ensure that deep linking is supported and which URLs you can use in your campaign.

If you have a deep link URL that you would like to use as your on open behavior, select **Deep Link** from the list and enter your link the space provided.

<img src="/images/screens/campaign-compose-in-app-deep-link-480x217.png" height="234" width="530" alt="Configuring the deep link on-open behavior." />

#### Configuring a Power Hook

Using a Power Hook as your on open behavior gives you the ultimate in personalizing a user's experience. Power Hooks can be used to configure a simple value or be used to configure workflow once a user interacts with your message. For example, your developers could build a power hook that takes your user to their shopping cart and automatically applies a discount when they open your in-app message.

<div class="note note-hint">
  <p>Power Hooks must be added to your app before you can configure them in a campaign. Learn more about creating power hooks for <a href="/dev/ios/power-hooks/">iOS</a> and <a href="/dev/android/power-hooks/">Android</a>.</p>
</div>

To use a power hook as your on open behavior select **Power Hook** from the On Open Behavior list. Once you select **Power Hook** you'll be asked to select which power hook to use.

<img src="/images/screens/campaign-compose-in-app-power-hook-478x419.png" height="420" width="530" alt="Configuring the power hook on-open behavior." />

After you select your power hook a list of configurable values will be displayed under the **Personalized Power Hook Values** section. Your power hooks and values are specific to your app, so if you aren't sure what each power hook value does consult your development team.

#### Configuring Triggers

The **trigger** is the event that -- when performed by the user -- will prompt your in-app message to appear.  The trigger can be any event that Artisan collects: when screens are viewed, when elements such as buttons or table cell views are tapped or selected, etc.  See [Managing Events]({% post_url user-guide/2013-10-24-managing-events %}/#event-library) for more information.

The **frequency** for the in-app message defines how frequently this notification should appear when the user trips the trigger action. Valid options include:

* Just the first time the trigger action happens for this user.
* Every time the trigger event is tripped.
* A maximum of X number of times per session (when the trigger event is tripped)
* Once every X days (when the trigger event is tripped)
* Every X number of times the trigger event is tripped.

<img src="/images/screens/campaign-compose-trigger-475x300.png" height="300" width="475" alt="The Artisan Campaign In App Compose Screen - Triggers." />

<div class="note note-hint">
  <p><strong>NOTE:</strong> For In-App message triggers, the <strong>Starts App</strong> event actually corresponds to the first time the Artisan playlist is downloaded after the user starts the app. That way you can be sure the latest In-App messages are present when the first one is triggered.</p>
</div>

## Publishing Your Campaign

To publish your campaign, click 'Continue' from the Compose screen.  Here, you can validate all of your settings, send yourself a test notification, and confirm that your campaign is ready to broadcast.

### Sending a Test Message

To send yourself a test notification, click on the **Send Test Message** located under the message preview image. Follow the prompt to connect your device or simulator to Artisan, and once connected, you should receive the message.

### Starting Your Campaign

If all of your settings are correct and your test message is received successfully, hit 'Start Campaign' to publish your campaign draft.  If you do not wish to start your campaign just yet, you can leave this screen and come back to your campaign draft at any time.

## Editing a Push Campaign

You can edit any active campaign or campaign draft at any time.  Options include:

* Cloning existing campaigns or drafts.
* Stopping running campaigns.
* Editing the text, schedule, and content of active campaigns.
* Deleting completed campaigns or campaign drafts.

To access these editing options, navigate to the 'Campaigns' area in Artisan and click the Campaign you wish to edit.
