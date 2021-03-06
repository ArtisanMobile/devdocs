---
layout: docs
title: "Event Tracking"
author: "Artisan"
category: dev/ios
description: "Event tracking with the Artisan iOS SDK"
---
#Event Tracking

Artisan automatically collects analytics events for every user, session, page view, tap and other user interactions. There's nothing you need to add to your app to capture those events. But, there are times when you want to capture an event that doesn't correspond directly to a tap or navigation, or maybe you want to capture more information with a particular tap or event. Below you can read more about our APIs for event tracking.

<ul>
  <li><a href="#trackevent">Track Custom Events</a></li>
  <li><a href="#artisan-event-tags">Automatic Event Tagging</a></li>
  <li><a href="#nameviewcontroller">Naming View Controllers</a></li>
  <li><a href="#nameview">Naming Views</a></li>
  <li><a href="#commerce">Purchase Workflow Tracking</a></li>
  <li><a href="#social">Social Event Tracking</a></li>
  <li><a href="#crashes">Automatic Crash Logging</a></li>
  <li><a href="#table-and-collection-view">UITableView and UICollectionView Event Tracking</a></li>
</ul>

<div id="trackevent"></div>

##Track Custom Events

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

<div class="note note-hint">
  <p><b>NOTE:</b> By default, each name/value pair attached to an Artisan analytics event is capped at 10,000 possible values.  For parameters where a greater number of values are anticipated, contact <a href="mailto:support@useartisan.com?Subject=Raise%20Event%20Parameter%20Value%20Limit" target="_top">support@useartisan.com</a> to raise the account limit.</p>
</div>

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
                   subCategory:@"Shoes"];

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

<div id="artisan-event-tags"></div>

##Automatic Event Tagging

As we mentioned above, Artisan automatically collects analytics events for every user, session, page view, tap and other user interactions. There's nothing you need to add to your app to capture those events. But, there are times when you want to  capture more information with a particular tap or event. In that case you can use **ArtisanEventTags**.

ArtisanEventTags are a collection of key/values that can be attached to a UIView or UIViewController so that any automatically collected analytics events, like screen view events or button tap events, will be tagged or categorized with the appropriate values.

The **artisanEventTags** property is added to your UIViews and UIViewControllers automatically via category.

You have two options for adding tags: fixed values and selectors. Additionally, you can register a category, subCategory, and subSubCategory on your ArtisanEventTags and those categories will be applied to the automatically-collected events as well.

{% highlight objective-c %}
// Objective-C

ArtisanEventTags *extraButtonInfo = [ArtisanEventTags artisanEventTags];
[extraButtonInfo setValue:self.productDescription.text
                   forKey:@"productDescription"]; // FIXED VALUE TAG
[extraButtonInfo setSelector:@selector(currentTitle)
                      forKey:@"buttonTitle"];  // SELECTOR TAG
[extraButtonInfo setCategory:@"Women"
                 subCategory:@"Shoes"
              subSubCategory:@"Boots"]; // CATEGORIES
self.addToCartButton.artisanEventTags = extraButtonInfo;
{% endhighlight %}

{% highlight swift %}
// Swift

var extraButtonInfo: ArtisanEventTags = ArtisanEventTags()
extraButtonInfo.setValue(self.productDescription.text, forKey: "productDescription") // FIXED VALUE TAG
extraButtonInfo.setSelector("currentTitle", forKey: "buttonTitle") // SELECTOR TAG
extraButtonInfo.setCategory("Women", subCategory: "Shoes", subSubCategory: "Boots")
self.addToCartButton.artisanEventTags = extraButtonInfo
{% endhighlight %}

If you set a fixed value for a tag that value will be used as is, but with a selector the Artisan SDK will perform the given selector on your UIView or UIViewController at the time that the automatically-collected event occurs. This can be useful if there is some data that is dynamic and changing that you want to capture as additional context for a given analytics event.

You can add as many tags as you like and you can mix and match fixed values and selector values. Duplicate tagName values will overwrite one another; the last value added for a given tagName will be used. Also, selector values will overwrite tagValues with the same tagName.

Event tags and categories can be used for filtering Artisan analytics, segmenting your users and targeting Artisan campaigns and experiments.

