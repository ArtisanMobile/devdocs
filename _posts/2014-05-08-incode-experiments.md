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
  <li><a href="#register">Register Experiment</a></li>
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
  ...
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

<div class="note note-important">
  <p>Important: If the experiment is not running the default variant will be selected.</p>
</div>

Call the method **setExperimentViewedForExperiment(String experimentName)** to mark the experiment has been viewed for the current user session. This call should be made at the location within the code where you want to mark the experiment as viewed.

Use the method **isCurrentVariantForExperiment(String variantName, String experimentName)** to determine which experiment variation is active.

{% highlight java %}
ArtisanExperimentManager.setExperimentViewedForExperiment("Buy Button Test");

if (ArtisanExperimentManager.isCurrentVariantForExperiment("button says add to cart", "Buy Button Test")) {
  textView.setText("Add to Cart");
} else if (ArtisanExperimentManager.isCurrentVariantForExperiment("button says buy now", "Buy Button Test")) {
  textView.setText("Buy Now!");
}
{% endhighlight %}

<div class="note note-hint">
  <p>Hint: The logic for choosing the variant should generally be in the <strong>onResume</strong> method of your Activity or in a location where the code will be exercised each time the screen is displayed.  This is necessary so the test can be turned on and off without requiring the rebuilding of the screen.</p>
</div>

To set the goal of an in-code experiment you call the **setTargetReachedForExperiment(String experimentName)** method.  This call should be made at the location within the code where you want to mark the goal as achieved.

{% highlight java %}
ArtisanExperimentManager.setTargetReachedForExperiment("Buy Button Test");
{% endhighlight %}
