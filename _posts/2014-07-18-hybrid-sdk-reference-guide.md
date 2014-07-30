---
layout: docs
title: "Artisan Javascript API"
author: "Artisan"
category: dev/js
description: "Javascript API Reference guide"
---

# Artisan Javascript API Reference Guide

This document provides an overview of all of the API calls available within the Artisan Javascript SDK.

## Table of Contents

<ul>
  <li><a href="#trackingapi">Tracking API</a>
    <ul>
      <li><a href="#trackEvent">trackEvent(eventName)</a></li>
      <li><a href="#trackEvent">trackEvent(eventName, parameters)</a></li>
    </ul>
  </li>
  <li><a href="#profileapi">Profile API</a>
    <ul>
      <li><a href="#setshareduserid">setSharedUserId(id)</a></li>
      <li><a href="#setuserage">setUserAge(age)</a></li>
      <li><a href="#setgender">setGender(gender)</a></li>
      <li><a href="#setstringvalue">setStringValue(variable, value)</a></li>
      <li><a href="#setlocationvalue">setLocationValue(variable, latitude, longitude)</a></li>
      <li><a href="#setDateTimeValue">setDateTimeValue(variable, value)</a></li>
      <li><a href="#clearProfile">clearProfile()</a></li>
    </ul>
  </li>
  <li><a href="#experimentapi">Experiment API</a>
    <ul>
      <li><a href="#iscurrentvariantforexperiment">isCurrentVariantForExperiment(variantName, experimentName)</a></li>
      <li><a href="#setexperimentviewedforexperiment">setExperimentViewedForExperiment(experimentName)</a></li>
      <li><a href="#setTargetReachedForExperiment">setTargetReachedForExperiment(experimentName)</a></li>
    </ul>
  </li>
  <li><a href="#powerhookapi">Power Hook API</a>
    <ul>
      <li><a href="#getvaluebyhookid">getValueForHookById(hookId)</a></li>
    </ul>
  </li>
  <li><a href="#purchaseworkflowapi">Purchase Workflow API</a>
    <ul>
      <li><a href="#additemtocart">addItemToCart(id, price, description, category, quantity, productInfo, priceLocale)</a></li>
      <li><a href="#cartcheckoutfailed">cartCheckoutFailed()</a></li>
      <li><a href="#cartcheckoutsucceeded">cartCheckoutSucceeded(shipping, tax)</a></li>
      <li><a href="#cartcheckoutwascancelled">cartCheckoutWasCancelled()</a></li>
      <li><a href="#cartisnotempty">cartIsNotEmpty()</a></li>
      <li><a href="#cartwasabandoned">cartWasAbandoned()</a></li>
      <li><a href="#emptycart">emptyCart()</a></li>
      <li><a href="#productviewed">productViewed(id, price, description, category, productInfo, priceLocale)</a></li>
      <li><a href="#removeitemfromcart">removeItemFromCart(id, price, description, category, quantity)</a></li>
    </ul>
  </li>
  <li><a href="#socialsharingapi">Social Sharing Manager</a>
    <ul>
      <li><a href="#shareonservicetype">shareOnServiceType(serviceType, wasSuccessful, metadata)</a></li>
    </ul>
  </li>
</ul>

<div id="trackingapi"></div>

## Tracking API

<div id="trackEvent"></div>

### trackEvent(eventName)<br>trackEvent(eventName, parameters)

#### Parameters

* eventName: (String) Name of the event to track.
* parameters: (Associative Array) Context parameters to tag to the event. [Optional]

Manually track an analytics event with the specified name.

Use the `parameters` parameter to supply additional context data in the form of key-value pairs. For instance, if you have a product page that you want to check, but you also want to be able to know which products are being viewed, you could track an event named "Viewed Product" and pass the product ID as additional data.

{% highlight javascript %}
ArtisanSDK.trackEvent("Logged In");
ArtisanSDK.trackEvent("Viewed Product", {'sku':'A0123456789'});
{% endhighlight %}


<div id="profileapi"></div>

## Profile API

<div id="setshareduserid"></div>

### setSharedUserId(id)

#### Parameters

* id: (String) Profile ID to associate with this user.

Use this method to connect the current user of this app with an ID in your user management system. For example, if your user management system has a user whose ID is 'ABC123456' and that user logs into this app, you can use this method to pass that ID to Artisan as part of the personalization profile for this user. You can then use this ID to trace the data collected by Artisan directly to an existing user in your system.

