---
layout: docs
title: "Power Hooks"
author: "Artisan"
category: dev/android
description: "Power Hooks with the Artisan Android SDK"
---

#Power Hooks

Power Hooks are key-value pairs or code blocks with key-value arguments that are passed into your application code by Artisan when your app starts, allowing for settings, text, and logic to be modified on the fly for all user devices without revisioning or updating your application.

All hooks are created using ARPowerHookManager are automatically registered with the Artisan platform when you connect your device to for the first time. The registration process will detect all registered hook keys, and will display all of the hook variables and code blocks for this app in Artisan where they can be edited. Values set on hooks on the web will automatically be downloaded by all devices upon app startup, allowing for their usage throughout your system code.

<ul>
  <li><a href="#register">Register Power Hook</a></li>
  <li><a href="#getvalue">Get Power Hook Value</a></li>
  <li><a href="#code-blocks">Code Blocks</a></li>
  <li><a href="#callbacks">Callbacks</a></li>
  <li><a href="#preview-mode">Preview Mode</a></li>
</ul>

<div id="register"></div>

##Register Power Hook

Use the method **registerVariable(String hookId, String friendlyName, String defaultValue)** to declare the existence of a Power Hook you would like to pass in from Artisan.

{% highlight java %}
@Override
public void registerPowerhooks() {
  PowerHookManager.registerVariable("addToCartButton", "Add To Cart Button Text", "Buy Now");
  ...
}
{% endhighlight %}

<div class="note note-important">
  <p>Important:
This declaration should occur in the <strong>registerPowerhooks</strong> method of your Application class.</p>
</div>

<div id="getvalue"></div>

##Get Power Hook Value

The method **getVariableValue** retrieves the value of a Power Hook from Artisan.  This will return the value specified in the Artisan platform, or the default value if none has been specified.

{% highlight java %}
String myPowerHookValue = PowerHookManager.getVariableValue("sampleButtonText")
{% endhighlight %}

A good place to retrieve this value is in the onResume or onStart method of your Activity so that you always have the latest value when your Activity is visible.

Here's a sample of setting the button text using a Power Hook variable:

{% highlight java %}
@Override
protected void onResume() {
  Button sample_button = (Button) findViewById(R.id.SampleButton);
  sample_button.setText(PowerHookManager.getVariableValue("sampleButtonText"));
}
{% endhighlight %}

<div class="note note-important">
  <p>NOTE: If you request the value for this Power Hook Variable in your first Activity's onCreate method, before the Artisan Service has a chance to start up, you may get the default value in return. The Artisan Service is started up at the time your first activity is created, and should be ready by the time your first activity gets to onResume. For the rest of your application's lifecycle you can assume that Power Hooks will work as expected.</p>
</div>

<div class="note note-hint">
  <p>HINT: Each time your code passes over a <strong>getVariableValue</strong> method call the most recently downloaded value to the user's device will be referenced.  If you do not want the value to change during the life-cycle of the object you can assign the value to a variable.</p>
</div>

<div id="code-blocks"></div>

##Code Blocks

Power Hook code blocks can be used for referencing code that can be executed conditionally. Examples are displaying a modal popup to remind the user to perform certain actions in the app, managing the logic for applying a discount code, or displaying a survey to a segment of users.

Use this method to declare the existence of a code block you would like to use in your app with data that is configurable from Artisan.

This declaration should occur in the **registerPowerhooks** method of your Application class.

* **blockId** - The name of the block to register. Name must be unique for this app.
* **friendlyName** - The name for this code block that will be displayed in Artisan Tools.
* **defaultData** - The default data for this code block. This should be string keys and values. This data will be used if no data is passed in from Artisan Tools for this code block for this app.
* **block** - The block of code executed when executeBlock is called.

{% highlight java %}
@Override
public void registerPowerhooks() {
  ...
  HashMap<String, String> defaultData = new HashMap<String, String>();
  defaultData.put("discountCode", "012345ABC");
  defaultData.put("discountAmount", "25%");
  defaultData.put("shouldDisplay", "true");

  PowerHookManager.registerBlock("showAlert", "Show Alert Block", defaultData, new ArtisanBlock() {
    @Override
    public void execute(Map<String, String> data, Map<String, Object> extraData) {
      if ("true".equalsIgnoreCase(data.get("shouldDisplay"))) {
        StringBuilder message = new StringBuilder();
        if (extraData.get("productName") != null) {
          message.append("Buy another ");
          message.append(data.get("productName"));
          message.append(" for a friend! ");
        }
        message.append("Use discount code ");
        message.append(data.get("discountCode"));
        message.append(" to get ");
        message.append(data.get("discountAmount"));
        message.append(" off your next purchase!");
        Toast.makeText((Context) extraData.get("context"), message, Toast.LENGTH_LONG).show();
      }
    }
  });
}
{% endhighlight %}

<div class="note note-hint">
  <p>Hint: The ArtisanBlock execute method takes in two Maps. The <strong>data</strong> Map will include either the default data that you passed in when you registered, or updated data from Artisan. The Map <strong>extraData</strong> is data that you will pass in when you call executeBlock. This is often used to pass in an Android Context, like in the example below. Although, extraData can also be used to pass in any information that is relevant from wherever this block will be exectued, like the optional productName variable in the example below.</p>
</div>

Use the method **executeBlock(String blockId)** or **executeBlock(String blockId, Map&lt;String, Object&gt; extraData)** to execute a Power Hook code block from Artisan. The code block will use the values specified in the data parameter registered in ArtisanTools.com to execute the block. You can override the default data using ArtisanTools.com.

* **blockId** - The name of the code to register. Name must be unique for this app.
* **extraData** - Additional data to use when executing this block. If you need a context to execute your block, you can pass one in here.

Sample usage of a Power Hook Block (from the onClick handler for an add to cart button):

{% highlight java %}
Map<String, Object> extraData = new HashMap<String, Object>();
extraData.put("productName", "Artisan Andy Plush Toy");
extraData.put("context", this);
PowerHookManager.executeBlock("showAlert", extraData);
{% endhighlight %}

<div class="note note-important">
  <p>NOTE: If you execute this Power Hook Block in your first Activity's onCreate method, before the Artisan Service has a chance to start up, the call may be ignored. The Artisan Service is started up at the time your first activity is created, and should be ready by the time your first activity gets to onResume. For the rest of your application's lifecycle you can assume that Power Hooks will work as expected.</p>
</div>

<div id="callbacks"></div>

##Callbacks

Artisan allows you to <a href="/dev/android/callbacks/#power-hooks">register callbacks</a> for when an individual power hook changes or when any power hook changes.

<div id="preview-mode"></div>

##Preview Mode

<div class="note note-important">
  <p>Preview Mode is not yet supported for the Android SDK, but it is coming soon!</p>
</div>

When making changes to Power Hook values you can preview the look and behavior of your application with the new values by clicking on the gear <img src="/images/gear-icon.png" /> and selecting "Preview".

### Preview from the Power Hook Page

You can preview the default, current and draft values for your app's Power Hooks.

<img src="/images/preview-mode-power-hook-page.png"/>

### Preview from any Power Hook Experiment

You can preview any variation of your experiment.

<img src="/images/preview-mode-experiment-preview.png"/>
