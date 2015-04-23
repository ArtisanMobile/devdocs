---
layout: user-guide
title: "Campaign Summary"
author: "Artisan"
category: user-guide/campaigns
description: "A/B Testing Your Campaigns in Artisan."
---
# Campaigns

## A/B Testing Campaigns

All Artisan Campaigns can be A/B tested, such that different push or in-app message variations can be sent in parallel to determine which is most effective at engaging users.  Different users within the target segment will be assigned to receive each of these variations, with the results compared in real-time to determine the superior performer.

## Building a Campaign A/B Test

An Artisan Campaing A/B Test can be built by observing the following steps:

* Create a new Artisan Campaign as usual.
* Fill in all the usual information on the 'Details' screen.  Take special note of the 'Conversion Goal' entry -- this conversion goal will be used to determine how each variation is performing (and whether a variation has a statistically significant advantage in conversion over the others).
* Click 'Continue'
* On the 'Compose' screen, click the flask icon in the top-left corner.

<img src="/images/screens/campaign-ab-testing-setup-700x380.gif" height="380" width="700" class="border-full" alt="The Artisan A/B Test creation area." />

* Click 'Start A/B Testing'
* Create the variations you want to include in your test. New variations can be created using the '+' symbol. Varations can be renamed with the pencil icon. Variations can be cloned with the 'copy' icon, and deleted with the 'X' icon.
* For each variation, define the content the same way a normal campaign is defined.  The currently active variation can be changed by clicking the experiments icon to open the experiment menu and selecting the variation you wish to edit.

<img src="/images/screens/campaign-ab-testing-switch-700x380.gif" height="380" width="700" class="border-full" alt="Switching between campaign variations." />

* All properties normally defined in the process of building a campaign message can be A/B tested.  This includes the content of the message, the colors and design, the call to action, the trigger event, the delivery time, and the delivery frequency.

* Once all variations are defined, you can set the weights defining how often each variation should be sent to your users.  The weights panel can be accessed by clicking the experiments icon and then clicking the 'gear' icon in the top-right corner of the experiments menu.  Use the sliders to set the weights for each of your variations (adding to 100%).  Weights can be locked by clicking on the letter icon corresponding with a variation, and all unlocked weights can be evened out by clicking the 'Evently Distribute' button.

<img src="/images/screens/campaign-ab-testing-weights-700x380.gif" height="380" width="700" class="border-full" alt="Setting campaign distribution weights." />

* Click 'Continue'
* Confirm that the settings and weights for your Campaign A/B test are correct.
* Click 'Start Campaign' to publish the campaign (according to its defined schedule).

Once the campaign begins, it will automatically be distributed to the targeted segment according to the defined weights.  The results will then be recorded automatically to see which is performing best.

## Viewing Campaign A/B Test Results

For an Campaign A/B Test, the standard [Campaign Results]({% post_url user-guide/2014-06-10-campaign-summary %}) page is updated to show how the different variations are performing against each other:

<img src="/images/screens/campaign-in-app-ab-test-results-800x603.png" height="528" width="700" class="border-full" alt="Campaign results page for an A/B test." />

Additional features of the Campaign A/B Test results page include:

* The **Variation Performance** table that shows the distribution level and conversion performance for each variant.
    * Users: Reflects the number of users assigned to this variation.  For push campaigns, this is the number of unique users who have received the push.  For in-app campaigns, this is the number of users who would receive this variation if they trigger the correct even trigger.
    * Conversions / Views:  The number of times the conversion event has been triggered after receiving the campaign message, divided by the total number of impressions of the campaign message.
    * Converesion Rate: The percentage of views that have resulted in a conversion, along with the 95% confidence interval.
    * Change %: The difference in conversion rate between this variation and the base variation (i.e. Variation 'A').
* The **Conversions Over Time** chart compares the conversion rate for each variation over time, illustrating when the conversion rates have stabilized and a winner has converged.
* The **Variation Selection** tabs.  These allow you to switch the results screen to look at one specific variation at a time.
* The other standard results charts, which are updated to juxtapose the results from each variation against each other to identify other performance trends.
