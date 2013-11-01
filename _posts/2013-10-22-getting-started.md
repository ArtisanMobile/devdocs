---
layout: docs
title: "Quickstart for iOS"
author: "Artisan"
category: dev
description: "Getting started with the Artisan MEM platform for developers."
---
#Artisan Quickstart Guide for iOS

##Install SDK


1\. Download the Artisan SDK

2\. Unzip the distribution. It should contain two files:

* ArtisanSDK.bundle
* ArtisanSDK.framework

3\. Import these two files into your XCode project by dragging them into the Project Navigator on the left-hand side.

4\. Confirm that the Artisan files have been imported properly by executing the following :
  
* Navigate to your project build settings by selecting your project\'s Project File in the Project Navigator
* Select the main build target for your app
* Select the \'Build Phases\' task
* Confirm that \'ArtisanSDK.framework\' is in the \'Link Binary With Libraries\' Section
* Confirm that \'ArtisanSDK.bundle\' are in the \'Copy Bundle Resources\' section

5\. Ensure these system frameworks are included in the \'Link Binary With Libraries\' section of your app:
  
* CoreLocation.framework
* SystemConfiguration.framework
* QuartzCore.framework
* Security.framework
* CFNetwork.framework
* CoreData.framework
* libz.dylib
  
For any that aren\'t included, select the \'+\' icon in the lower-left corner of that section and select it from the popup window.

6\. Ensure your project has the correct build settings by executing the following:
  
* Navigate to the \'Build Settings\' tab of your project build settings.
* Navigate to \'Other Linker Flags\'
* Ensure that \'-ObjC\' is included as an entry in \'Other Linker Flags\' for all environments

<div class="note note-hint">
  <p>Hint: Read more about the -ObjC linker flag in Apple's <a href="https://developer.apple.com/library/mac/qa/qa1490/_index.html" target="_blank">Technical Article Building Objective-C static libraries with categories</a>.</p>
</div>

7\. Navigate to the main App Delegate class for your project.

8\. Add the following import statement to the top of the .m file for the App Delegate:

{% highlight objective-c %}
#import <ArtisanSDK/ArtisanSDK.h>
{% endhighlight %}

<div class="note note-important">
  <p>Important: The ArtisanSDK import line should be included in your App .pch file or at the top of each class where you reference the Artisan SDK.</p>
</div>

9\. Add the following line to the bottom of the didFinishLaunchingWithOptions: method of the AppDelegate.

{% highlight objective-c %}
[ARManager startWithAppId:@"YOURAPPID"];
{% endhighlight %}

<div class="note note-important">
  <p>Important: Make sure to fill in the parameter startWithAppId with your AppID, provided by us. You can find your AppID either in the url of your application page, or in the settings sections of your application.</p>
</div>

10\. Build your app as normal.

You should now be able to build your app and successfully connect it to artisantools.com to begin building your first experiment.


##Analytics
ARTrackingManager manages all in-code analytics tracking designed for use with Artisan, to allow you to track both views and events.

The registerUserProfileVariablesCode: and registerUserProfileVariablesCode:parameters methods allow you to track an event by name.

{% highlight objective-c %}
[ARTrackingManager trackEvent:@"itemsInCartAreNowOutofStock"];
{% endhighlight %}

with an optional dictionary of name/value pairs.

{% highlight objective-c %}
[ARTrackingManager trackEvent:@"itemsInCartAreNowOutofStock" parameters:@{@"numberOfItems":@"2"}];
{% endhighlight %}

##User Profile

ARProfileManager is a singleton that is automatically initialized when your app starts.  Use ARProfileManager to manage the personalization profile for the current user from app inception to completion.

<div class="note note-hint">
  <p>Hint: Valid characters for this name include [0-9], [a-z], [A-Z], -, and _.  Any other characters will automatically be stripped out.</p>
</div>

###Register User Profile Variables

Convenience methods existing for registering numbers, strings, dates, and locations.  The value can optionally be set during the registration of the User Profile Variable.

{% highlight objective-c %}
[ARProfileManager registerNumber:@"currentCartTotal" withValue:[NSNumber numberWithDouble:0]];
[ARProfileManager registerString:@"memberType" withValue:@"unknown"];

[ARProfileManager registerDateTime:@"lastPurchase"];
[ARProfileManager registerLocation:@"lastKnownLocation"];
{% endhighlight %}

###Update User Profile Variables
The updating of the User Profile Variable can be accomplished by calling the matching setter for the User Variable Variable data type.

{% highlight objective-c %}
[ARProfileManager setNumberValue:[NSNumber numberWithDouble:150.00] forVariable:@"currentCartTotal"];
[ARProfileManager setStringValue:@"platinum" forVariable:@"memberType"];

