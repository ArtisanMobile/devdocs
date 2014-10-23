---
layout: docs
title: "Event Tracking"
author: "Artisan"
category: dev/ios
description: "Event tracking with the Artisan iOS SDK"
---
#Event Tracking

Artisan automatically collects analytics events for every user, session, page view, tap and other user interactions. There's nothing you need to add to your app to capture those events. But, there are times when you want to capture an event that doesn't correspond directly to a tap or navigation, or maybe you want to capture more information with a particular tap or event. To capture these custom analytics events we have the ARTrackingManager class in our API.

<ul>
  <li><a href="#trackevent">Track Event</a></li>
  <li><a href="#nameviewcontroller">Naming View Controllers</a></li>
  <li><a href="#nameview">Naming Views</a></li>
  <li><a href="#commerce">Purchase Workflow Tracking</a></li>
  <li><a href="#social">Social Event Tracking</a></li>
</ul>

<div id="trackevent"></div>

##Track Event

ARTrackingManager manages all in-code custom analytics tracking designed for use with Artisan.

The **trackEvent:** and **trackEvent:parameters** methods allow you to track an event by name.

{% highlight objective-c %}
// Objective-C

[ARTrackingManager trackEvent:@"itemsInCartAreNowOutofStock"];
{% endhighlight %}

{% highlight swift %}
// Swift

ARTrackingManager.trackEvent("itemsInCartAreNowOutofStock")
{% endhighlight %}

with an optional dictionary of name/value pairs.

{% highlight objective-c %}
// Objective-C

[ARTrackingManager trackEvent:@"itemsInCartAreNowOutofStock" parameters:@{@"numberOfItems":@"2"}];
{% endhighlight %}

{% highlight swift %}
// Swift

ARTrackingManager.trackEvent("itemsInCartAreNowOutofStock", parameters:["numberOfItems":"2"])
{% endhighlight %}

### Tracking Categories

Along with tracking custom parameters for your events, ARTrackingManager also allows you to associate a hierarchy of categories with your events. You can then view and filter these category values via the events report on Artisan Tools.

The **trackEvent:parameters:category:**, **trackEvent:parameters:category:subCategory:**, **trackEvent:parameters:category:subCategory:subSubCategory:**, **trackEvent:category:**, **trackEvent:category:subCategory:**, and **trackEvent:category:subCategory:subSubCategory** methods allow you to track your category hierarchy per event.

With extra parameters

{% highlight objective-c %}
// Objective-C
[ARTrackingManager trackEvent:@"User Tapped In-App Coupon"
  parameters:@{@"coupon-code":@"B012345"}
                     category:@"Men"];

[ARTrackingManager trackEvent:@"User Tapped In-App Coupon"
  parameters:@{@"coupon-code":@"B012345"}
                     category:@"Men"
                   ubCategory:@"Shoes"];

[ARTrackingManager trackEvent:@"User Tapped In-App Coupon"
  parameters:@{@"coupon-code":@"B012345"}
                     category:@"Men"
                  subCategory:@"Shoes"
               subSubCategory:@"Vans"];
{% endhighlight %}

{% highlight swift %}
// Swift
ARTrackingManager.trackEvent("User Tapped In-App Coupon", parameters:["coupon-code":"B012345"], category:"Men")
ARTrackingManager.trackEvent("User Tapped In-App Coupon", parameters:["coupon-code":"B012345"], category:"Men", subCategory:@"Shoes")
ARTrackingManager.trackEvent("User Tapped In-App Coupon", parameters:["coupon-code":"B012345"], category:"Men", subCategory:@"Shoes", subSubCategory:@"Vans")
{% endhighlight %}

Without extra parameters

{% highlight objective-c %}
// Objective-C
[ARTrackingManager trackEvent:@"User Tapped In-App Coupon"
                     category:@"Men"];

[ARTrackingManager trackEvent:@"User Tapped In-App Coupon"
                     category:@"Men"
                  subCategory:@"Shoes"];

[ARTrackingManager trackEvent:@"User Tapped In-App Coupon"
                     category:@"Men"
                  subCategory:@"Shoes"
               subSubCategory:@"Vans"];
{% endhighlight %}

