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
  <li><a href="#dimensions">Artisan Profile Variables</a></li>
  <li><a href="#sharedid">Shared User ID</a></li>
  <li><a href="#artisan-id">Getting the Artisan ID and Push Token</a></li>
  <li><a href="#register">Register Custom Profile Variable</a></li>
  <li><a href="#update">Update Profile Variable</a></li>
  <li><a href="#clear">Clear Profile Variables</a></li>
</ul>

<div id="dimensions"></div>

##Artisan Profile Variables

By default, Artisan collects information about the user's device which is automatically added to the user profile and can be used for targeting, segmentation and personalization. These automatically collected values include:

<dt>App Version</dt><dd>The value corresponds to CFBundleShortVersionString--the release version name of your app. For example, "3.2.0".</dd>
<dt>App Build Number</dt><dd>This value corresponds to CFBundleVersion--the build version number for your app bundle. For example, "119".</dd>
<dt>Device Type</dt><dd>This will be iPhone or iPad.</dd>
<dt>Hardware Type</dt><dd>The return value from hw.machine property on UIDevice. For example, "iPhone 5s"</dd>
<dt>Language</dt><dd>The language for the device. The value comes from [[NSLocale preferredLanguages] objectAtIndex:0].</dd>
<dt>Last Session Date</dt><dd>The date of the second to last time the user started the app.</dd>
<dt>Minutes from GMT</dt><dd>Minutes from GMT for the device's timezone.</dd>
<dt>OS Version</dt><dd>The return value from [[UIDevice currentDevice] systemVersion]. For example, "8.1".</dd>
<dt>OS Name</dt><dd>For iOS apps this is "iOS".</dd>
<dt>Push Enabled</dt><dd>Whether or not push messaging is enabled for the app and user.</dd>
<dt>Session Count</dt><dd>The total number of times the user has opened your app. A session begins when the app is foregrounded and ends when it is backgrounded.</dd>

Additionally, there are several profile dimensions that we have pre-defined for you. By default the values will be empty, but you can use the provided API calls to set the value. This new value will be used as part of this user's personalization profile, and will be used from this point forward for segmentation, targeting, and reporting purposes.

Specify the gender and age of the current user:

{% highlight objective-c %}
// Objective-C

[ARProfileManager setGender:ARGenderFemale];
[ARProfileManager setUserAge:@29];
{% endhighlight %}

{% highlight swift %}
// Swift

ARProfileManager.setGender(ARGender.Female);
ARProfileManager.setUserAge(29);
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

{% highlight swift %}
// Swift

ARProfileManager.setUserPrefix("Dr.")
ARProfileManager.setUserFirstName("Arty")
ARProfileManager.setUserMiddleName("Sans")
ARProfileManager.setUserLastName("Elibom")
ARProfileManager.setUserSuffix("III")
{% endhighlight %}

You can record information about the source of this user and when they first started using your app or service:

{% highlight objective-c %}
// Objective-C

[ARProfileManager setUserReferralSource:@"Bob"];
[ARProfileManager setFirstSeen:[NSDate new]];
[ARProfileManager setSignUpDate:[NSDate new]];
{% endhighlight %}

{% highlight swift %}
// Swift

ARProfileManager.setUserReferralSource("Bob")
ARProfileManager.setFirstSeen(NSDate())
ARProfileManager.setSignUpDate(NSDate())
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

{% highlight swift %}
// Swift

ARProfileManager.setUserStreetAddress("234 Market Street")
ARProfileManager.setUserStreetAddress2("4th Floor")
ARProfileManager.setUserCompanyName("Artisan Mobile Inc.")
ARProfileManager.setUserCity("Philadelphia")
ARProfileManager.setUserStateProvince("PA")
ARProfileManager.setUserPostalCode("19106")
ARProfileManager.setUserCountry("USA")

ARProfileManager.setUserPhoneNumber("555-555-1234")
ARProfileManager.setUserEmail("sales@useartisan.com")
{% endhighlight %}

###User Preferences

