---
layout: docs
title: "Power Hooks"
author: "Artisan"
category: dev/ios
description: "Power Hooks with the Artisan iOS SDK"
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

Use the method **registerHookWithId:friendlyName:defaultValue:** to declare the existence of a Power Hook you would like to pass in from Artisan.

{% highlight objective-c %}
[ARPowerHookManager registerHookWithId:@"slogan" friendlyName:@"Slogan" defaultValue:@"It's So Good!"];
[ARManager startWithAppId:@""];
{% endhighlight %}

<div class="note note-important">
  <p>Important: This declaration should occur in the **didFinishLaunchingWithOptions:** method of your main app delegate, **before** you start Artisan using the [ARManager startWithAppId:] method.</p>
</div>

<div id="getvalue"></div>

##Get Power Hook Value

The method **getValueForHookById:** retrieves the value of a Power Hook from Artisan.  This will return the value specified in the Artisan platform, or the default value if none has been specified.

{% highlight objective-c %}
NSString *configValue = [ARPowerHookManager getValueForHookById:@"slogan"];
NSNumber *configValue = [ARPowerHookManager getValueForHookById:@"numberofresults"];
{% endhighlight %}

<div class="note note-hint">
  <p>HINT: Each time your code passes over a **getValueForHookById:** method call the most recently downloaded value to the user's device will be referenced.  If you do not want the value to change during the life-cycle of the object you can assign the value to a property or member variable in the object's constructor.</p>
</div>

<div id="code-blocks"></div>

##Code Blocks

Power Hook code blocks can be used for referencing code that can be executed conditionally. Examples are displaying a modal popup to remind the user to perform certain actions in the app, managing the logic for applying a discount code, or displaying a survey to a segment of users.

Use this method to declare the existence of a code block you would like to use in your app with data that is configurable from Artisan.

This declaration should occur in the **didFinishLaunchingWithOptions:** method of your main app delegate, *before* you start Artisan using the \[ARManager startWithAppId:] method.

* **id** - The name of the code to register. Name must be unique for this app.
* **friendlyName** - The name for this code block that will be displayed in Artisan Tools.
* **data** - The default data for this code block. This should be string keys and string values. This data will be used if no data is passed in from ArtisanTools.com for this code block for this app.
* **andBlock** - The block of code executed.

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

<div class="note note-hint">
  <p>Hint: The data parameter contains name/value pairs that are private to the Power Hook Code Block.</p>
</div>

Use the method **executeBlockWithId:data:context** to execute a Power Hook code block from Artisan. The code block will use the values specified in the data parameter registered in ArtisanTools.com to execute the block. You can override the default data using ArtisanTools.com.

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

<div id="callbacks"></div>

##Callbacks

Artisan allows you to <a href="/dev/ios/callbacks/#power-hooks">register callbacks</a> for when an individual power hook changes or when any power hook changes.

<div id="preview-mode"></div>

##Preview Mode

When making changes to Power Hook values you can preview the look and behavior of your application with the new values by clicking on the gear <img src="/images/gear-icon.png" /> and selecting "Preview".

### Preview from the Power Hook Page

You can preview the default, current and draft values for your app's Power Hooks.

<img src="/images/preview-mode-power-hook-page.png"/>

### Preview from any Power Hook Experiment

You can preview any variation of your experiment.

<img src="/images/preview-mode-experiment-preview.png"/>

### Exiting Preview Mode

You can exit Preview Mode by closing the modal in your browser.

<img src="/images/preview-mode-modal.png"/>

If you background and foreground your app while you are in preview mode you will be disconnected from Artisan Tools, but you will remain in preview mode and your changes will still be active when the app starts again.

You can then exit preview mode by tapping the preview icon on your device <img src="/images/preview-mode-indicator.png"/> and selecting "Exit Preview Mode"

<img src="/images/preview-mode-device.png"/>&nbsp;&nbsp;&nbsp;&nbsp;<img src="/images/preview-mode-device-exit.png"/>