{% highlight swift %}
// Swift
ARTrackingManager.trackEvent("User Tapped In-App Coupon", category:"Men")
ARTrackingManager.trackEvent("User Tapped In-App Coupon", category:"Men", subCategory:@"Shoes")
ARTrackingManager.trackEvent("User Tapped In-App Coupon", category:"Men", subCategory:@"Shoes", subSubCategory:@"Vans")
{% endhighlight %}

<div id="nameviewcontroller"></div>

##Naming View Controllers
The Artisan SDK adds the property artisanNameTag to all UIViewController classes through the use of an Objective-C category.

If the artisanNameTag property is assigned the Artisan platform will use the artisanNameTag instead of the generated name when displaying the view controller while building an experiment and in analytic reports.

{% highlight objective-c %}
// Objective-C

self.artisanNameTag = @"Login Screen";
{% endhighlight %}

{% highlight swift %}
// Swift

self.artisanNameTag = "Login Screen"
{% endhighlight %}

<div id="nameview"></div>

##Naming Views
Each UIView class contains the Apple property \'tag\' allowing you to uniquely identify a view with an NSInteger value.  The Artisan SDK adds the property artisanNameTag to all UIView classes through the use if an Objective-C category.

If the artisanNameTag property is assigned the Artisan platform will use the artisanNameTag instead of the generated name for the view as it appears in the Artisan Canvas and in analytic reports.

{% highlight objective-c %}
// Objective-C

button = [UIButton buttonWithType:UIButtonTypeCustom];
button.artisanNameTag = @"Add Button";

[self.view addSubview:button];
{% endhighlight %}

{% highlight swift %}
// Swift

let button = UIButton.buttonWithType(UIButtonTypeCustom)
button.artisanNameTag = "Add Button"

self.view.addSubView(button)
{% endhighlight %}

<div class="note note-hint">
  <p>Hint: Using a unique artisanNameTag for UIViews enables the targeting of specific UI changes made with the Artisan Canvas.  This works well for dynamic views that may or may not appear every time a particular screen is displayed.</p>
</div>


<div id="commerce"></div>

##Purchase Workflow Tracking

As an extension to our automatic and custom event tracking with the Artisan SDK we also provide analytics tracking specific to purchase workflows in your application.

These analytics events are automatically synced with Artisan and can be used for advanced segmentation and personalization with the Artisan analytics reports, experiments, power hooks and campaigns.

###Automatic Tracking of StoreKit purchases

If your app includes StoreKit products these purchases can be automatically tracked with Artisan. To enable this automatic purchase tracking you need to initialize the **ARStoreKitTracker**.

This should be called in the **ProductRequest:didReceiveResponse:** method that gets called after you start your **SKProductsRequest**. You pass in the products that are contained in the response (response.products).

This is an example of what this will look like in your app:

{% highlight objective-c %}
// Objective-C

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
  [ARStoreKitTracker initWithSKProducts:response.products];

  // The rest of your handling for the product request...
}
{% endhighlight %}

This will automatically generate analytics events for purchases and whether they succeeded or failed. You can call this method more than once depending on how you’ve implemented Store Kit in your app. If you send a product a second time the new version of the product will be used for analytics reporting.

###Purchase Workflow API for non-StoreKit purchases

The ARPurchaseWorkflowManager manages all analytics tracking related to non-StoreKit purchases. This includes recording Artisan analytics events for:

<ul>
<li>when items are viewed by the customer</li>
<li>when items are added or removed from the customer’s cart</li>
<li>when the cart is abandoned (user left the app without checking out)</li>
<li>when the customer checks out successfully or unsuccessfully</li>
<li>when the customer cancels checkout</li>
</ul>

#### Product Viewed

Here's how you can record an analytics event for a customer viewing a product.

You can include an optional currency code to track different currencies and an additional dictionary of product info.

Tracking category hierarchies applies here as well by using the **:andSubCategory** and **:andSubCategory:andSubSubCategory** variations of the **productViewed...** method.

The optional product info can be any key/value pairs of information about this product. This data will be attached to the analytics event in Artisan. All keys and values must be NSString objects, or they will be ignored.

