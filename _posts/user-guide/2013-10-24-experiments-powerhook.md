---
layout: user-guide
title: "Experiments"
author: "Artisan"
category: user-guide/experiments
description: "Getting started with the Artisan MEM platform for developers."
---
# Experiments

## Creating a Power Hook Experiment

To create a new Power Hook Experiment, first the Power Hook (or Power Hooks) must be installed in the code of your app, synchronized with Artisan, and deployed to the users who will participate in the test.  See the [Power Hook Guide]({% post_url user-guide/2015-04-15-installing-powerhooks %}) for more detail.

Once your Power Hooks are installed in your app, synchronized with Artisan, and deployed, you can create an experiment for them by observing the following steps:

* Navigate to the Power Hooks area of Artisan.
* In the Power Hooks Control Panel, find the row of at least one of the Power Hooks you want to include in an experiment.
* Click on the flask icon on the far left-hand side of that row.

That will automatically build a draft of an experiment for that Power Hook value.  You can have unlimited drafts of experiments for each Power Hook, but only one experiment can run for a given Power Hook at a time.

<img src="/images/screens/powerhooks-ab-test-1163x810.gif" height="550" width="800" class="border-full" alt="Building a Power Hook experiment." />

## Configuring and Publishing a Power Hook Experiment

See [Configuring Your Experiment]({% post_url user-guide/2013-10-24-experiments-settings %}).

### Building Your Power Hook Variations.

On the Experiment Configure tab for a Power Hook Experiment draft, there is an additional 'Variations' section that allows you to configure the Power Hook values that will be used for each variation of the test.

<img src="/images/screens/experiment-powerhook-build-1005x740.gif" height="590" width="800" class="border-full" alt="Updating the variations of a Power Hook experiment." />

The Variations section includes a table that defines the following:

* Each of the variations to include as part of your Power Hook experiment.
* Which Power Hooks to test as part of your experiment.
* What values those Power Hooks should have for each variation.
* What the distribution weight should be for each variation.

#### Adding and Deleting Test Variations

Additional variations can be added for your test by clicking the (+) symbol in the top-right corner of the Variations table.  These variations can then be removed by clicking the gear icon in that variation's column header and clicking 'Delete'.  You can also clone an existing variation by clicking the gear icon in that variation's column header and clicking 'Copy'.

#### Previewing Variations

Power Hook Experiment variations can be previewed [just like any Power Hook value change]({% post_url user-guide/2015-04-15-using-powerhooks %}/#preview).  To preview how a specific variation will operate on your device, observe the following steps:

* Click on the gear icon in that variation's column header.
* Click 'Preview'.
* Follow the prompt to connect your device to Artisan.

Your draft Power Hook values for this variation will be pushed to your device or simulator automatically, so you can view how your app will behave when the user gets this variation.  Your app will otherwise operate exactly like it does in production, so use this venue to perform a standard QA evaluation of your app to confirm the new Power Hook values for each variation have the intended effect.

Once you have valided your new Power Hook values, you can exit preview mode by clicking the 'Exit Preview' button in your browser or the 'Eye' icon in the corner of your device.  You may then edit the Power Hook values for this variation as necessary.

#### Testing Multiple Power Hooks at One Time

If you want to test multiple Power Hook values together as part of one variation, click the 'Add Powerhook' link in the 'Variations' area of the Experiment Configure screen.  This will bring up a dialog with all registered Power Hooks not currently part of this test.  Select the name of the Power Hook you wish to include, and it will automatically be added as a row to your Power Hooks variations table.

<div class="note note-hint">
  <p>Power Hooks cannot be removed from an experiment draft.  If you need to remove a Power Hook from an experiment, you'll need to build a fresh experiment.</p>
</div>


