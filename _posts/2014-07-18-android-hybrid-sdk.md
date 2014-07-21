---
layout: docs
title: "Artisan Javascript API"
author: "Artisan"
category: dev/android
description: "Javascript API for using Android SDK in WebViews"
---
# Profile Manager

### setSharedUserId
Use this method to connect the current user of this app with an ID in your user management system. For example, if your user management system has a user whose ID is 'ABC123456' and that user logs into this app, you can use this method to pass that ID to Artisan as part of the personalization profile for this user. You can then use this ID to trace the data collected by Artisan directly to an existing user in your system. 
{% highlight javascript %}
setSharedUserId("abc123");
{% endhighlight %}

### setUserAge
Specify the age for the current user.

This information is added to the personalization profile of the current user for segmentation, targeting, and reporting purposes. 

This can be called from anywhere in your app. 
{% highlight javascript %}
setUserAge("21");
{% endhighlight %}

### setGender
Specify the gender of the current user.

This information is added to the personalization profile of the current user for segmentation, targeting, and reporting purposes. 

This can be called from anywhere in your app. 
{% highlight javascript %}
setGender("Male");
{% endhighlight %}

### setStringValue
Set or update the value associated with a custom string profile variable.

This new value will be used as part of this user's personalization profile, and will be used from this point forward for segmentation, targeting, and reporting purposes.

This can be called from anywhere in your app. 
{% highlight javascript %}
setStringValue("Favorite Pet", "Dog");
{% endhighlight %}

### setNumberValue
Set or update the value associated with a custom number profile variable. 

This new value will be used as part of this user's personalization profile, and will be used from this point forward for segmentation, targeting, and reporting purposes. 

This can be called from anywhere in your app. 
{% highlight javascript %}
setNumberValue("Number of kids", "3");
{% endhighlight %}

### setLocationValue
Set or update the value associated with a custom location profile variable.

This new value will be used as part of this user's personalization profile, and will be used from this point forward for segmentation, targeting, and reporting purposes. 

This can be called from anywhere in your app. 
{% highlight javascript %}
setLocationValue("Last known location", "37.182, -5.938");
{% endhighlight %}

### setDateTimeValue
Set or update the value associated with a custom date profile variable.

This new value will be used as part of this user's personalization profile, and will be used from this point forward for segmentation, targeting, and reporting purposes. 

This can be called from anywhere in your app. 
{% highlight javascript %}
setDateTimeValue("Last seen at", "2014-07-18T12:57:38Z");
{% endhighlight %}

### clearProfile
Clear out all previously specified profile information.

Use this method to clear out all data previously specified for the current user, including any data set via setSharedUserId:, setUserAge:, setUserAddress:, setGender:, setUserAddress:, and setValue:forVariable:. 

This can be called from anywhere in your app. 
{% highlight javascript %}
clearProfile();
{% endhighlight %}

---

#Experiment Manager

### setExperimentViewedForExperiment
Use this method to specify that your experiment has been viewed by the user. When this code is triggered, an experiment view officially begins. This experiment view counts as a conversion if setTargetReachedForExperiment(String) is called for this experiment before (a) setExperimentViewedForExperiment(String) gets called again for this experiment or (b) the app is backgrounded.

It is essential to call this method at least once for each experiment that you build to ensure that you will get an accurate conversion rate.

**Warning**: Placement of this event is critical to creating useful and accurate analytics. Make sure this code fires ONLY when you deem that the user has encountered your experiment. Consider cases where this method is fired, then the target for this experiment is reached, which transitions back to the same code that originally triggered this method. The conversion rate would now be 50%, rather than 100%, since this method was called twice.
{% highlight javascript %}
setExperimentViewedForExperiment("Checkout Button Experiment");
{% endhighlight %}

### isCurrentVariantForExperiment
Check to see which variant is currently active.
{% highlight javascript %}
isCurrentVariantForExperiment("Green Variant", "Checkout Button Experiment");
{% endhighlight %}

### setTargetReachedForeExperiment
Use this method to specify what the conversion target should be for an in-code experiment. The conversion target is the end of your funnel - the action that this variant is trying to maximize.