{% highlight javascript %}
ArtisanSDK.setSharedUserId("abc123");
{% endhighlight %}

<div id="setuserage"></div>

### setUserAge(age)

#### Parameters

* age: (Integer) Age value to associate with this user.

Specify the age for the current user.

This information is added to the personalization profile of the current user for segmentation, targeting, and reporting purposes.

This can be called from anywhere in your app.

{% highlight javascript %}
ArtisanSDK.setUserAge(21);
{% endhighlight %}

<div id="setgender"></div>

### setGender(gender)

#### Parameters

* gender: (String) Gender value to associate with this user. Valid values are `"male"`, `"female"`, and `"NA"`.

Specify the gender of the current user.

This information is added to the personalization profile of the current user for segmentation, targeting, and reporting purposes.

This can be called from anywhere in your app.

{% highlight javascript %}
ArtisanSDK.setGender("male");
{% endhighlight %}

<div id="setstringvalue"></div>

### setStringValue(variable, value)

#### Parameters

* variable: (String) Name of the profile variable to update.
* value: (String) New value to assign to the profile variable.

Set or update the value associated with a custom string profile variable.

This new value will be used as part of this user's personalization profile, and will be used from this point forward for segmentation, targeting, and reporting purposes.

This can be called from anywhere in your app.

{% highlight javascript %}
ArtisanSDK.setStringValue("Favorite Pet", "Dog");
{% endhighlight %}

<div id="setnumbervalue"></div>

### setNumberValue(variable, value)

Set or update the value associated with a custom number profile variable.

#### Parameters

* variable: (String) Name of the profile variable to update.
* value: (Integer or Float) New value to assign to the profile variable.

This new value will be used as part of this user's personalization profile, and will be used from this point forward for segmentation, targeting, and reporting purposes.

This can be called from anywhere in your app.

{% highlight javascript %}
ArtisanSDK.setNumberValue("Number of kids", 3);
{% endhighlight %}

<div id="setlocationvalue"></div>

### setLocationValue(variable, latitude, longitude)

Set or update the value associated with a custom location profile variable.

#### Parameters

* variable: (String) Name of the profile variable to update.
* latitude: (Float) Decimal latitude of location. (i.e. `39.9523`)
* longitude: (Float) Decimal longitude of location. (i.e. `-75.1637`)

This new value will be used as part of this user's personalization profile, and will be used from this point forward for segmentation, targeting, and reporting purposes.

This can be called from anywhere in your app.

{% highlight javascript %}
ArtisanSDK.setLocationValue("Last known location", 37.182, -5.938);
{% endhighlight %}

<div id="setdatetimevalue"></div>

### setDateTimeValue(variable, value)

#### Parameters

* variable: (String) Name of the profile variable to update.
* value: (String) OR (Date) New value to assign to the profile variable.  Must either be a Javascript Date object or a String in ISO8601 format (i.e. `"2015-06-26T16:22:10.000Z"`).

Set or update the value associated with a custom date profile variable.

This new value will be used as part of this user's personalization profile, and will be used from this point forward for segmentation, targeting, and reporting purposes.

This can be called from anywhere in your app.
{% highlight javascript %}
ArtisanSDK.setDateTimeValue("Last seen at", "2014-07-18T12:57:38Z");
{% endhighlight %}

<div id="clearprofile"></div>

### clearProfile()

Clear out all previously specified profile information.

Use this method to clear out all data previously specified for the current user, including any data set via setSharedUserId(id), setUserAge(age), setGender(gender), setStringValue(variable, value) et al.

This can be called from anywhere in your app.

{% highlight javascript %}
ArtisanSDK.clearProfile();
{% endhighlight %}

<div id="experimentapi"></div>

## Experiment API

<div id="iscurrentvariantforexperiment"></div>

### isCurrentVariantForExperiment(variantName, experimentName)

#### Parameters

