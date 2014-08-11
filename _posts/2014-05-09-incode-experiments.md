---
layout: docs
title: "In-Code Experiments"
author: "Artisan"
category: dev/ios
description: "In-code experiments with the Artisan iOS SDK"
---
#In-code Experiments

In-code Experiments allow you to build tests around business logic inside your app.  For example, you can create a test for showing or not showing a particular screen.  Another example is testing multiple workflows.

<ul>
  <li><a href="#register">Register In-code Experiments</a></li>
  <li><a href="#usage">Using In-code Experiments in your App</a></li>
  <li><a href="#advanced">Advanced Experiment Analytics</a></li>
</ul>

<div id="register"></div>

## Register Experiments

An in-code experiment must be defined in the appDelegate before **ARManager startWithAppId:version:options:**.

The method **registerExperiment:** takes a string representing the name of your experiment.

{% highlight objective-c %}
[ARExperimentManager registerExperiment:@"Cart Process"];
[ARManager startWithAppId:@"xxx"]
{% endhighlight %}

Next, register each variant by name with the experiment.

{% highlight objective-c %}
[ARExperimentManager registerExperiment:@"Cart Process"];
[ARExperimentManager addVariant:@"Skip Product Screen"
                  forExperiment:@"Cart Process"];
[ARExperimentManager addVariant:@"Don't Skip Product Screen"
                  forExperiment:@"Cart Process"
                      isDefault:YES];
[ARManager startWithAppId:@"xxx"]
{% endhighlight %}

If no variation is explicitly marked as the default the first one registered for the experiment will be the default.

<div class="note note-important">
  <p>Important: If the experiment is not running the default variant will be returned when <strong>isCurrentVariant:forExperiment:</strong> is called.</p>
</div>

<div id="usage"></div>

## Using Experiments in your App

There are three parts to using Artisan in-code experiments in your app: marking the experiment as viewed, checking the current variant for this user and marking the goal or target of the experiment as reached.

In order for a conversion to count for a given variation of your experiment there must be a view recorded before the target of the experiment is reached during the user's app session.

### 1. Marking an Experiment as Viewed

Call the method **setExperimentViewedForExperiment:** to mark the experiment has been viewed for the current user session.  This call should be made at the location within the code where you want to mark the experiment as viewed.

{% highlight objective-c %}
[ARExperimentManager setExperimentViewedForExperiment:@"Cart Process"];
{% endhighlight %}

### 2. Checking the Current Variant for the Experiment for this User

Use the method **isCurrentVariant:forExperiment:** to determine which experiment variation is active.

{% highlight objective-c %}
if ([ARExperimentManager isCurrentVariant:@"Skip Product Screen" forExperiment:@"Cart Process"]) {
  // Sample code for skipping the product detail screen and going straight to the cart.
  MYSampleCartModel *cart = [MYSampleCartModel instance];
  [cart addProduct:productClicked];
  [self performSegueWithIdentifier:@"navigateToCart" sender:self];
}
else{
  // Don't Skip Product Screen
  ARPProductDetailViewController *detailViewContoller = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetail"];
  [self.navigationController pushViewController:detailViewContoller animated:YES];
}
{% endhighlight %}

<div class="note note-hint">
  <p>Hint: The logic for choosing the variant should generally be in the viewWillAppear: method of your UIViewController class or in a location where the code will be exercised each time the screen is displayed.  This is necessary so the test can be turned on and off without requiring the rebuilding of the screen.</p>
</div>

### 3. Marking an Experiment Goal as Reached

To set the goal of an in-code experiment you call the **setTargetReachedForExperiment:description:** method.  This call should be made at the location within the code where you want to mark the goal as achieved.

{% highlight objective-c %}
[ARExperimentManager setTargetReachedForExperiment:@"Cart Process"
                                       description:@"Reached the Checkout Screen."];
{% endhighlight %}

<div class="note note-hint">
  <p>It is possible to override this goal when you are setting up your experiment in Artisan Tools. From the experiment configuration screen you can use this goal or choose an interactive or session-length goal instead.</p>
</div>

<div id="advanced"></div>

## Advanced Experiment Analytics

If you would like to retrieve the variation IDs for the experiment variations that a user is experiencing for exporting to a third-party analytics tool you can use the **[ARExperimentManager getCurrentVariationIds]** method.

This will give you all of the unique variation ids for all of the Artisan experiments that this user is participating in. This includes all kinds of experiments: in-code, power hook, and canvas experiments.

{% highlight objective-c %}
NSSet *variationIds = [ARExperimentManager getCurrentVariationIds];
{% endhighlight %}

<div class="note note-hint">
<p>NOTE: the variation IDs returned are NSStrings and they are the unique alphanumeric identifiers for the experiment variations. This is different from the variant names that you define in your app delegate for In-code Experiment Variations.</p>
</div>

For in-code experiments there is also **[ARExperimentManager getCurrentExperimentDetails]**, which will return a dictionary of **ARExperimentDetails** objects where the keys are the experiment in-code names.

These experiment details can tell you what the current variation is for each experiment, but it won’t give you the unique ids, just the in-code names.

The in-code names for the experiment and variation are the string values that you set when you registered these experiments in your AppDelegate.
