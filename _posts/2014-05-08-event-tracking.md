---
layout: docs
title: "Event Tracking"
author: "Artisan"
category: dev/android
description: "Event tracking with the Artisan Android SDK"
---

#Event Tracking

Artisan automatically collects analytics events for every user, session and page views. There's nothing you need to add to your app to capture those events. To capture other analytics events like taps and other user interactions we have the ArtisanTrackingManager class in our API.

<ul>
  <li><a href="#trackevent">Track Event</a></li>
  <li><a href="#commerce">Purchase Workflow Tracking</a></li>
  <li><a href="#social">Social Event Tracking</a></li>
</ul>

<div id="trackevent"></div>

##Track Event

ArtisanTrackingManager manages all in-code custom analytics tracking designed for use with Artisan.

The **trackEvent:** method with optional parameters allows you to track an event by name.

{% highlight java %}
ArtisanTrackingManager.trackEvent("Product Purchased");
{% endhighlight %}

with an optional dictionary of name/value pairs.

{% highlight java %}
Map<String, String> parameters = new HashMap<String, String>();
parameters.put("sku", "A0123456789");
parameters.put("product name", "Artisan Developer T-Shirt");
ArtisanTrackingManager.trackEvent("Product Purchased", parameters);
{% endhighlight %}

### Tracking Categories

Along with tracking custom parameters for your events, ArtisanTrackingManager also allows you to associate a hierarchy of categories with your events. You can then view and filter these category values via the events report on Artisan Tools.

The **trackEvent** method with optional parameters, category, subCategory, and subSubCategory allows you to track your category hierarchy per event.

{% highlight java %}
Map<String, String> parameters = new HashMap<String, String>();
// Track without extra parameters (include an empty Map)
ArtisanTrackingManager.trackEvent("User Tapped In-App Coupon", parameters, "Men");
ArtisanTrackingManager.trackEvent("User Tapped In-App Coupon", parameters, "Men", "Shoes");
ArtisanTrackingManager.trackEvent("User Tapped In-App Coupon", parameters, "Men", "Shoes", "Vans");

// Track with extra parameters
parameters.put("coupon code", "B012345");
ArtisanTrackingManager.trackEvent("User Tapped In-App Coupon", parameters, "Men");
ArtisanTrackingManager.trackEvent("User Tapped In-App Coupon", parameters, "Men", "Shoes");
ArtisanTrackingManager.trackEvent("User Tapped In-App Coupon", parameters, "Men", "Shoes", "Vans");
{% endhighlight %}


<div id="commerce"></div>

##Purchase Workflow Tracking

As an extension to our custom event tracking with the Artisan SDK we also provide analytics tracking specific to purchase workflows in your application.

These analytics events are automatically synced with Artisan and can be used for advanced segmentation and personalization with the Artisan analytics reports, experiments, power hooks and campaigns.

The ArtisanPurchaseWorkflowManager manages all analytics tracking related to purchases. This includes recording Artisan analytics events for:

<ul>
<li>when items are viewed by the customer</li>
<li>when items are added or removed from the customer’s cart</li>
<li>when the cart is abandoned (user left the app without checking out)</li>
<li>when the customer checks out successfully or unsuccessfully</li>
<li>when the customer cancels checkout</li>
</ul>

#### Product Viewed

Here's how you can record an analytics event for a customer viewing a product.

Tracking category hierarchies applies here as well by passing the optional **category**, **subCategory**, and **subSubCategory** parameters to the **productViewed** method.

