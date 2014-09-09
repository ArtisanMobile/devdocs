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
  <li><a href="#dimensions">Other Artisan Profile Variables</a></li>
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

The **clearVariable:variableName** method will clear out the value for a single profile variable.

{% highlight objective-c %}
// Objective-C

[ARProfileManager clearProfile];
[ARProfileManager clearVariable:@"memberType"];
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

<div id="dimensions"></div>

##Other Artisan Profile Variables

There are several profile dimensions that we have pre-defined for you. By default the values will be empty, but you can use the provided API calls to set the value. This new value will be used as part of this user's personalization profile, and will be used from this point forward for segmentation, targeting, and reporting purposes.

Specify the gender and age of the current user:

{% highlight objective-c %}
// Objective-C

[ARProfileManager setGender:ARGenderFemale];
[ARProfileManager setUserAge:@29];
{% endhighlight %}

Set the name of the user:

{% highlight objective-c %}
// Objective-C

[ARProfileManager setUserPrefix:@"Dr."];
[ARProfileManager setUserFirstName:@"Arty"];
[ARProfileManager setUserMiddleName:@"Sans"];
[ARProfileManager setUserLastName:@"Elibom"];
[ARProfileManager setUserSuffix:@"III"];
{% endhighlight %}

You can record information about the source of this user and when they first started using your app or service:

{% highlight objective-c %}
// Objective-C

[ARProfileManager setUserReferralSource:@"Bob"];
[ARProfileManager setFirstSeen:[NSDate new]];
[ARProfileManager setSignUpDate:[NSDate new]];
{% endhighlight %}

### Physical and Virtual Addresses

You can record information about the users physical and virtual addresses:

{% highlight objective-c %}
// Objective-C

[ARProfileManager setUserStreetAddress:@"234 Market Street"];
[ARProfileManager setUserStreetAddress2:@"4th Floor"];
[ARProfileManager setUserCompanyName:@"Artisan Mobile Inc."];
[ARProfileManager setUserCity:@"Philadelphia"];
[ARProfileManager setUserStateProvince:@"PA"];
[ARProfileManager setUserPostalCode:@"19106"];
[ARProfileManager setUserCountry:@"USA"];

[ARProfileManager setUserAvatarUrl:@"http://useartisan.com/wp-content/themes/artisan-mf/images/role_developer.svg"];
[ARProfileManager setUserFacebook:@"Arty Sans"];
[ARProfileManager setUserTwitterName:@"ArtisanMobile"];
[ARProfileManager setUserUrl:@"http://useartisan.com"];

[ARProfileManager setUserPhoneNumber:@"555-555-1234"];
[ARProfileManager setUserEmail:@"sales@useartisan.com"];
{% endhighlight %}

###User Preferences

You can record contact information and preferences that the user has set in your app or service related to those contact paths:

{% highlight objective-c %}
// Objective-C

[ARProfileManager setOptedOutEmail:NO];
[ARProfileManager setOptedOutPush:YES];
[ARProfileManager setOptedOutText:YES];
{% endhighlight %}