* variableName: (String) Name of the variation (as originally registered via the 'addVariant()' call in the native container for this app.

* experimentName: (String) Name of the experiment (as originally registered via the `registerExperiment` call in the native container for this app).

Checks to see if the specified variant is currently running for the given experiment.  Use this in the condition of an `if` block to cordon off code that should only run when the 'A' or 'B' of an A/B test is running.

{% highlight javascript %}
if(ArtisanSDK.isCurrentVariantForExperiment("Green Variant", "Checkout Button Experiment")) {
  makeCheckoutButtonGreen();
};
{% endhighlight %}

<div id="setexperimentviewedforexperiment"></div>

### setExperimentViewedForExperiment(experimentName)

#### Parameters

* experimentName: (String) Name of the experiment (as originally registered via the `registerExperiment` call in the native container for this app).

Use this method to specify that your experiment has been viewed by the user. When this code is triggered, an experiment view officially begins. This experiment view counts as a conversion if setTargetReachedForExperiment(String) is called for this experiment before (a) setExperimentViewedForExperiment(String) gets called again for this experiment or (b) the app is backgrounded.

It is essential to call this method at least once for each experiment that you build to ensure that you will get an accurate conversion rate.

{% highlight javascript %}
ArtisanSDK.setExperimentViewedForExperiment("Checkout Button Experiment");
{% endhighlight %}

<div class="note note-hint">
  <p>Placement of this event is critical to creating useful and accurate analytics. Make sure this code fires ONLY when you deem that the user has encountered your experiment.</p>

  <p>Consider cases where this method is fired, then the target for this experiment is reached, which transitions back to the same code that originally triggered this method. The conversion rate would now be 50%, rather than 100%, since this method was called twice.</p>
</div>

<div id="settargetreachedforexperiment"></div>

### setTargetReachedForExperiment(experimentName)

#### Parameters

* experimentName: (String) Name of the experiment (as originally registered via the `registerExperiment` call in the native container for this app).

Use this method to specify what the conversion target should be for an in-code experiment. The conversion target is the end of your funnel - the action that this variant is trying to maximize.

The target set in code can be overridden by Artisan Tools as necessary. In these cases, the target will be tracked as an ordinary analytics event.

{% highlight javascript %}
ArtisanSDK.setTargetReachedForExperiment("Checkout Button Experiment", "Experiment to optimize checkout flow");
{% endhighlight %}

<div class="note note-hint">
  <p>If no target is specified for an experiment, your conversion rate for this test will default to zero percent. If more than one target is specified for an experiment, the target will be the first conversion event reported by a user device.</p>

  <p>Take care when calling this method to make sure that it only gets triggered when the user performs the intended action. For example, if it is possible for the user to navigate away from the target and back again, make sure this doesn't count as two conversions unless that is your intention.</p>
</div>

<div id="powerhookapi"></div>

## Power Hook API

<div id="getvaluebyhookid"></div>

### getValueForHookById(hookId)

#### Parameters

* hookId: (String) Name of the PowerHook whose value should be retrieved.

Gets the value of a Power Hook Variable. Use this method to get the value of a Power Hook Variable from Artisan. This will return the value specified in Artisan Tools, or the default value if none has been specified.  Returned value is a String.

{% highlight javascript %}
ArtisanSDK.getValueForHookById("hookId");
{% endhighlight %}

<div id="purchaseworkflowapi"></div>

## Purchase Workflow API

<div id="additemtocart"></div>

### addItemToCart(id, price, description, category, quantity, productInfo, priceLocale)

#### Parameters

* id: (String) ID (or SKU Number) for the item being added to the cart.

* price: (String) Price of the item. String value must be convertible to a float.

* description: (String) Description for the added item.

* category: (String) Product category for the item being added.

* quantity: (String) Number of items being added.  String value should be convertible to an integer.

* productInfo: (Associative Array) Key-value pairs to provide additional info and context about this item.

* priceLocale: (String) ISO 4217 currency code associated with the price (i.e. 'USD', 'GBP', 'EUR', etc.)

Add an item to the cart for the current purchase workflow.

{% highlight javascript %}
ArtisanSDK.addItemToCart("productId", 25.00, "A nice shirt", "WOMENS_APPAREL", 1, {'Size':'M'}, "USD");
{% endhighlight %}

<div id="cartcheckoutfailed"></div>

### cartCheckoutFailed()

Record that the checkout failed. An analytics event is triggered to record the failed transaction and the items in the cart at the time of the failure.

The items will remain in the cart so that another purchase can be completed. If you want to empty the cart you should use <a href="#emptyCart">emptyCart()</a>.

{% highlight javascript %}
ArtisanSDK.cartCheckoutFailed();
{% endhighlight %}

<div id="cartcheckoutsucceeded"></div>

### cartCheckoutSucceeded(shipping, tax)

#### Parameters

* shipping: (String) Cost of shipping the completed order.  String value should be convertable to a float.

* tax: (String) Cost of tax for the completed order.  String value should be convertable to a float.

Record that the cart was checked out successfully. We will record an analytics event including information on all of the products that were purchased.

We will automatically calculate the cart total and send that with the Artisan analytics event. It is assumed that all items in the cart will have the same currency; we will use the currency of the first item.

You may add shipping and tax information here and they will be recorded in the cart total. The amounts are assumed to be in the same currency as the items in the cart.

The cart will be emptied and reset after this.
{% highlight javascript %}
ArtisanSDK.cartCheckoutSucceeded(5.00, 7.00);
{% endhighlight %}

<div id="cartcheckoutwascancelled"></div>

### cartCheckoutWasCancelled()

Record that the checkout was cancelled by the customer.

The items will remain in the cart so that another purchase can be completed. If you want to empty the cart you should use <a href="#emptyCart">emptyCart()</a>.

{% highlight javascript %}
ArtisanSDK.cartCheckoutWasCancelled();
{% endhighlight %}

<div id="cartisnotempty"></div>

### cartIsNotEmpty()

Check if there are items in the cart model for this Artisan Purchase Workflow.  Returns a boolean.

{% highlight javascript %}
ArtisanSDK.cartIsNotEmpty();
{% endhighlight %}

<div id="cartwasabandoned"></div>

### cartWasAbandoned()

Record that the cart was abandoned.

The items will remain in the cart so that another purchase can be completed. If you want to empty the cart you should use <a href="#emptyCart">emptyCart()</a>.

{% highlight javascript %}
ArtisanSDK.cartWasAbandoned();
{% endhighlight %}

<div id="emptycart"></div>

### emptyCart()

Remove all items from the cart without marking it as abandoned or checked out.

{% highlight javascript %}
ArtisanSDK.emptyCart();
{% endhighlight %}

<div id="productviewed"></div>

### productViewed(id, price, description, category, quantity, productInfo, priceLocale)

#### Parameters

* id: (String) ID (or SKU Number) for the item being added to the cart.

* price: (String) Price of the item. String value must be convertible to a float.

* description: (String) Description for the added item.

* category: (String) Product category for the item being added.

* quantity: (String) Number of items being added.  String value should be convertible to an integer.

* productInfo: (Associative Array) Key-value pairs to provide additional info and context about this item.

* priceLocale: (String) ISO 4217 currency code associated with the price (i.e. 'USD', 'GBP', 'EUR', etc.)

Record an analytics event for a customer viewing a product.

{% highlight javascript %}
ArtisanSDK.productViewed("productId", 25.00, "A nice shirt", "T-Shirts", {'Fabric':'Cloth'}, "USD");
{% endhighlight %}

<div id="removeitemfromcart"></div>

### removeItemFromCart(id, price, description, category, quantity)

#### Parameters

* id: (String) ID (or SKU Number) for the item being added to the cart.

* price: (String) Price of the item. String value must be convertible to a float.

* description: (String) Description for the added item.

* category: (String) Product category for the item being added.

* quantity: (String) Number of items being added.  String value should be convertible to an integer.

Call this method to remove an item from the Artisan shopping cart model for the current purchase workflow.

It will remove the first item in the cart that matches the productIdentifier, price, and quantity.

{% highlight javascript %}
ArtisanSDK.removeItemFromCart("productId", 25.00, "A nice shirt", "T-Shirts", 1);
{% endhighlight %}

<div id="socialsharingapi"></div>

## Social Sharing API

<div id="shareonservicetype"></div>

### shareOnServiceType(serviceType, wasSuccessful, metadata)

#### Parameters

* serviceType: (String) Service used for this sharing event (i.e. 'FACEBOOK', 'TWITTER', 'FLICKR', etc.)

* wasSuccessful: (Boolean) or (String) Whether the share was successful.

* metadata: (Associative Array) Additional key-value metadata associated with this social share.

Record a social sharing event with Artisan.

{% highlight javascript %}
ArtisanSDK.shareOnServiceType("FLICKR", true, {'post-description':'Small album of wildlife photos'});
{% endhighlight %}