[ARProfileManager setDateTimeValue:[NSDate new] forVariable:@"lastPurchase"];
[ARProfileManager setLocationValue:CLLocationCoordinate2DMake(39.949934, -75.145012) forVariable:@"lastKnownLocation"];
{% endhighlight %}

###Clear User Profile Variables
The clearProfile: method will clear out the values associated with the registered User Profile Variables.

{% highlight objective-c %}
[ARProfileManager clearProfile];
{% endhighlight %}

###Setting the shared user Id
The sharedUserId User Profile Variable is used to uniquely indentify an app user.

<div class="note note-important">
  <p>Important: The sharedUserId should NOT be any of the following: email address, phone number, or social security number.  The sharedUserId should uniquely identify the user in your system.</p>
</div>

{% highlight objective-c %}
[ARProfileManager setSharedUserId:@"624597b0e106e732a3204001"];
{% endhighlight %}

###User Profile Variables for Advanced Targeting
The methods setGender:, setUserAge:, and setUserAddress: can all be used for Advanced Targeting in Optimize.  These deminions can also be used for creating segments and reporting.

The setGender: method expects one of the following values: ARGenderFemale, ARGenderMale, ARGenderNA or nil;

{% highlight objective-c %}
[ARProfileManager setGender:ARGenderFemale];
{% endhighlight %}

The setUserAge: method expects a NSNumber object with an integer value or nil.

{% highlight objective-c %}
[ARProfileManager setUserAge:[NSNumber numberWithInteger:22]];
{% endhighlight %}

The setUserAddress: method expects a String containg an address that can be geo-located.

{% highlight objective-c %}
[ARProfileManager setUserAddress:@"1 Lincoln Financial Field Way, Philadelphia, PA 19147"];
{% endhighlight %}

<div class="note note-hint">
  <p>Hint: The address needs to be in CLGeocoder format.  Unrecognized or unparseable address strings will automatically be converted to 0&deg;N / 0&deg;E.</p>
</div>


##Power Hooks

Power Hooks are key-value pairs or code blocks with key-value arguments that are passed into your application code by Artisan when your app starts, allowing for settings, text, and logic to be modified on the fly for all user devices without revisioning or updating your application.

All hooks are created using ARPowerHookManager are registered with ArtisanTools.com automatically when you connect your device to Artisan for the first time.  The registration process will detect all registered hook keys, and will display all of the hook variables and code blocks for this app in ArtisanTools.com where they can be edited.  Values set on hooks on the web will automatically be downloaded by all devices upon app startup, allowing for their usage throughout your system code.

###Power Hook Variables

Register a single-value Power Hook for use with Artisan.

Use the method registerHookWithId:friendlyName:defaultValue: to declare the existence of a Power Hook you would like to pass in from Artisan.

{% highlight objective-c %}
[ARPowerHookManager registerHookWithId:@"slogan" friendlyName:@"Slogan" defaultValue:@"It's So Good!"];
[ARManager startWithAppId:@""];
{% endhighlight %}

<div class="note note-important">
  <p>Important: This declaration should occur in the didFinishLaunchingWithOptions: method of your main app delegate, *before* you start Artisan using the \[ARManager startWithAppId:] method.</p>
</div>

The method getValueForHookById: retrieves the value of a Power Hook from Artisan.  This will return the value specified in ArtisanTools.com, or the default value if none has been specified.

{% highlight objective-c %}
NSString *configValue = [ARPowerHookManager getValueForHookById:@"slogan"];
{% endhighlight %}

<div class="note note-hint">
  <p>HINT: Each time your code passes over a getValueForHookById: method call the most recently downloaded value to the user's device will be referenced.  If you do not want the value to change during the life-cycle of the object you can assign the value to a property or member variable in the object's constructor.</p>
</div>

###Power Hook Code Blocks

Use this method to declare the existence of a code block you would like to use in your app with data that is configurable from Artisan.

This declaration should occur in the didFinishLaunchingWithOptions: method of your main app delegate, *before* you start Artisan using the \[ARManager startWithAppId:] method.

* **id** - The name of the code to register. Name must be unique for this app.
* **friendlyName** - The name for this code block that will be displayed in Artisan Tools.
* **data** - The default data for this code block. This should be string keys and string values. This data will be used if no data is passed in from ArtisanTools.com for this code block for this app.
* **andBlock** - The block of code executed.

<div class="note note-important">
  <p>Hint: The data parameter contains name/value pairs that are private to the Power Hook Code Block.</p>
</div>

