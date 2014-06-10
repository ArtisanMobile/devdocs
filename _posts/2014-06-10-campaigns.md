---
layout: user-guide
title: "Campaigns"
author: "Artisan"
category: user-guide
description: "Creating a campaign in Artisan."
---
# Campaigns
Campaigns allow you to create custom workflows to automate your mobile marketing programs.

Messaging campaigns let you to send Push Messages and combine them with Power Hooks to create truly engaging experiences.

<div class="note note-hint">
  <p>Before you can create a push campaign you need to make sure that push notifications are configured for you account. Learn how to setup push for iOS and Android in the developer documentation.</p>
</div>

<div id="create-push-campaign"></div>

## Creating a Push Campaign

To get started, click the new campaign button on the Campaigns page. Give your campaign a name to help you identify it for later. The campaign name is only seen by you and your users will never see it.

<img src="/images/screens/campaign-overview-700x490.png" height="490" width="700" alt="The Artisan Campaign overview screen." />

### Choosing the Campaign Audience

A campaign can be sent to all of your users or you can send personalized content by delivering your campaign to a segment of your users.

To send your campaign to a segment of your users click the **Choose a List** drop down box and pick your list. You can segment users into new lists in the People area. If you want this campaign to be sent to all of your users select the **Everyone** option in the list.

For some campaigns you may want to ensure that you aren't sending too many messages. You can make sure that users only receive a message once during the course of a campaign by checking **List members should only receive this message once**.

## Composing Your Push Notification

To compose your push notification start typing in the **Message** text area. As you type, your notification message will be displayed in the message preview to the right.

<img src="/images/screens/campaign-compose-message-900x320.png" height="320" width="900" alt="Composing a push notification in Artisan." />

### On Open Behavior

The **On Open Bevahior** dictates what should happen when a user opens the message from lock screen or notification center in iOS or Android. Artisan allows you to choose between **opening the app**, setting a **deep link**, or configuring a **power hook**. By default, we'll simply open the app for your user, but you can choose what you would like to happen. Both deep links and power hooks are configured by your development team.

#### Deep Links

<img src="/images/screens/campaign-compose-deep-link-530x234.png" height="234" width="530" alt="Configuring the deep link on-open behavior." />

#### Configuring a Power Hook

<img src="/images/screens/campaign-compose-power-hook-530x420.png" height="420" width="530" alt="Configuring the power hook on-open behavior." />

## Setting the Push Time

Setting the push time simply lets us know what time of the day we should send your notification. Messages are sent in Eastern Time. You can also configure your campaign to send the push notification in the user's local time. For example if you say to send the notification at 1:00 PM, the user will receive the message at 1:00 PM no matter what their time zone.

<img src="/images/screens/campaign-compose-time-530x242.png" height="242" width="530" alt="Setting the push notification time." />

## Scheduling Your Campaign

You can set your campaign to run one time, between a start/end date, or run indefinitely.

<img src="/images/screens/campaign-schedule-530x375.png" height="375" width="530" alt="Scheduling the campaign." />

After you've scheduled your campaign you'll get a chance to confirm and edit all of the details. Once you're ready, click **Start Campaign**.

Next Up: Viewing your campaign results.