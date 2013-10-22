---
layout: doc-post
title: "Artisan Quickstart"
author: "Artisan"
category: docs
description: "Getting started with the Artisan MEM platform for developers."
---
#Artisan Quickstart Guide

##Install SDK


1) Download the Artisan SDK resources from the following link:
Artisan 2.0 sdk

2) Unzip the distribution. It should contain two files:

* ArtisanSDK.bundle
* ArtisanSDK.framework

3) Import these two files into your XCode project by dragging them into the Project Navigator on the left-hand side.

4) Confirm that the Artisan files have been imported properly by executing the following :

* Navigate to your project build settings by selecting your project's Project File in the Project Navigator
* Select the main build target for your app
* Select the 'Build Phases' task
* Confirm that 'ArtisanSDK.framework' is in the 'Link Binary With Libraries' Section
* Confirm that 'ArtisanSDK.bundle' are in the 'Copy Bundle Resources' section

5) Ensure these system frameworks are included in the 'Link Binary With Libraries' section of your app:

* CoreLocation.framework
* SystemConfiguration.framework
* QuartzCore.framework
* Security.framework
* CFNetwork.framework
* CoreData.framework
* libz.dylib

For any that aren't included, select the '+' icon in the lower-left corner of that section and select it from the popup window.

6) Ensure your project has the correct build settings by executing the following:

* Navigate to the 'Build Settings' tab of your project build settings.
* Navigate to 'Other Linker Flags'
* Ensure that '-ObjC' is included as an entry in 'Other Linker Flags' for all environments

<div class="note note-hint">
  <p>Hint: Read more about the -ObjC linker flag in Apple's Technical Article Building Objective-C static libraries with categories.</p>
</div>
7) Navigate to the main App Delegate class for your project.

8) Add the following import statement to the top of the .m file for the App Delegate:

9) Add the following line to the bottom of the didFinishLaunchingWithOptions: method of the AppDelegate.

<div class="note note-important">
  <p>Important: Make sure to fill in the parameter startWithAppId with your AppID, provided by us. You can find your AppID either in the url of your application page, or in the settings sections of your application.</p>
</div>

10) Build your app as normal.

You should now be able to build your app and successfully connect it to artisantools.com to begin building your first experiment.

##In-code Experiments SDK

**Description of in-code experiemnts goes here.**

An in-code experiments must be defined in the appDelegate before the startWithAppId:version:options: line.

The method registerExperiment: takes a string argument.

Next, register each variant by name with the experiemnt.

Call the method setExperimentViewedForExperiment: to mark the experiment has been viewed.

Use the method isCurrentVariant:forExperiment: to determine which experiment variation is active.

<div class="note note-hint">
  <p>Hint: The logic for choosing the variant should generally be in the viewWillAppear: method of your UIViewController class or in a location where the code will be exercised each time the screen is displayed.  This is necessary so the test can be turned on and off without requiring the rebuilding of the screen.</p>
</div>

<div class="note note-important">
  <p>Important: If the experiment is not running the default behaviour will be selected.</p>
</div>

To set the goal of an in-code experiment you call the setTargetReachedForExperiment:description: method.

##Power Hooks

Power Hooks are key-value pairs or code blocks with key-value arguments that are passed into your application code by Artisan when your app starts, allowing for settings, text, and logic to be modified on the fly for all user devices without revisioning or updating your application.

All hooks are created using ARPowerHookManager are registered with ArtisanTools.com automatically when you connect your device to Artisan for the first time.  The registration process will detect all registered hook keys, and will display all of the hook variables and code blocks for this app in ArtisanTools.com where they can be edited.  Values set on hooks on the web will automatically be downloaded by all devices upon app startup, allowing for their usage throughout your system code.

###Power Hook Variables

Register a single-value Power Hook for use with Artisan.

Use the method registerHookWithId:friendlyName:defaultValue: to declare the existence of a Power Hook you would like to pass in from Artisan.

<div class="note note-important">
  <p>Important: This declaration should occur in the didFinishLaunchingWithOptions: method of your main app delegate, *before* you start Artisan using the \[ARManager startWithAppId:] method.</p>
</div>

The method getValueForHookById: retrieves the value of a Power Hook from Artisan.  This will return the value specified in ArtisanTools.com, or the default value if none has been specified.

HINT: Each time your code passes over a getValueForHookById: method call the most recently downloaded value to the user's device will be referenced.  If you do not want the value to change during the life-cycle of the object you can assign the value to a property or member variable in the object's constructor.


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

Use the method executeBlockWithId:data:context to execute a Power Hook code block from Artisan.  The code block will use the values specified in the data parameter registered in ArtisanTools.com to execute the block. You can override the default data using ArtisanTools.com.

* **id** - The name of the code to register. Name must be unique for this app.
* **data** - The default data for this code block. This should be string keys and values. This data will be used if no data is passed in from ArtisanTools.com for this code block for this app.
* **context** - A reference to an object passed into the block.

<div class="note note-hint">
  <p>Hint: Passing a reference to a UIViewController for the context parameter enables a registered block to transition to a new screen.  This enables the injection of a new screen into an existing workflow.</p>
</div>

##User Profile

ARProfileManager is a singleton that is automatically initialized when your app starts.  Use ARProfileManager to manage the personalization profile for the current user from app inception to completion.

<div class="note note-hint">
  <p>Hint: Valid characters for this name include \[0-9], \[a-z], \[A-Z], -, and \_.  Any other characters will automatically be stripped out.</p>
</div>

###Register User Profile Variables

Convience methods existing for registering numbers, strings, dates, and locations.  The value can optionally be set during the registration of the User Profile Variable.

###Update User Profile Variables
The updating of the User Profile Variable can be accomplished by calling the matching setter for the User Variable Variable data type.

###Clear User Profile Variables
The clearProfile: method will clear out the values associated with the registered User Profile Variables.

###Setting the shared user Id
The sharedUserId User Profile Variable is used to uniquely indentify an app user.
Important: The sharedUserId should be an id from your system that can not be used to identify the user outside of your systems.  For example, do not use email address, phone number, or social security number.

###User Profile Variables for Advanced Targeting
The methods setGender:, setUserAge:, and setUserAddress: can all be used for Advanced Targeting in Optimimze.  These deminions can also be used for creating segments and reporting.
The setGender: method expects one of the following values: ARGenderFemale, ARGenderMale, ARGenderNA or nil;
The setUserAge: method expects a NSNumber object with an integer value or nil.
The setUserAddress: method expects a String containg an address that can be geo-located.

<div class="note note-hint">
  <p>Hint: The address needs to be in CLGeocoder format.  Unrecognized or unparseable address strings will automatically be converted to 0&deg;N / 0&deg;E.</p>
</div>

##Analytics
ARTrackingManager manages all in-code analytics tracking designed for use with Artisan, to allow you to track both views and events.
The registerUserProfileVariablesCode: and registerUserProfileVariablesCode:parameters methods allow you to track an event by name.
with an optional dictionary of name/value pairs.

##Name your views
Each UIView class contains the Apple property tag allowing you to uniquely identify a view with an NSInteger value.  The Artisan SDK adds the property nameTag to all UIView classes through the use if an Objective-C category.
If the nameTag property is assigned the Artisan platform will use the nameTag instead of the generated name for the view enabling name of the view to appear in the Canvas and in analytic reports.
The helper method viewWithNameTag: can be used to retrieve a view by its nameTag.