The target set in code can be overridden by Artisan Tools as necessary. In these cases, the target will be tracked as an ordinary analytics event.

**Warning**: If no target is specified for an experiment, your conversion rate for this test will default to zero percent. If more than one target is specified for an experiment, the target will be the first conversion event reported by a user device.

**Warning**: Take care when calling this method to make sure that it only gets triggered when the user performs the intended action. For example, if it is possible for the user to navigate away from the target and back again, make sure this doesn't count as two conversions unless that is your intention.
{% highlight javascript %}
setTargetReachedForExperiment("Checkout Button Experiment", "Experiment to optimize checkout flow");
{% endhighlight %}

___

#PowerHook Manager

### getValueForHookById
Gets the value of a Power Hook Variable. Use this method to get the value of a Power Hook Variable from Artisan. This will return the value specified in Artisan Tools, or the default value if none has been specified. 
{% highlight javascript %}
getValueForHookById("hookId");
{% endhighlight %}


---

#Purchase Workflow Manager

### addItemToCart
Add an item to the cart for the current purchase workflow.
{% highlight javascript %}
addItemToCart("productId", "25.00", "A nice shirt", "T-Shirts", "1", "{'Fabric':'Cloth'}", "USD");
{% endhighlight %}

### cartCheckoutFailed
Record that the checkout failed.

The items will remain in the cart so that another purchase can be completed. If you want to empty the cart you should use ArtisanPurchaseWorkflowManager#emptyCart()
{% highlight javascript %}
cartCheckoutFailed();
{% endhighlight %}

### cartCheckoutSucceeded
Record that the cart was checked out successfully. We will record an analytics event including information on all of the products that were purchased.

We will automatically calculate the cart total and send that with the Artisan analytics event. It is assumed that all items in the cart will have the same currency; we will use the currency of the first item.

You may add shipping and tax information here and they will be recorded in the cart total. The amounts are assumed to be in the same currency as the items in the cart.

The cart will be emptied and reset after this.
{% highlight javascript %}
cartCheckoutSucceeded("5.00", "7.00");
{% endhighlight %}

### cartCheckoutWasCancelled
Record that the checkout was cancelled by the customer.

The items will remain in the cart so that another purchase can be completed. If you want to empty the cart you should use ArtisanPurchaseWorkflowManager#emptyCart()
{% highlight javascript %}
cartCheckoutWasCancelled();
{% endhighlight %}

### cartIsNotEmpty
Check if there are items in the cart model for this Artisan Purchase Workflow.
{% highlight javascript %}
cartIsNotEmpty();
{% endhighlight %}

### cartWasAbandoned
Record that the cart was abandoned.

The items will remain in the cart so that another purchase can be completed. If you want to empty the cart you should use ArtisanPurchaseWorkflowManager#emptyCart()
{% highlight javascript %}
cartWasAbandoned();
{% endhighlight %}

### emptyCart
Remove all items from the cart without marking it as abandoned or checked out.
{% highlight javascript %}
emptyCart();
{% endhighlight %}

### getPurchaseWorkflowManagerInstance
Use the static methods on this class rather than this instance.
{% highlight javascript %}
getPurchaseWorkflowManagerInstance();
{% endhighlight %}

### productViewed
Record an analytics event for a customer viewing a product. Uses the Currency.getInstance(Locale.getDefault()) by default for the priceLocale.
{% highlight javascript %}
productViewed("productId", "25.00", "A nice shirt", "T-Shirts", "{'Fabric':'Cloth'}", "USD");
{% endhighlight %}

### removeItemFromCart
Call this method to remove an item from the Artisan cart model for the current purchase workflow.

It will remove the first item in the cart that matches the productIdentifier, price, description and quantity.
{% highlight javascript %}
removeItemFromCart("productId", "25.00", "A nice shirt", "T-Shirts", "1");
{% endhighlight %}

---

#Social Sharing Manager

### shareOnServiceType
Record a social sharing event with Artisan.
{% highlight javascript %}
shareOnServiceType("Flickr", "true", "{'post-description':'Small album of wildlife photos'}");
{% endhighlight %}



