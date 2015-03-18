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
// Objective-C

[ARExperimentManager registerExperiment:@"Cart Process"];
[ARManager startWithAppId:@"YOUR_APP_ID"]
{% endhighlight %}

{% highlight swift %}
// Swift

ARExperimentManager.registerExperiment("Cart Process")
ARManager.startWithAppId("YOUR_APP_ID")
{% endhighlight %}

Next, register each variant by name with the experiment.

{% highlight objective-c %}
// Objective-C

[ARExperimentManager registerExperiment:@"Cart Process"];
[ARExperimentManager addVariant:@"Skip Product Screen"
                  forExperiment:@"Cart Process"];
[ARExperimentManager addVariant:@"Don't Skip Product Screen"
                  forExperiment:@"Cart Process"
                      isDefault:YES];
[ARManager startWithAppId:@"YOUR_APP_ID"]
{% endhighlight %}

{% highlight swift %}
// Swift

ARExperimentManager.registerExperiment("Cart Process")
ARExperimentManager.addVariant("Skip Product Screen",
                forExperiment: "Cart Process")
ARExperimentManager.addVariant("Don't Skip Product Screen",
                forExperiment: "Cart Process",
                    isDefault: true)
ARManager.startWithAppId("YOUR_APP_ID")
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
// Objective-C

[ARExperimentManager setExperimentViewedForExperiment:@"Cart Process"];
{% endhighlight %}

{% highlight swift %}
// Swift

ARExperimentManager.setExperimentViewedForExperiment("Cart Process")
{% endhighlight %}

### 2. Checking the Current Variant for the Experiment for this User

Use the method **isCurrentVariant:forExperiment:** to determine which experiment variation is active.

{% highlight objective-c %}
// Objective-C

if ([ARExperimentManager isCurrentVariant:@"Skip Product Screen" forExperiment:@"Cart Process"]) {
  // Sample code for skipping the product detail screen and going straight to the cart.
  MYSampleCartModel *cart = [MYSampleCartModel instance];
  [cart addProduct:productClicked];
  [self performSegueWithIdentifier:@"navigateToCart" sender:self];
} else {
  // Don't Skip Product Screen
  MYSampleProductDetailViewController *detailViewContoller = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetail"];
  [self.navigationController pushViewController:detailViewContoller animated:YES];
}
{% endhighlight %}

{% highlight swift %}
// Swift

if ARExperimentManager.isCurrentVariant("Skip Product Screen", forExperiment: "Cart Process") {
    // Sample code for skipping the product detail screen and going straight to the cart.
    let cart = MYSampleCartModel()
    cart.addProduct(productClicked)
    self.performSegueWithIdentifier("navigateToCart", sender:self)
} else {
    // Don't Skip Product Screen
    let detailViewController = self.storyboard.instantiateViewControllerWithIdentifier("MYSampleProductDetail") // this will be of type MYSampleProductDetailViewController
    self.navigationController.pushViewController(detailViewController, animated:true)
}
{% endhighlight %}

<div class="note note-hint">
  <p>Hint: The logic for choosing the variant should generally be in the viewWillAppear: method of your UIViewController class or in a location where the code will be exercised each time the screen is displayed.  This is necessary so the test can be turned on and off without requiring the rebuilding of the screen.</p>
</div>

### 3. Marking an Experiment Goal as Reached

To set the goal of an in-code experiment you call the **setTargetReachedForExperiment:description:** method.  This call should be made at the location within the code where you want to mark the goal as achieved.

{% highlight objective-c %}
// Objective-C

[ARExperimentManager setTargetReachedForExperiment:@"Cart Process"
                                       description:@"Reached the Checkout Screen."];
{% endhighlight %}

{% highlight swift %}
// Swift

ARExperimentManager.setTargetReachedForExperiment("Cart Process",
                                    descriptions: "Reached the Checkout Screen.")
{% endhighlight %}

<div class="note note-hint">
  <p>It is possible to override this goal when you are setting up your experiment in Artisan Tools. From the experiment configuration screen you can use this goal or choose an interactive or session-length goal instead.</p>
