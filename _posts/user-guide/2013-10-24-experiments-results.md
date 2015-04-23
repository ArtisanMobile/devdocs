---
layout: user-guide
title: "Experiments"
author: "Artisan"
category: user-guide/experiments
description: "Getting started with the Artisan MEM platform for developers."
---
# Experiments

## Understanding Your Experiment Results

Once your experiment has been published, Artisan will automatically begin distributing it to your users and collecting the results in real-time.

<img src="/images/screens/experiment-results-1240x700.gif" height="395" width="700" class="border-full" alt="Sample Artisan Experiment results screen." />

The results screen is divided into the following sections:

#### Conversion Goal

This contains the Conversion Goal you set on the Experiment Configure tab when you were building your experiment.  Triggering this action or meeting this criteria will count as a 'conversion' for the purposes of evaluating a variation's performance.

#### Variation Performance

This table contains the core information about how each variation is performing against one-another.  The columns are as follows:

<img src="/images/screens/experiment-result-table-800x289.png" height="395" width="700" class="border-full" alt="Sample Aritsan Experiment results table." />

* **Variation**: The name of the variation in question.
* **Weight**: The distribution weight for this variation.  This is the likelihood that a new user will receive this particular variation when they are incorporated into this experiment.
* **Users**: The number of users who have been assigned to his variation.  Not all of these users may have actually encountered your test (by viewing the affected screen or encountering the tested Power Hook or in-code change).  This tally just means that they will get **this variation** should they actually navigated to the tested part of your app.
* **Conversions/Views**: The number of test conversions divided by the number of test views. See <a href="#result-calculations">How Artisan Calculates Test Views and Conversions</a> for how these figures are calculated.
* **Conversion Rate**: The percentage of test views that have resulted in a conversion.  Includes the 95% confidence interval.
* **Change %**: The improvement of this variation against the conversion rate of the Control variation.
* **Confidence**: Badge to indicate if this variation exhibits a statistically significant improvement in conversion.  There are two possible badges:
    * **Gold**: This variation is 95% likely to be an improvement over the control.
    * **Green**: This variation is 95% likely to be an improvement over all other variations for this test.
* **Publish**: Option to publish this variation to all users in the segment to which this test was targeted. See <a href="#publishing">Publishing Variations</a> for more information. 

The Variation Performance table provides two views into the test results: 'Session' and 'User':

<img src="/images/screens/experiment-results-sessionuser-350x168.png" height="395" width="700" class="border-full" alt="Experiment results session-user switch." />

* **Session**: Measures conversion views and conversions on a per-session, per test-trial basis. One user may therefore view and convert on the test multiple times.
* **User**: Measures converison views and conversions on a per-user basis.  That means that the Conversions/Views ratio will reflect the number of unique users who __ever__ viewed the test, and the unique count of those users who __ever__ converted.  A user may therefore count as a maximum of one test view and one conversion.

These can be switched by clicking the respective link in the right-hand side of the table header.

#### Conversion Rate Over Time

<img src="/images/screens/experiment-results-users-800x483.png" height="483" width="800" class="border-full" alt="Experiment results comparison tables." />

Chart that shows how the cumulative conversion rate for each of your variations over time.  Use this chart to identify when the conversion rates stabilize, thus indicating that the tests are converging on a result.

#### Users, Number of Sessions, Average Session Length

Charts that compare each of the different variations by their audience sizes and behavior over time.  Use these to view participation figures for each variation, and to see if the variation is having a demonstrable impact on the length and engagement of user sessions.

#### KPI Charts

Charts that compare how frequently each of your KPI events have been happening for each of your variations over time.  Use these to inspect whether the variations are impacting other key events in your app besides the conversion rate.

<div id="result-calculations"></div>

## How Artisan Calculates Test Views and Conversions

The 'Views and Conversion' column shown in the Variation Performance table is computed according to algorithms attuned to the type of test being run.   These algorithms are as follows:

#### Canvas Experiments

For Canvas Experiments, the following rules hold true:

* If the Conversion Goal for the test is when a specific event is triggered, the following rules hold true:
    * A 'view' is tallied whenever the user navigates to the screen on which the Canvas experiment has been applied.
    * A 'conversion' is tallied whenever the conversion event happens, assuming that at least one 'view' has happened this session.
    * When a 'conversion' happens, the user may not convert again until they trigger another 'view'.

* If the Conversion Goal for the test is when the user conducts a session of a certain length:
    * A 'view' is tallied if the user navigates to the screen on which the Canvas experiment has been applied during the session.  There is a maximum count of one 'view' per session.
    * A 'conversion' occurs if the user 'viewed' the test during the session, and the session is over the minimum length when it ends.

#### Power Hook Experiments

* If the Conversion Goal for the test is when a specific event is triggered, the following rules hold true:
    * A 'view' is tallied if the user retrieves the value of one of the tested Power Hooks over the course of the session.  There is a maximum of one 'view' per session.
    * A 'conversion' is tallied if the conversion event happens after a 'view' happens within a session.  There is a maximum of one 'conversion' per session.

* If the Conversion Goal for the test is when the user conducts a session of a certain length:
    * A 'view' is tallied if the user retrieves the value of one of the tested Power Hooks over the course of the session.  There is a maximum of one 'view' per session.
    * A 'conversion' occurs if the user 'viewed' the test during the session, and the session is over the minimum length when it ends.

#### In-Code Experiments

* If the Conversion Goal for the test is when a specific event is triggered, the following rules hold true:
    * A 'view' is tallied whenever the `setExperimentViewedForExperiment(experimentId)` call is triggered within the code of the app.
    * A 'conversion' is tallied whenever the conversion event happens, assuming that at least one 'view' has happened this session.
    * When a 'conversion' happens, the user may not convert again until they trigger another 'view'.

* If the Conversion Goal for the test is when the user conducts a session of a certain length:
    * A 'view' is tallied whenever the `setExperimentViewedForExperiment(experimentId)` call is triggered within the code of the app.
    * A 'conversion' occurs if the user 'viewed' the test during the session, and the session is over the minimum length when it ends.

<div id="publishing"></div>

## Publishing Variations

Once a test has been launched, Artisan enables you to publish any of the variants (besides the 'Control' variant) as the 'winner' of the test.  Being published means that this variation will now be distributed to __all__ users in the segment targeted by this test, even if they were slotted into a different variation while the test was active.

Published changes apply in the order they were published -- newer published values taking precedence over older published values.

Any non-Power Hook test can also be reverted to remove the published change and revert the user apps back to their previous state.  Power Hook tests can be reverted by publishing a test that rolls the user back to the original value.