<div id="event-tagging"></div>

### Tags and Categories for Screen Appeared Events

When a view controller appears we automatically record a screen appeared event. If you have defined any ArtisanEventTags for the view controller we will include those with the screen appeared event.

A good place to register your ArtisanEventTags for your view controller is in **viewWillAppear:** or **viewDidLoad** on your view controller.

{% highlight objective-c %}
// Objective-C
- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  // Adding SKU and Description to all autocollected events on screen
  ArtisanEventTags *screenEventTags = [ArtisanEventTags artisanEventTags];
  [screenEventTags setValue:self.product.skuId
                             forKey:@"SKU_ID"];
  [screenEventTags setValue:self.product.name
                             forKey:@"PRODUCT_NAME"];
  self.artisanEventTags = screenEventTags;
}
{% endhighlight %}

{% highlight swift %}
// Swift

override func viewWillAppear(animated: Bool) {
  super.viewWillAppear(animated);

  // Adding SKU and Description to all autocollected events on screen
  var screenEventTags: ArtisanEventTags = ArtisanEventTags()
  screenEventTags.setValue(self.product.skuId, forKey: "SKU_ID")
  screenEventTags.setValue(self.product.name, forKey: "PRODUCT_NAME")
  self.artisanEventTags = screenEventTags
}
{% endhighlight %}

<div class="note note-hint">
<p><b>HINT:</b> Our screen appeared event is recorded just after viewWillAppear so we will use whatever values we have at that time.</p>
</div>

### Tags and Categories for Events on a View

We automatically record analytics events for interactions on UIControls. An example of this is a button tap. The Artisan SDK will include values from the ArtisanEventTags attached to both the view itself (e.g. the button) and the view controller it is attached to.

{% highlight objective-c %}
// Objective-C
ArtisanEventTags *addToCartButtonEventTags = [ArtisanEventTags artisanEventTags];
// This line will make sure we're getting the updated text on the button label when the events are auto-collected
[addToCartButtonEventTags setSelector:@selector(currentTitle)
                               forKey:@"ADD_TO_CART_BUTTON_TEXT"];
self.addToCartButton.artisanEventTags = addToCartButtonEventTags;
{% endhighlight %}

{% highlight swift %}
// Swift
var addToCartButtonEventTags: ArtisanEventTags = ArtisanEventTags()
// This line will make sure we're getting the updated text on the button label when the events are auto-collected
addToCartButtonEventTags.setSelector("currentTitle", forKey: "ADD_TO_CART_BUTTON_TEXT")
self.addToCartButton.artisanEventTags = addToCartButtonEventTags
{% endhighlight %}

### Tags and Categories for Table View and Collection View Selection Events

When a table view or collection view cell selection event is automatically recorded by Artisan we will look for any ArtisanEventTags on the view controller, table view or collection view, and selected cell and add the corresponding tag values to the analytics event.

Here's an example of adding ArtisanEventTags to a collection view cell:

{% highlight objective-c %}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath {

  UICollectionViewCell *productCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProductListCell"
                                                                                forIndexPath:indexPath];
  int row = (int)[indexPath row];

  ARPProductModel *currProduct = [[self products] objectAtIndex:row];
  // ... other setup

  // Adding Sku ID and Product Name to auto-collected events on collection view cell
  ArtisanEventTags *cellEventTags = [ArtisanEventTags artisanEventTags];
  [cellEventTags setValue:currProduct.skuId
                          forKey:@"SKU_ID"];
  [cellEventTags setValue:currProduct.name
                          forKey:@"PRODUCT_NAME"];
  productCell.artisanEventTags = cellEventTags;

  return productCell;
}
{% endhighlight %}

{% highlight swift %}
// Swift

override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
  let productCell = collectionView.dequeueReusableCellWithReuseIdentifier("ProductListCell", forIndexPath: indexPath) as! UICollectionViewCell

  let row = indexPath.row

  var currProduct: ARProductModel = self.products[row]
  // ... other setup

  // Adding Sku ID and Product Name to auto-collected events on collection view cell
  var cellEventTags: ArtisanEventTags = ArtisanEventTags()
  cellEventTags.setValue(currProduct.skuId, forKey: "SKU_ID")
  cellEventTags.setValue(currProduct.name, forKey: "PRODUCT_NAME")
  productCell.artisanEventTags = cellEventTags

  return productCell
}
{% endhighlight %}