You can record contact information and preferences that the user has set in your app or service related to those contact paths:

{% highlight objective-c %}
// Objective-C

[ARProfileManager setOptedOutEmail:NO];
[ARProfileManager setOptedOutPush:YES];
[ARProfileManager setOptedOutText:YES];
{% endhighlight %}

{% highlight swift %}
// Swift

ARProfileManager.setOptedOutEmail(false)
ARProfileManager.setOptedOutPush(true)
ARProfileManager.setOptedOutText(true)
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

<div id="artisan-id"></div>

##Getting the Artisan ID and Push Token

The ARProfileManager can be used to access the Artisan ID for the current device as well as the Push Token from Apple Push Notification Service, if push is enabled for your app.

{% highlight objective-c %}
// Objective-C

NSString *artisanID = [ARProfileManager getArtisanId];
NSString *pushToken = [ARProfileManager getPushToken];
{% endhighlight %}

{% highlight swift %}
// Swift

let artisanID = ARProfileManager.getArtisanId()
let pushToken = ARProfileManager.getPushToken()
{% endhighlight %}

These values can be useful for integrating with third-party analytics or push services or connecting with the Artisan web APIs.

<div class="note note-hint">
<p>If push is not enabled for this app or it has not yet been set by APNS, then getPushToken will return an empty string.</p>
</div>

<div id="register"></div>

##Register Custom Profile Variable

ARProfileManager is a singleton that is automatically initialized when your app starts. Convenience methods existing for registering numbers, strings, dates, and locations. The value can optionally be set during the registration of the User Profile Variable.

{% highlight objective-c %}
// Objective-C

[ARProfileManager registerNumber:@"currentCartTotal" withValue:[NSNumber numberWithDouble:0]];
[ARProfileManager registerString:@"memberType" withValue:@"unknown"];
[ARProfileManager registerVersion:@"apiVersion" withValue:@"1.2.15-beta2"];

[ARProfileManager registerDateTime:@"lastPurchase"];
[ARProfileManager registerLocation:@"lastKnownLocation"];
{% endhighlight %}

{% highlight swift %}
// Swift

ARProfileManager.registerNumber("currentCartTotal", withValue:NSNumber.numberWithDouble(0))
ARProfileManager.registerString("memberType", withValue:"unknown")
ARProfileManager.registerVersion("apiVersion", withValue:"1.2.15-beta2")

ARProfileManager.registerDateTime("lastPurchase")
ARProfileManager.registerLocation("lastKnownLocation")
{% endhighlight %}

<div class="note note-hint">
  <p>Hint: Valid characters for the variable names include [0-9], [a-z], [A-Z], -, and _. Any other characters will automatically be stripped out.</p>
  <p>For version-type variables valid version strings match what you'd expect for an Apache Maven version: the value must start with a non-zero number and can have up to three multi-digit numbers separated by periods. Optionally, a version qualifier may follow a dash at the end, as in 2.4.8-beta. For comparison purposes when building segments, the leftmost value takes precedence (i.e. 2.4.6 is less than 3.1) and the more numbers defined, the greater the value (i.e. 3.3 is less than 3.3.1). Invalid values will not be recorded.</p>
</div>

<div class="note note-hint">
  <p>If you call register for the same user profile variable more than once only the first call will succeed. Subsequent calls will be ignored.</p>
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
[ARProfileManager setVersionValue:@"1.2.16" forVariable:@"apiVersion"];
{% endhighlight %}

{% highlight swift %}
// Swift

ARProfileManager.setNumberValue(NSNumber.numberWithDouble(150.00), forVariable:"currentCartTotal")
ARProfileManager.setStringValue("platinum", forVariable:"memberType")

ARProfileManager.setDateTimeValue(NSDate(), forVariable:"lastPurchase")
ARProfileManager.setLocationValue(CLLocationCoordinate2DMake(39.949934, -75.145012), forVariable:"lastKnownLocation")
ARProfileManager.setVersionValue("1.2.16", forVariable:"apiVersion")
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
