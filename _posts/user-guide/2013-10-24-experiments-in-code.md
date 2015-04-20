---
layout: user-guide
title: "Experiments"
author: "Artisan"
category: user-guide/experiments
description: "Getting started with the Artisan MEM platform for developers."
---
# Experiments

## Creating an In-Code Experiment

To create a new In-Code Experiment, first the experiment must be coded into your app using the Artisan In-Code Experiment API ([iOS]({% post_url ios/2014-05-09-incode-experiments %}), [Android]({% post_url android/2014-05-08-incode-experiments %}), [JS]({% post_url js/2014-07-18-hybrid-sdk-reference-guide %}/#experimentapi).  Once the new experiment has been coded into your app, the update needs to be distributed to the App Store for users to participate in it.  You will also need an instance of the app with the in-code experiment included (running on either your device or the simulator) to register it with Artisan.

Once this installation of the in-code experiment is ready, observe the following steps:

* Navigate to the [Artisan Design Center]({% post_url user-guide/2013-10-24-app-map %}).
* Follow the instructions to connect your app to Artisan.
* Click 'Configure an In-Code Experiment' on the right sidebar.
* Select the name of the in-code experiment you wish to run from the dropdown.

<img src="/images/screens/experiment-app-map2-800x498.png" height="498" width="800" class="border-full" alt="Creating a new In-Code Experiment." />

## Configuring and Publishing an In-Code Experiment

See [Configuring Your Experiment]({% post_url user-guide/2013-10-24-experiments-settings %}).

### Setting a Conversion Goal

Part of the definition of an in-code experiment involves the following:

* An in-code analytics event that defines when the test is officially 'viewed'.  When this event is encountered, a view is talled as part of the test results for this variation.
* An in-code analytics event that defines when the test is officially 'converted'.  When this event is encountered, a conversion is tallied as part of the test results for this variation (provided a view has already been tallied for this session).

There may be cases where you want to override the default conversion event set as part of the in-code test.  In these cases, you can use the Conversion Override feature on the Experiment Configure screen.

<img src="/images/screens/experiment-conv-override-800x365.gif" height="365" width="800" class="border-full" alt="Overriding the conversion for an in-code experiment." />

In the 'Conversion Goal' area of the Experiment Configure screen, click the hyperlink 'You may override this goal.'  This will bring up the normal 'Conversion Selection' option, which can be specified as it is for the other types of A/B tests.  Any option selected here will take precedence over what was coded for the experiment.

To remove any override, click the 'Remove Override' hyperlink.