{% highlight objective-c %}
[ARPowerHookManager registerBlockWithId:@"discountPopup"
                           friendlyName:@"discount popup"
                                   data:@{ @"shouldDisplayAlert" : @"NO",
                                           @"name" : @"value1",
                                           @"discountAmount" : @"value2"
                                         }
                               andBlock:^(NSDictionary *data, id context) {
                                   
   if ([data[@"shouldDisplayAlert"] isEqualToString:@"YES"]) {
      NSString *message = [NSString stringWithFormat:@"Hello there, %@! We'd like to give you a discount of %@ on %@",
                           data[@"name"],
                           data[@"discountAmount"],
                           data[@"product"]];
       
      UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Here's a Coupon!"
                                                          message:message
                                                        delegate:context
                                                cancelButtonTitle:@"Cancel"
                                                otherButtonTitles:@"Ok", nil];       
      [alertView show];
  }
}];
{% endhighlight %}

Use the method executeBlockWithId:data:context to execute a Power Hook code block from Artisan.  The code block will use the values specified in the data parameter registered in ArtisanTools.com to execute the block. You can override the default data using ArtisanTools.com.

Power Hook code blocks can be used for referencing code that can be executed conditionally.  Examples are displaying a modal popup to remind the user to perform certain actions in the app, managing the logic for applying a discount code, or displaying a survey to a segment of users.

* **id** - The name of the code to register. Name must be unique for this app.
* **data** - The default data for this code block. This should be string keys and values. This data will be used if no data is passed in from ArtisanTools.com for this code block for this app.
* **context** - A reference to an object passed into the block.

{% highlight objective-c %}
[ARPowerHookManager executeBlockWithId:@"discountPopup" 
                                  data:nil 
                               context:self];
{% endhighlight %}                              

<div class="note note-hint">
  <p>Hint: Passing a reference to a UIViewController for the context parameter enables a registered block to transition to a new screen.  This enables the injection of a new screen into an existing workflow.</p>
</div>

##In-code Experiments

In-code Experiments allow you to build tests around business logic inside your app.  For example, you can create a test for showing or not showing a particular screen.  Another example is testing multiple workflows.

An in-code experiments must be defined in the appDelegate before the startWithAppId:version:options: line.

The method registerExperiment: takes a string representing the name of your experiment.

{% highlight objective-c %}
[ARExperimentManager registerExperiment:@"Cart Process"];
{% endhighlight %}

Next, register each variant by name with the experiment.

{% highlight objective-c %}
[ARExperimentManager addVariant:@"Skip Product Screen" forExperiment:@"Cart Process"];
[ARExperimentManager addVariant:@"Don't Skip Product Screen" forExperiment:@"Cart Process" isDefault:YES];
{% endhighlight %}

<div class="note note-important">
  <p>Important: If the experiment is not running the default variant will be selected.</p>
</div>

Call the method setExperimentViewedForExperiment: to mark the experiment has been viewed for the current user session.  This call should be made at the location within the code where you want to mark the experiment as viewed.

Use the method isCurrentVariant:forExperiment: to determine which experiment variation is active.

{% highlight objective-c %}
[ARExperimentManager setExperimentViewedForExperiment:@"Cart Process"];

if ([ARExperimentManager isCurrentVariant:@"Skip Product Screen" forExperiment:@"Cart Process"]) {
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

To set the goal of an in-code experiment you call the setTargetReachedForExperiment:description: method.  This call should be made at the location within the code where you want to mark the goal as achieved. 

{% highlight objective-c %}
[ARExperimentManager setTargetReachedForExperiment:@"Cart Process" description:@"Reached the Checkout Screen."];
{% endhighlight %}


##Name your views
Each UIView class contains the Apple property \'tag\' allowing you to uniquely identify a view with an NSInteger value.  The Artisan SDK adds the property artisanNameTag to all UIView classes through the use if an Objective-C category.

If the artisanNameTag property is assigned the Artisan platform will use the artisanNameTag instead of the generated name for the view as it appears in the Artisan Canvas and in analytic reports.

{% highlight objective-c %}
button = [UIButton buttonWithType:UIButtonTypeCustom];  
button.artisanNameTag = @"Add Button";

[self.view addSubview:button];
{% endhighlight %}

<div class="note note-hint">
  <p>Hint: Using a unique artisanNameTag for UIViews enables the targeting of specific UI changes made with the Artisan Canvas.  This works well for dynamic views that may or may not appear every time a particular screen is displayed.</p>
</div>

##Name your view controllers
The Artisan SDK adds the property artisanNameTag to all UIViewController classes through the use if an Objective-C category.

If the artisanNameTag property is assigned the Artisan platform will use the artisanNameTag instead of the generated name when displaying the view controller while building an experiment and in analytic reports.

{% highlight objective-c %}
self.artisanNameTag = @"Login Screen";  
{% endhighlight %}