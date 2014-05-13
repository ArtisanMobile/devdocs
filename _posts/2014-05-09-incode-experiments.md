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
  <li><a href="#register">Register Experiment</a></li>
</ul>

<div id="register"></div>

## Register Experiment

An in-code experiments must be defined in the appDelegate before the **startWithAppId:version:options:** line.

The method **registerExperiment:** takes a string representing the name of your experiment.

{% highlight objective-c %}
[ARExperimentManager registerExperiment:@"Cart Process"];
[ARManager startWithAppId:@"xxx"]
{% endhighlight %}

Next, register each variant by name with the experiment.

{% highlight objective-c %}
[ARExperimentManager registerExperiment:@"Cart Process"];
[ARExperimentManager addVariant:@"Skip Product Screen" forExperiment:@"Cart Process"];
[ARExperimentManager addVariant:@"Don't Skip Product Screen" forExperiment:@"Cart Process" isDefault:YES];
[ARManager startWithAppId:@"xxx"]
{% endhighlight %}

<div class="note note-important">
  <p>Important: If the experiment is not running the default variant will be selected.</p>
</div>

Call the method **setExperimentViewedForExperiment:** to mark the experiment has been viewed for the current user session.  This call should be made at the location within the code where you want to mark the experiment as viewed.

Use the method **isCurrentVariant:forExperiment:** to determine which experiment variation is active.

{% highlight objective-c %}
// Set Experiment Viewed
[ARExperimentManager setExperimentViewedForExperiment:@"Cart Process"];

// Sample Branching Code
if ([ARExperimentManager isCurrentVariant:@"Skip Product Screen" forExperiment:@"Cart Process"]) {
  // Skip Product Screen
  ARPCartModel *cart = [ARPCartModel instance];
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

To set the goal of an in-code experiment you call the **setTargetReachedForExperiment:description:** method.  This call should be made at the location within the code where you want to mark the goal as achieved.

{% highlight objective-c %}
// Set Goal Reached Code
[ARExperimentManager setTargetReachedForExperiment:@"Cart Process" description:@"Reached the Checkout Screen."];
{% endhighlight %}