There are many variations of the **productViewed...** method so [please consult the ARPurchaseWorkflowManager Appledocs](http://docs.useartisan.com/dev/ios/appledocs/) for your current version.

{% highlight objective-c %}
// Objective-C

[ARPurchaseWorkflowManager productViewedWithProductIdentifier:@"ABC0000001"
                                                      atPrice:[NSNumber numberWithFloat:24.99f]
                                             withCurrencyCode:@"USD"
                                               andDescription:@"Artisan T-Shirt made in Old City, Philadelphia"
                                                  andCategory:@"Mens"
                                               andSubCategory:@"Clothes"
                                            andSubSubCategory:@"T-Shirts"
                                              withProductInfo:@{@"style":@"organic cotton",@"size":@"medium"}];
{% endhighlight %}

{% highlight swift %}
// Swift

ARPurchaseWorkflowManager.productViewedWithProductIdentifier("ABC0000001",
                                                    atPrice: 24.99,
                                           withCurrencyCode: "USD",
                                             andDescription: "Artisan T-Shirt made in Old City, Philadelphia",
                                                andCategory: "Men",
                                             andSubCategory: "Clothes",
                                          andSubSubCategory: "T-Shirts",
                                            withProductInfo: ["style":"organic cotton", "sizez":"medium"])
{% endhighlight %}

#### Adding and Removing Products

When a product is added to your cart model you can track this event with Artisan by calling **ARPurchaseWorkflowManager addItemToCart...**

Tracking category hierarchies applies here as well by using the **:andSubCategory** and **:andSubCategory:andSubSubCategory** variations of the **addItemToCart...** method.

There are many variations of the **addItemToCart...** method so [please consult the ARPurchaseWorkflowManager Appledocs](docs.useartisan.com/dev/ios/appledocs/) for your current version.

{% highlight objective-c %}
// Objective-C

[ARPurchaseWorkflowManager addItemToCartWithProductIdentifier:@"ABC0000001"
                                                      atPrice:[NSNumber numberWithFloat:24.99f]
                                             withCurrencyCode:@"USD"
                                               andDescription:@"Artisan T-Shirt made in Old City, Philadelphia"
                                                  andCategory:@"Men"
                                               andSubCategory:@"Clothes"
                                            andSubSubCategory:@"T-Shirts"
                                                  andQuantity:[NSNumber numberWithInt:1]
                                              withProductInfo:@{ @"style":@"organic cotton", @"size":@"medium" }];
{% endhighlight %}

{% highlight swift %}
// Swift

ARPurchaseWorkflowManager.addItemToCartWithProductIdentifier("ABC0000001",
                                                    atPrice: 24.99,
                                           withCurrencyCode: "USD",
                                             andDescription: "Artisan T-Shirt made in Old City, Philadelphia",
                                                andCategory: "Men",
                                             andSubCategory: "Clothes"
                                          andSubSubCategory: "T-Shirts"
                                                 andQuanity: 1,
                                            withProductInfo: ["style":"organic cotton", "size":"medium"])
{% endhighlight %}

When adding products to the cart, the currency, category and additional product info are optional. The identifier, price, description and quantity are used to uniquely identify the product in the Artisan model for the cart. This makes it possible to also remove items from the cart:

{% highlight objective-c %}
// Objective-C

[ARPurchaseWorkflowManager removeItemFromCartWithProductIdentifier:@"ABC0000001"
                                                           atPrice:[NSNumber numberWithFloat:24.99f]
                                                    andDescription:@"Artisan T-Shirt made in Old City, Philadelphia"
                                                        andQuantity:[NSNumber numberWithInt:1]];
{% endhighlight %}

{% highlight swift %}
// Swift

ARPurchaseWorkflowManager.removeItemFromCartWithProductIdentifier("ABC0000001",
                                                         atPrice: 24.99,
                                                  andDescription: "Artisan T-Shirt made in Old City, Philadelphia",
                                                      andQuanity: 1)
{% endhighlight %}

It will remove the first item in the cart that matches the productIdentifier, price, description and quantity.

At any time you can check on the Artisan Purchase Workflow cart model to see if we still have items in the cart with **cartIsNotEmpty** from **ARPurchaseWorkflowManager** which will return true if there are items in the cart. You can also empty the cart for this Purchase Workflow with  **emptyCart** from **ARPurchaseWorkflowManager**.

{% highlight objective-c %}
// Objective-C

if ([ARPurchaseWorkflowManager cartIsNotEmpty])
{
    [ARPurchaseWorkflowManager emptyCart];
}
{% endhighlight %}

{% highlight swift %}
// Swift

if ARPurchaseWorkflowManager.cartIsNotEmpty() {
    ARPurchaseWorkflowManager.emptyCart()
}
{% endhighlight %}

#### Purchase Workflow Outcomes

After items have been added to the cart your might have one of several outcomes: the cart could be checked out or abandoned or the payment might fail or be cancelled. Artisan provides methods for each of these.

For cart abandonment, or checkout failed or cancelled the items will remain in the cart so that another purchase can be completed. If you want to empty the cart you should use **emptyCart** from **ARPurchaseWorkflowManager**.

{% highlight objective-c %}
// Objective-C

// cart abandoned
[ARPurchaseWorkflowManager cartWasAbandoned];

// cart checkout cancelled
[ARPurchaseWorkflowManager cartCheckoutWasCancelled];

// cart checkout failed
[ARPurchaseWorkflowManager cartCheckoutFailed];
{% endhighlight %}

{% highlight swift %}
// Swift

// cart abandoned
ARPurchaseWorkflowManager.cartWasAbandoned()

// cart checkout cancelled
ARPurchaseWorkflowManager.cartCheckoutWasCancelled()

// cart checkout failed
ARPurchaseWorkflowManager.cartCheckoutFailed()
{% endhighlight %}

In the event of a successful checkout record this outcome with **cartCheckoutSucceededWithShipping:withTax:** and optionally provide amounts for shipping and tax to be added to the order total that will be recorded with the analytics event for this purchase. The amounts for shipping and tax are assumed to be in the same currency as the items in the cart.

{% highlight objective-c %}
// Objective-C

[ARPurchaseWorkflowManager cartCheckoutSucceededWithShipping:[NSNumber numberWithFloat:2.25f]
                                                     withTax:[NSNumber numberWithFloat:3.00f]];
{% endhighlight %}

{% highlight swift %}
// Swift

ARPurchaseWorkflowManager.cartCheckoutSucceededWithShipping(2.25,
                                                   withTax: 3.00)
{% endhighlight %}

We will record an analytics event including information on all of the products that were purchased. We will automatically calculate the cart total and send that with the Artisan analytics event. It is assumed that all items in the cart will have the same currency; we will use the price currency of the first item.

After a successful checkout the cart will automatically be emptied. The Purchase Workflow Manager is then automatically ready to track the next workflow.

<div id="social"></div>

##Social Event Tracking

As an extension to our automatic and custom event tracking with the Artisan SDK we also provide analytics tracking specific to social sharing.

These analytics events are automatically synced with Artisan and can be used for advanced segmentation and personalization with the Artisan analytics reports, experiments, power hooks and campaigns.

###Automatic Tracking of SocialFramework sharing

<div class="note note-hint">
<p>NOTE: There is no need to manually track share events if you are using Apple SocialFramework for sharing to social networks. Artisan is already automatically collecting analytics events for shares via the SocialFramework.</p>
</div>

Artisan will automatically record the share event along with the service type and result (success, failed, cancelled, unknown).

###Social Sharing API for non-SocialFramework tracking

The ARSocialSharingManager manages all analytics tracking related to social share events. This includes recording Artisan analytics events for each share to a social network along with any additional information that you would like to track.

Here's how you can record a social sharing event

{% highlight objective-c %}
// Objective-C

// record successful share
[ARSocialSharingManager shareOnServiceType:@"Flickr"
                             wasSuccessful:YES];

// record attempted share that failed.
[ARSocialSharingManager shareOnServiceType:@"Flickr"
                             wasSuccessful:NO];
{% endhighlight %}

{% highlight swift %}
// Swift

// record successful share
ARSocialSharingManager.shareOnServiceType("Flickr",
                           wasSuccessful: true)

// record attempted share that failed
ARSocialSharingManager.shareOnServiceType("Flickr",
                           wasSuccessful: false)
{% endhighlight %}

Optionally, you can include metadata, a dictionary of key value pairs containing any additional information that you would like to record for this social event. All keys and values must be NSString objects, or they will be ignored.

{% highlight objective-c %}
// Objective-C

[ARSocialSharingManager shareOnServiceType:@"Flickr"
                             wasSuccessful:YES
                              withMetadata:@{@"post-description":postDescription}];
{% endhighlight %}

{% highlight swift %}
// Swift

ARSocialSharingManager.shareOnServiceType("Flickr",
                           wasSuccessful: false,
                            withMetadata: ["post-description":postDescription])
{% endhighlight %}