<div class="note note-hint">
<p><b>HINT:</b> A good place to set the ArtisanEventTags for a table or collection view cell is in <strong>collectionView:cellForItemAtIndexPath:</strong> or <strong>tableView:cellForRowAtIndexPath:</strong>. That way if a cell is recycled you can be sure that it doesn't have the ArtisanEventTags from a previous usage.</p>
</div>

### Tags and Categories for StoreKit and SocialFramework events

When a StoreKit purchase or SocialFramework share event is recorded we will include the ArtisanEventTags for any visible view controllers to the analytics event.

<div class="note note-important">
<p><b>IMPORTANT:</b> It is possible to have multiple view controllers on the screen at the same time. We recommend that if you have multiple view controllers with ArtisanEventTags on the screen at the same time and you are using StoreKit purchases or SocialFramework that they do not have overlapping tagNames in the ArtisanEventTags for your different view controllers. If they do overlap you may find that filtering and segmenting based on these tags will be difficult because of how the values will appear in ArtisanTools.</p>
</div>

<div id="get-artisan-event-tags"></div>

###Automatic Event Tags for Custom Analytics Events

If you would like to use the Artisan Event Tags to add context to your custom analytics events you can get an NSDictionary of all the ArtisanEventTags in all active view controllers with **[ARTrackingManager getArtisanEventTagsForActiveViewControllers]**

{% highlight objective-c %}
// Objective-C

NSMutableDictionary *myParameters = [NSMutableDictionary dictionaryWithDictionary:[ARTrackingManager getArtisanEventTagsForActiveViewControllers]];
[myParameters setObject:@"myValue" forKey:@"myKey"];
[ARTrackingManager trackEvent:@"myEvent" parameters:[NSDictionary dictionaryWithDictionary:myParameters]];
{% endhighlight %}

{% highlight swift %}
// Swift

var myParameters: NSMutableDictionary = NSMutableDictionary(dictionary: ARTrackingManager.getArtisanEventTagsForActiveViewControllers())
myParameters.setObject("myValue", forKey: "myKey")
ARTrackingManager.trackEvent("myEvent", parameters: myParameters as [NSObject : AnyObject])
{% endhighlight %}

<div class="note note-hint"><p>Note: This method was added with Artisan SDK 2.4.1.</p></div>

<div class="note note-hint"><p>Note: ArtisanEventTags for the most recent view controllers are accessible AFTER ViewWillAppear and inside of ViewDidAppear.</p></div>

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
  <p><b>HINT:</b> Using a unique artisanNameTag for UIViews enables the targeting of specific UI changes made with the Artisan Canvas.  This works well for dynamic views that may or may not appear every time a particular screen is displayed.</p>
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

{% highlight swift %}
// Swift

