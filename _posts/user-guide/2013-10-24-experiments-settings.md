---
layout: user-guide
title: "Experiments"
author: "Artisan"
category: user-guide/experiments
description: "Getting started with the Artisan MEM platform for developers."
---
# Experiments

## Configuring Your Experiment

The 'Configure' tab of an Experiment draft lets you set the parameters of your experiment, including its duration, target audience, distribution, conversion goal, and KPIs.  Once set, the Experiment Configuration screen will also let you start your experiment, so that users of your app will start receiving it and returning results.

<img src="/images/screens/experiments-settings-1111x690.gif" height="497" width="800" class="border-full" alt="Experiment settings screen." />

### Changing Duration
You can change the duration of your experiment by selecting the Minutes, Hours, Days, or Weeks from the dropdown menu and entering in a length of time for your experiment to run.

### Choosing an Audience
Before an experiment can begin, you need to tell Artisan how many of your users should participate in the experiment. You can do this by entering the number of users in the field provided in the Audience section of the Configure tab.

You can also target your experiment to a specific segment of users, as have been built in the [Artisan People]({% post_url user-guide/2014-06-11-people %}) area. To target your experiment to a segment:

* Click the Target Experiment to a Segment checkbox in the Audience section of the Configure tab
* Select the type of users you would like to target using the drop down box provided and enter a value

### Setting a Conversion Goal
A Conversion Goal is how we measure success for an experiment and how we calculate which variation in your experiment is winning. A conversion goal can trigger when your users interact with a specific object in your app (ex. tap a button) or when a user has used your app for a specific amount of time.

To set a conversion goal, first select "Interacts with" or "Uses your app for more than" from the drop down box in the Conversion Goals section of the Configure tab. Then set your criteria:

* **Interacts with** — Click the Set Interaction button. This will open the Artisan Event Discovery dialog, from which you can select the event that marks a conversion for this experiment.  See [Managing Events]({% post_url user-guide/2013-10-24-managing-events %}) for more information.

* **Uses your app for more than** — Select Seconds, Minutes, or Hours from the drop down box and then enter the length of time that your users need to be actively using your app to count as a conversion.

### Key Performance Indicators
Key Performance Indicators are other events whose frequency you'd like to compare across variations.  To add a KPI, click the empty field next to 'Add an Event'.  This will bring up the Artisan Event Discovery dialog, from which you can select the event to make a KPI.  For each KPI event, an additional chart will be added to the Experiment Results page showing how frequently the target happened for each variation over time, allowing for easy comparison to see if the variation is influencing the target behavior.  A maximum of 6 KPIs can be created for one experiment.

## Starting Your Experiment

After you've configured your experiment, click the "Save Experiment" link on the right side of the screen. If there are any issues with your experiment configuration, a notification will appear to indicate the issue. If there are no errors, you should see a "Start Experiment" link. When you are ready to start distributing your experiment to users, click the "Start Experiment" button to begin.

Your experiment is now running. Your experiment will begin showing up for your users per your configuration, and results will be displayed on the Summary tab for your experiment.

## Changing your Experiment

If you have saved an Experiment as a draft, you can modify it by navigating to Experiments on the navigation bar and clicking on the name of your experiment.

* To edit a Variation select Edit Variation from the right side and if your app is not already connected you will be prompted to do so, you will now be in Canvas and be able to make your modifications.
* If you have already published (started) the Experiment, you cannot make any changes to it. You can manually end the Experiment from the Configuration tab and then recreate it with the appropriate changes.

## Deleting your Experiment

If you wish to delete a previously created campaign draft, observe the following steps:

* Open your list of experiments and click on the experiment you would like to delete.
* You will now be on the draft Experiment Configure page.  In the top-right corner, click the 'Delete Draft' button.
* Click 'Delete' on the confirmation dialog.