There are many variations of the **productViewed** method so [please consult the ArtisanPurchaseWorkflowManager javadocs](http://docs.useartisan.com/dev/android/javadocs/) for your current version.

{% highlight java %}
Map<String, String> productInfo = new HashMap<String, String>();
 productInfo.put("style", "organic cotton");
 productInfo.put("size", "medium");
 Currency usCurrency = Currency.getInstance(Locale.US);
 ArtisanPurchaseWorkflowManager.productViewed("ABC0000001", 24.99f, usCurrency, "Artisan T-Shirt made in Old City, Philadelphia", "Men", "Clothes", "T-Shirts", productInfo);
{% endhighlight %}

<div class="note note-hint">
<p>If you don't include a currency, we will use <strong>Currency.getInstance(Locale.getDefault())</strong> by default, which may not be what you expect.</p>
</div>

The optional product info can include any key/value pairs of information about this product. This data will be attached to the analytics event in Artisan.

#### Adding and Removing Products

When a product is added to your cart model you can track this event with Artisan by calling **addItemToCart**

Tracking category hierarchies applies here as well by passing the optional **category**, **subCategory**, and **subSubCategory** parameters to the **addItemToCart** method.

There are many variations of the **addToCartMethod** method so [please consult the ArtisanPurchaseWorkflowManager javadocs](http://docs.useartisan.com/dev/android/javadocs/) for your current version.

{% highlight java %}
 Map<String, String> extraInfo = new HashMap<String, String>();
 extraInfo.put("style", "organic cotton");
 extraInfo.put("size", "medium");
 Currency usCurrency = Currency.getInstance(Locale.US);
 ArtisanPurchaseWorkflowManager.addItemToCart("ABC0000001", 24.99f, usCurrency, "Artisan T-Shirt made in Old City, Philadelphia", "Men", "Clothes", "T-Shirts", 1, extraInfo);
{% endhighlight %}

When adding products to the cart, the locale, category, subCategory, and subSubCategory and any additional product info are optional. The identifier, price, description and quantity are used to uniquely identify the product in the Artisan model for the cart. This makes it possible to also remove items from the cart:

{% highlight java %}
 ArtisanPurchaseWorkflowManager.removeItemFromCart("ABC0000001", 24.99f, "Artisan T-Shirt made in Old City, Philadelphia", 1);
{% endhighlight %}

It will remove the first item in the cart that matches the productIdentifier, price, description and quantity.

At any time you can check on the Artisan Purchase Workflow cart model to see if we still have items in the cart with **cartIsEmpty** which will return true if there are no items in the cart. You can also empty the cart for this Purchase Workflow with **emptyCart**.

{% highlight java %}
if (!ArtisanPurchaseWorkflowManager.cartIsEmpty()) {
    ArtisanPurchaseWorkflowManager.emptyCart();
}
{% endhighlight %}

#### Purchase Workflow Outcomes

After items have been added to the cart your might have one of several outcomes: the cart could be checked out or abandoned or the payment might fail or be cancelled. Artisan provides methods for each of these.

For cart abandonment, or checkout failed or cancelled the items will remain in the cart so that another purchase can be completed. If you want to empty the cart you should use **ArtisanPurchaseWorkflowManager.emptyCart()**.

{% highlight java %}
// cart abandoned
ArtisanPurchaseWorkflowManager.cartWasAbandoned();

// cart checkout cancelled
ArtisanPurchaseWorkflowManager.cartCheckoutWasCancelled();

// cart checkout failed
ArtisanPurchaseWorkflowManager.cartCheckoutFailed();
{% endhighlight %}

In the event of a successful checkout record this outcome with **ArtisanPurchaseWorkflowManager.cartCheckoutSucceededWithShippingAndTax** and optionally provide amounts for shipping and tax to be added to the order total that will be recorded with the analytics event for this purchase. The amounts for shipping and tax are assumed to be in the same currency as the items in the cart.

{% highlight java %}
ArtisanPurchaseWorkflowManager.cartCheckoutSucceededWithShippingAndTax(2.25f, 3.00f);
{% endhighlight %}

We will record an analytics event including information on all of the products that were purchased. We will automatically calculate the cart total and send that with the Artisan analytics event. It is assumed that all items in the cart will have the same currency; we will use the currency of the first item.

After a successful checkout the cart will automatically be emptied. The Purchase Workflow Manager is then automatically ready to track the next workflow.

<div id="social"></div>

##Social Event Tracking

As an extension to our automatic and custom event tracking with the Artisan SDK we also provide analytics tracking specific to social sharing.

These analytics events are automatically synced with Artisan and can be used for advanced segmentation and personalization with the Artisan analytics reports, experiments, power hooks and campaigns.

The ArtisanSocialSharingManager manages all analytics tracking related to social share events. This includes recording Artisan analytics events for each share to a social network along with any additional information that you would like to track.

Here's how you can record a social sharing event:

{% highlight java %}
// record successful share
ArtisanSocialSharingManager.shareOnServiceType("Flickr", true);

// record attempted share that failed.
ArtisanSocialSharingManager.shareOnServiceType("Flickr", false);
{% endhighlight %}

Optionally, you can include metadata, a dictionary of key value pairs containing any additional information that you would like to record for this social event. All keys and values must be NSString objects, or they will be ignored.

{% highlight java %}
Map<String, String> metadata = new HashMap<String, String>();
metadata.put("post-description", postDescription);
ArtisanSocialSharingManager.shareOnServiceType("Flickr", true, metadata);
{% endhighlight %}
