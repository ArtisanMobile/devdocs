---
layout: user-guide
title: "Viewing Reports"
author: "Artisan"
category: user-guide/analyze
description: "Getting started with the Artisan MEM platform for developers."
---
# Reports & Analytics

## Viewing Reports
Artisan reports give you valuable insight into how your app is performing. Each report gives you insight into different areas. The current available reports are:

* Users
* Sessions
* Devices
* Operating Systems
* Recency
* Frequency
* Events (see [Managing Events]({% post_url user-guide/2013-10-24-managing-events %}))
* Retention

Report data can be filtered across a number of different criteria, including:

* User Segment (see [People & Segmentation]({% post_url user-guide/2014-06-11-people %}))
* Date Range
* Device Chararacteristics, including:
    * OS Version
    * App Version
    * Device Model
    * Device Language
    * User Country
* User Experiment Variation (for users who have participated in an A/B Test, see [Experiments]({% post_url user-guide/2013-10-24-experiments %}))
* User Campaign (for users who had been engaged in a campaign, see [Campaigns]({% post_url user-guide/2014-06-10-campaigns %}))

The Event Report includes additional filters to provide additional insight into event-level data:

* Event Tag Values
* Event Category Values

The event-specific filters enable event data to be sorted and viewed based off of the attached tag data, which itself can be organized into a hierarchy via tag families.

### Users
The Users Report provides an understanding of new vs. existing users, along with a range of recurring user statistics (e.g. unique users from yesterday). Note that users in this case are in fact unique users over the specified timespan.

### Sessions
The Sessions Report indicates session trends for the number of sessions and average session length, computed either daily or over a specified period of time. Note that a session is the determined as a single instance where a user started and then closed the app, and session time is determined from the time from app opens to when it is closed or backgrounded on the device.

### Devices
The Devices Report demonstrates the number of sessions per device type both in a trend line as well as daily.

### Operating Systems
The Operating Systems Report displays the operating system version for the devices that your app is installed on both in a trend line as well as daily.

### Recency

The Recency Report graphs how long it had been since your users had previously used your app prior to them using it during the specified time frame.  This is intended to show how long users are going between usages of your app, and whether you've seen a spike in loyal users (i.e. users who use the app repeatedly on the same day) or long-time dormant users (i.e. users who hadn't used the app for weeks before returning).

For example, if you're viewing the report for the 'Last 30 Days' time frame:

* If a user who had last used your app three months ago uses it again yesterday, their new session will be tallied in the '60+ days' column.
* If a new user freshly downloads your app 20 days ago and then uses it for the first time, their first session will be tallied in the 'New User' column.
* If that same user then uses the app again 10 days ago, their second session will be tallied in the '8-14 days' column.

### Frequency

The Frequency Report shows the number of times your users had ever previously used your app prior to them using it during the specified time frame.  This is intended to show what percentage of your users during that time frame were extremely loyal users (i.e. had used your app dozens of times already) versus what percentage were new or new-ish users who had only used the app a few times.

For example, if you're viewing the report for the 'Last 30 Days' time frame:

* If a user freshly downloads your app 15 days ago and uses your app for the first time, that session is their first ever session and will be tallied in the '1st' column.
* If that same user then uses the app again 10 days ago, that second session will be their second ever session, and will be tallied in the '2nd' column.
* If a long-time user who had already used your app 23 times uses it for the 24th time ten days ago, that session will be tallied in the '21st-25th' column.

### Event

The Event Report shows all of the actions that have ever been triggered within your app, along with their tagged information and frequency per user.  See [Managing Events]({% post_url user-guide/2013-10-24-managing-events %}) for more information.

### Retention

The Retention Report allows for your users to be divided into cohorts -- users who triggered a specific action (i.e. logging in, making a purchase, viewing an article) on a specific day -- so that you can see what percentage of that cohort returned to perform a follow-up action at some point in the future.

For example, if you want to see how frequently users who complete an order return to make another purchase over the next few months, you can use the Retention Report to view this trend.  As illustrated:

<p><img src="/images/screens/retention-report-example-700x480.gif" width="700" height="480" class="border-full" alt="Screen capture of a user building an example Retention Report." /></p>

* Select users who triggered the 'Order Complete' action to be your cohort.
* Select 'Order Complete' to be your follow-up action.

The chart will show how many users triggered the 'Order Complete' action each day, as well what percentage of those users returned to complete another order on each of the next fourteen days.

This chart can also be configured to show different date windows, and to group cohorts by weeks or months instead of days.
