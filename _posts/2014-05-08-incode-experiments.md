---
layout: docs
title: "In-Code Experiments"
author: "Artisan"
category: dev/android
description: "In-code experiments with the Artisan Android SDK"
---
#In-code Experiments

In-code Experiments allow you to build tests around business logic inside your app.  For example, you can create a test for showing or not showing a particular screen.  Another example is testing multiple workflows.

<ul>
  <li><a href="#register">Register In-code Experiments</a></li>
  <li><a href="#usage">Using In-code Experiments in your App</a></li>
  <li><a href="#advanced">Advanced Experiment Analytics</a></li>
</ul>

<div id="register"></div>

## Register Experiment

An in-code experiments must be defined in the **registerInCodeExperiments** on your Application class.

The method **registerExperiment:** takes a string representing the name of your experiment.

The method **registerExperimentWithDescription(String experimentName)** or **registerExperimentWithDescription(String experimentName, String description)** takes a string representing the name of your experiment and an optional string for a description that will be displayed in Artisan Tools.

{% highlight java %}
@Override
public void registerInCodeExperiments() {
  ArtisanExperimentManager.registerExperiment("Cart Process", "Skip or don't skip the product detail page");
}
{% endhighlight %}

Next, register each variant by name with the experiment with **addVariantForExperiment(String variantName, String experimentName)** or **addVariantForExperiment(String variantName, String experimentName, boolean isDefault)**.

* **variantName** The name of the variant to add. This needs to be unique for the experiment.
* **experimentName** The name of the experiment to which this variant should be added. This needs to be the name a variant previously created via **registerExperiment**.
* **isDefault** Sets whether this variant is the default. The default variant will be used in instances where the experiment is not active (i.e. completed or not yet published). If no variant is marked as the default the first variant you add will be the default.

{% highlight java %}
@Override
public void registerInCodeExperiments() {
  ArtisanExperimentManager.registerExperiment("Cart Process", "Skip or don't skip the product detail page");
  ArtisanExperimentManager.addVariantForExperiment("Don't Skip Product Details", "Cart Process", true);
  ArtisanExperimentManager.addVariantForExperiment("Skip Product Details", "Cart Process");
}
{% endhighlight %}

If no variation is explicitly marked as the default the first one registered for the experiment will be the default.

<div class="note note-important">
  <p>Important: If the experiment is not running the default variant will be returned when **isCurrentVariantForExperiment** is called.</p>
</div>

<div id="usage"></div>

## Using Experiments in your App

There are three parts to using Artisan In-code experiments in your app: marking the experiment as viewed, checking the current variant for this user, and marking the goal of the experiment as reached.

In order for a conversion to count for a given variation of your experiment there must be a view recorded before the target of the experiment is reached during the user's app session.

### 1. Marking an Experiment as Viewed

Call the method **setExperimentViewedForExperiment(String experimentName)** to mark the experiment has been viewed for the current user session. This call should be made at the location within the code where you want to mark the experiment as viewed.

{% highlight java %}
ArtisanExperimentManager.setExperimentViewedForExperiment("Buy Button Test");
{% endhighlight %}

### 2. Checking the Current Variant for the Experiment for this User

Use the method **isCurrentVariantForExperiment(String variantName, String experimentName)** to determine which experiment variation is active.

{% highlight java %}
if (ArtisanExperimentManager.isCurrentVariantForExperiment("button says add to cart", "Buy Button Test")) {
  textView.setText("Add to Cart");
} else if (ArtisanExperimentManager.isCurrentVariantForExperiment("button says buy now", "Buy Button Test")) {
  textView.setText("Buy Now!");
}
{% endhighlight %}

<div class="note note-hint">
  <p>Hint: The logic for choosing the variant should generally be in the <strong>onResume</strong> method of your Activity or in a location where the code will be exercised each time the screen is displayed.  This is necessary so the test can be turned on and off without requiring the rebuilding of the screen.</p>
</div>

### 3. Marking an Experiment Goal as Reached

To set the goal of an in-code experiment you call the **setTargetReachedForExperiment(String experimentName)** method.  This call should be made at the location within the code where you want to mark the goal as achieved.

{% highlight java %}
ArtisanExperimentManager.setTargetReachedForExperiment("Buy Button Test");
{% endhighlight %}

<div class="note note-hint">
  <p>It is possible to override this goal when you are setting up your experiment in Artisan Tools. From the experiment configuration screen you can use this goal or choose an interactive or session-length goal instead.</p>
</div>

<div id="advanced"></div>

## Advanced Experiment Analytics

If you would like to retrieve the variation IDs for the experiment variations that a user is experiencing for exporting to a third-party analytics tool you can use the **getCurrentVariationIds** method from **ArtisanExperimentManager**.

This will give you all of the unique variation ids for all of the Artisan experiments that this user is participating in. This includes all kinds of experiments: in-code, power hook, and canvas experiments.

{% highlight java %}
Set<String> variationIds = ArtisanExperimentManager.getCurrentVariationIds();
{% endhighlight %}

<div class="note note-hint">
<p>NOTE: the variation ids returned are Strings and they are the unique alphanumeric identifiers for the experiment variations. This is different from the variant names that you define in your Application class for In-code Experiment Variations.</p>
</div>

For in-code experiments there is also **getCurrentExperimentDetails** from **ArtisanExperimentManager**, which will return a Map of **ExperimentDetails** objects where the keys are the experiment in-code names.

These experiment details can tell you what the current variation is for each experiment, but it won’t give you the unique ids, just the in-code names.

The in-code names for the experiment and variation are the string values that you set when you registered these experiments in your Application class.