func productsRequest(request: SKProductsRequest!, didReceiveResponse response: SKProductsResponse!) {
  ARStoreKitTracker.initWithSKProducts(response.products)

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

There are many variations of the **productViewed...** method so [please consult the ARPurchaseWorkflowManager Appledocs](/dev/ios/appledocs/) for your current version.

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
<p><b>NOTE:</b> There is no need to manually track share events if you are using Apple SocialFramework for sharing to social networks. Artisan is already automatically collecting analytics events for shares via the SocialFramework.</p>
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

<div id="crashes"></div>

##Automatic Crash Logging

As of Artisan 2.4.3, we are automatically collecting crash information any time your app crashes. Artisan will record crash information including the exception details and send that information back to Artisan the next time the app starts. These crash events will be available in your Events report on Artisan Tools and can be used for segmenting and personalizing your app experience just like any other event.

<div id="table-and-collection-view"></div>

## UITableView and UICollectionView Automatic Event Tracking

Artisan automatically adds a proxy to all UITableView and UICollectionView data sources so that we can automatically assign metadata to collect events for interactions with views inside of cells.

By default, we look for table views and collection views to proxy at two times: (1) when the screen first appears (just after viewWillAppear) and (2) anytime a view is added to the screen after (1) is complete--we will look from the added view down through all of its subviews. If the data source is not set at those times, or gets reset after the Artisan SDK has completed both (1) and (2), the data source may not be proxied. This can result in missing or inconsistent analytics events. If you are swapping out your data source after your view controller has already appeared or the UITableView or UICollectionView has already been added to the screen, see the steps below to re-enable proxying from the setDataSource implementations.

Additionally, Artisan detects when cells in a UITableView and UICollectionView are selected by observing when the corresponding delegate is applied to the parent via `setDelegate:`.  

In cases where Artisan's addition of a data source proxy (or of a `setDelegate:` observer) is not desired, see the steps below to deactivate that functionality.

### Disabling Artisan Data Source Proxying or SetDelegate Observing

By default, Artisan will add a proxy to your UITableView or UICollectionView DataSources, and will add an observer to your UITableView or UICollectionView delegates.  You may disable this behavior using the ArtisanConfiguration properties listing file.

To use the ArtisanConfiguration properties listing file, add a file called **ArtisanConfiguration.plist** (if it does not already exist) to your app bundle and include an array with the key "DisabledClasses." For example:

{% highlight xml %}
<key>DisabledClasses</key>
<array></array>
{% endhighlight %}

Inside of this array you can list the specific behavior that you would like to disable. These flags can be combined as needed.

**UITableView+ArtisanProxy** or **UICollectionView+ArtisanProxy**

: The 'UITableView+ArtisanProxy' or 'UICollectionView+ArtisanProxy' options will disable all observation of your data sources and delegates. This will mean that Artisan will not collect any analytics for selections to your cells, NOR will it collect any analytics for interactions with UI elements contained within your cells. If you have these flags in your Artisan Configuration then you do not need to specify the others--this flag supersedes them all.

{% highlight xml %}
<key>DisabledClasses</key>
<array>
    <string>UITableView+ArtisanProxy</string>
    <string>UICollectionView+ArtisanProxy</string>
</array>
{% endhighlight %}

**ArtisanUITableViewDelegateProxies** or **ArtisanUICollectionViewDelegateProxies**

: The 'ArtisanUITableViewDelegateProxies' and 'ArtisanUICollectionViewDelegateProxies' options will disable all observation of your delegates when your delegates are actually NSProxies. This is useful for select cases where your app (or an external library used by your app) is using proxies for your Table and CollectionView delegates and Artisan shouldn't be observing the proxy object, just the base object.

{% highlight xml %}
<key>DisabledClasses</key>
<array>
    <string>ArtisanUITableViewDelegateProxies</string>
    <string>ArtisanUICollectionViewDelegateProxies</string>
</array>
{% endhighlight %}

**ArtisanUITableViewDataSource** or **ArtisanUICollectionViewDataSource**

: The 'ArtisanUITableViewDataSource' or 'ArtisanUICollectionViewDataSource' options will disable all proxying of your data sources. Artisan will still collect analytics for interactions with UI elements contained within your cells, but they will not be grouped with other events on the same screen. It is also possible that the analytics events will not be consistent--taps on the same view at different times may result in different events. It will also mean that no Canvas capability will be support for UI elements within those cells.

{% highlight xml %}
<key>DisabledClasses</key>
<array>
    <string>ArtisanUITableViewDataSource</string>
    <string>ArtisanUICollectionViewDataSource</string>
</array>
{% endhighlight %}

**ArtisanUITableViewDelegate** or **ArtisanUICollectionViewDelegate**

: The 'ArtisanUITableViewDelegate' or 'ArtisanUICollectionViewDelegate' options will disable any observation of your UITableView or UICollectionView delegates. This means that Artisan will not automatically be able to detect when table or collection cells are tapped.

{% highlight xml %}
<key>DisabledClasses</key>
<array>
    <string>ArtisanUITableViewDelegate</string>
    <string>ArtisanUICollectionViewDelegate</string>
</array>
{% endhighlight %}

<div class="note note-important">
<p><strong>NOTE:</strong> Use of ArtisanConfiguration.plist is for advanced Artisan users only. Please contact <a href="mailto:support@useartisan.com?Subject=Artisan%20iOS%20Configuration%20Help" target="_top">support@useartisan.com</a> with any questions prior to using these advanced configuration options.</p>
</div>