</div>

<div id="advanced"></div>

## Advanced Experiment Analytics

If you would like to retrieve the variation IDs for the experiment variations that a user is experiencing for exporting to a third-party analytics tool you can use the **getCurrentExperimentDetails** or **getInCodeExperimentDetails** methods from **ARExperimentManager**.

The **getCurrentExperimentDetails** will give you all of the details on currently running experiments including experiment name, experiment id, variation name and variation id for all of the Artisan experiments that this user is participating in. This includes all kinds of experiments: in-code, power hook, and canvas experiments.

{% highlight objective-c %}
// Objective-C
NSArray *experiments = [ARExperimentManager getCurrentExperimentDetails];
{% endhighlight %}

We recommend that you call this method anytime after the first playlist is downloaded so that you have the most up-to-date information about what experiments the user is participating in. Here's an example of using this method in a callback for onFirstPlaylistDownloaded, which would be the way to guarantee that the first playlist has been downloaded:

{% highlight objective-c %}
// Objective-C
[ARManager onFirstPlaylistDownloaded:^{
    NSArray *experimentDetails = [ARExperimentManager getCurrentExperimentDetails];
    // Here is an example of iterating through all of the running experiments and logging the details:
    [experimentDetails enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      ARExperimentDetails *details = (ARExperimentDetails*)obj;
      NSLog(@"experimentId: %@", [details experimentId]);
      NSLog(@"experimentName: %@", [details experimentName]);
      NSLog(@"experimentType: %@", [details experimentType]);
      NSLog(@"variation ID: %@", [details currentVariantId]);
      NSLog(@"variation name: %@", [details currentVariantName]);
    }];
}];
{% endhighlight %}

The **getInCodeExperimentDetails** method will give you **all** (regardless if they're running or not) in-code experiments in your app. These in-code specific details will allow you to find your in-code experiment by the name you registered in your code. See the example below.

{% highlight objective-c %}
// Objective-C
// in the view controller you're changing via your in-code experiment
- (void) viewWillAppear:(BOOL)animated {
    // Your other code...
    NSDictionary *detailsDictionary = [ARExperimentManager getInCodeExperimentDetails];
    ARInCodeExperimentDetails *details = [detailsDictionary objectForKey:@"Your Experiment Name"];

    if (details.isRunning) {
        // This experiment has been started from Artisan Tools and all details are available to you.
        // You can use these details to feed into your third party analytics tool.
        NSLog(@"experimentId: %@", [details experimentId]);
        NSLog(@"experimentName: %@", [details experimentName]);
        NSLog(@"experimentType: %@", [details experimentType]);
        NSLog(@"variation ID: %@", [details currentVariantId]);
        NSLog(@"variation name: %@", [details currentVariantName]);
        NSLog(@"experiment Start: %@", [details startDate]);
        NSLog(@"experiment End: %@", [details endDate]);
        NSLog(@"experiment in-code name: %@", [details inCodeName]);
        NSLog(@"experiment default variant: %@", [details defaultVariant]);
        NSLog(@"experiment description: %@", [details experimentDescription]);
        NSLog(@"experiment isRunning: %@", [details isRunning] ? @"YES" : @"NO");
    }
    // Your code continued...
}
{% endhighlight %}

There is also **getCurrentVariationIds** from **ARExperimentManager**, which will return just the variation ids for all experiments.

{% highlight objective-c %}
// Objective-C

NSSet *variationIds = [ARExperimentManager getCurrentVariationIds];
{% endhighlight %}

{% highlight swift %}
// Swift

let variationIds = ARExperimentManager.getCurrentVariationIds()
{% endhighlight %}

<div class="note note-hint">
<p>NOTE: the variation IDs returned are NSStrings and they are the unique alphanumeric identifiers for the experiment variations. This is different from the variant names that you define in your app delegate for In-code Experiment Variations.</p>
</div>

<div class="note note-hint">
<p>For Experiment details specific to Power Hooks see <a href="/dev/ios/power-hooks/#experiment-details">Power Hook Experiment Details</a></p>
</div>
