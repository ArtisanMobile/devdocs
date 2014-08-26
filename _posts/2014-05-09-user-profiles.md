---
layout: docs
title: "User Profiles"
author: "Artisan"
category: dev/ios
description: "User profile management with the Artisan iOS SDK"
---
#User Profiles

Artisan accepts user profile data for advanced segmentation, targeting and personalization capabilities.

<ul>
  <li><a href="#register">Register Profile Variable</a></li>
  <li><a href="#update">Update Profile Variable</a></li>
  <li><a href="#clear">Clear Profile Variables</a></li>
  <li><a href="#sharedid">Shared User ID</a></li>
</ul>

<div id="register"></div>

##Register Profile Variable

ARProfileManager is a singleton that is automatically initialized when your app starts. Convenience methods existing for registering numbers, strings, dates, and locations. The value can optionally be set during the registration of the User Profile Variable.

{% highlight objective-c %}
// Objective-C

[ARProfileManager registerNumber:@"currentCartTotal" withValue:[NSNumber numberWithDouble:0]];
[ARProfileManager registerString:@"memberType" withValue:@"unknown"];

[ARProfileManager registerDateTime:@"lastPurchase"];
[ARProfileManager registerLocation:@"lastKnownLocation"];
{% endhighlight %}

{% highlight swift %}
// Swift

ARProfileManager.registerNumber("currentCartTotal", withValue:NSNumber.numberWithDouble(0))
ARProfileManager.registerString("memberType", withValue:"unknown")

ARProfileManager.registerDateTime("lastPurchase")
ARProfileManager.registerLocation("lastKnownLocation")
{% endhighlight %}

<div class="note note-hint">
  <p>Hint: Valid characters for this name include [0-9], [a-z], [A-Z], -, and _. Any other characters will automatically be stripped out.</p>
</div>

<div id="update"></div>

##Update Profile Variable
The updating of the User Profile Variable can be accomplished by calling the matching setter for the User Variable Variable data type.

{% highlight objective-c %}
// Objective-C

[ARProfileManager setNumberValue:[NSNumber numberWithDouble:150.00] forVariable:@"currentCartTotal"];
[ARProfileManager setStringValue:@"platinum" forVariable:@"memberType"];

[ARProfileManager setDateTimeValue:[NSDate new] forVariable:@"lastPurchase"];
[ARProfileManager setLocationValue:CLLocationCoordinate2DMake(39.949934, -75.145012) forVariable:@"lastKnownLocation"];
{% endhighlight %}

{% highlight swift %}
// Swift

ARProfileManager.setNumberValue(NSNumber.numberWithDouble(150.00), forVariable:"currentCartTotal")
ARProfileManager.setStringValue("platinum", forVariable:"memberType")

ARProfileManager.setDateTimeValue(NSDate(), forVariable:"lastPurchase")
ARProfileManager.setLocationValue(CLLocationCoordinate2DMake(39.949934, -75.145012), forVariable:"lastKnownLocation")
{% endhighlight %}

<div id="clear"></div>

##Clear Profile Variables
The **clearProfile:** method will clear out the values associated with the registered User Profile Variables.

{% highlight objective-c %}
// Objective-C

[ARProfileManager clearProfile];
{% endhighlight %}

{% highlight swift %}
// Swift

ARProfileManager.clearProfile()
{% endhighlight %}

<div id="sharedid"></div>

##Shared User ID
The **sharedUserId** User Profile Variable is used to uniquely indentify an app user and will be associated with all user events.


{% highlight objective-c %}
// Objective-C

[ARProfileManager setSharedUserId:@"624597b0e106e732a3204001"];
{% endhighlight %}

{% highlight swift %}
// Swift

ARProfileManager.setSharedUserId("624597b0e106e732a3204001")
{% endhighlight %}

<div class="note note-important">
  <p>Important: The sharedUserId should NOT be any of the following: email address, phone number, or social security number.  The sharedUserId should uniquely identify the user in your system.</p>
</div>
