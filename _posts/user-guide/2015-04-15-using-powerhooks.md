---
layout: user-guide
title: "Campaign Summary"
author: "Artisan"
category: user-guide/powerhooks
description: "Using Power Hooks in Artisan."
---
# Power Hooks

## Using Power Hooks

You can control all of your registered Power Hooks via the Aritsan Power Hooks Control Panel, available in the 'Power Hooks' section of Artisan.

The Power Hooks Control Panel contains the following columns:

<img src="/images/screens/powerhooks-control-panel-1200x602.png" height="401" width="800" class="border-full" alt="Power Hooks control panel." />

* The **experiment launcher icon**. Click the flask icon to launch an A/B test for the value of this Power Hook or to personalize it to a target segment.  If there is an active experiment or experiment draft for this Power Hook, this icon will be colored in.
* The **name** of the Power Hook, as specified in your application code.
* The **type** of the Power Hook.  Currently, Artisan only supports 'Text String'.
* The **default value**.  This is the default value for this Power Hook, as coded into your app.
* The **current value**.  This is the currently published value for this Power Hook.  This is what value is actively being seen by the users of your app.  Any values published via A/B test or personalization will supercede the values in this column.
* The **draft value**.  These are draft values not yet published for this app.  When you hit the 'Publish Changes' button, these will become the new current values for your app.

### Publishing Power Hooks

To update the Power Hook values currently being used by your app, observe the following steps:

* Set the new value you want to use for each Power Hook in the 'Draft Value' column for that Power Hook's row in the Control Panel.
* Click the 'Publish Changes' button.

The values in the 'Draft Value' column will overwrite the values in the 'Current Value' column, and are now live.  Users using the app will now automatically receive the newly published values for each Power Hook.

<div id="preview"></div>

### Previewing Power Hooks

There are instances where you may want to preview how new Power Hook values will influence your app's behavior before you publish them live to your users.  This can be achieved through the Artisan Power Hook Preview capability.

To preview how Power Hook values will influence your app, observe the following steps:

<img src="/images/screens/powerhooks-preview-1404x793.gif" height="452" width="800" class="border-full" alt="Power Hooks preview capability." />

* Update the 'Draft Value' column to contain the Power Hook values you want to preview.
* Click the 'Gear' icon in the header of the 'Draft Value' column and select 'Preview'.
* Follow the instructions to connect your app directly to Artisan. Once connected, your app will automatically be placed into 'Preview' mode, as indicated by the 'Eye' icon in the corner of the screen.
* Navigate around your app like a normal user would.

Your draft Power Hook values will be pushed to your device or simulator automatically, so you can view how your app will behave when these values are published.  Your app will otherwise operate exactly like it does in production, so use this venue to perform a standard QA evaluation of your app to confirm the new Power Hook values have the intended effect.

Once you have valided your new Power Hook values, you can exit preview mode by clicking the 'Exit Preview' button in your browser or the 'Eye' icon in the corner of your device.  You may now publish these Power Hook values as usual.

<div class="note note-hint">
  <p><strong>NOTE: </strong>Since Artisan does not apply changes to the screen currently being viewed by default, you may have to navigate away from the currently viewed screen and back again to see the previewed Power Hook values take effect.  To enable live, dynamic preview, see the [Binding to Screen Elements]({% post_url ios/2014-05-09-power-hooks %}/#binding-to-screen) section of the iOS Developer Guide.</p>
</div>

<div class="note note-important">
  <p><strong>NOTE: </strong>Live preview is available only for iOS apps.</p>
</div>

## Experimenting With Powerhooks

To build an A/B test for a Power Hook value, click the flask icon on the left-hand side of that Power Hook's row in the Power Hook Control Panel.  This will automatically create a draft Artisan Experiment for that Power Hook.

<img src="/images/screens/powerhooks-ab-test-1163x810.gif" height="550" width="800" class="border-full" alt="Building a Power Hook experiment." />

This draft can be configured like any Artisan A/B test, including the specification of the conversion goal, the target user segment, and the different variation values the Power Hook may take.

See Building a Power Hook Experiment for more information on how to construct, publish, and observe the results for this test.

## Personalizing Power Hook Values

Special Power Hook values can be published to a specific user segment through the use of Artisan Experiments.  The steps to publish segmented Power Hook values are as follows:

* Create an A/B Experiment Draft of the Power Hook you wish to personalize.  This draft can be created by clicking the flask icon for the Power Hook you want to test.
* Select the segment that you want to publish the personalized Power Hook value to.
* Remove all variations from the Experiment except for the Control, which should be set to the value you want to publish.
* Start the Experiment.
* Click the 'Publish' button to make the value change permanent for that segment.

The Power Hook value published to the target segment in this manner takes precedent over the value displayed in the Power Hooks Control Panel.  This value can be unpublished later by ending the test.
