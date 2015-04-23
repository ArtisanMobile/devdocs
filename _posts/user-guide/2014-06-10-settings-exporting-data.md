---
layout: user-guide
title: "Settings"
author: "Artisan"
category: user-guide/settings
description: "Managing settings in Artisan."
---
# Settings

## Exporting Data

The Artisan App Settings screen allows you to do a raw, CSV export of all of the data Artisan has collected from your app users.  This includes the following content:

* All analytics events Artisan has ever seen, including all metadata about the user at the time of the event and all tagged information.
* All users Artisan has ever seen, including their most recently transmitted profile information.

<img src="/images/screens/settings-data-export-698-485.png" height="485" width="698" class="border-full" alt="Artisan Settings export example." />

### Event Data

Event data can be exported over any time range according to any of the following five filters:

* **All Events:** Every event Artisan has collected for this app.
* **Interactions Events:** Only the automatically collected events where a user interacted with elements on the screen (buttons, fields, etc.).
* **Session Starts/Stops:** Only the automatically collected 'App Started' and 'App Stopped' events.
* **Screen Views Only:** Only the automatically collected events where a user has viewed a particular screen.
* **Custom Actions Only:** Only custom events coded directly into the app.

When you click the 'Export Event Data', Artisan will start retrieving the data in its data warehouse.  Within the next 24 hours, you will receive an email (sent to the email address associated with your artisantools.com account) that contains a link to your exported data.  This link will be valid for seven days.

Contained at this link is a collection of compressed CSV files -- one for each day requested -- containing all of the raw event data.  Download this file and parse it for whatever data analysis you want to perform on the Artisan event content.

### Profile Data

When you click the 'Export Profile Data' button, Artisan will export a CSV containing all profile information we have ever collected for the users of this app.  Each row in the CSV will correspond to a single user profile, and will contain the most recent information stored in the user profile (as automatically collected by Artisan or specified via the Aritsan Profile API).

Upon clicking 'Export Profile Data', you will receive an email (sent to the email address associated with your artisantools.com account) that contains a link to your exported data.  This email should arrive within 24 hours, and the link will be valid for seven days.
