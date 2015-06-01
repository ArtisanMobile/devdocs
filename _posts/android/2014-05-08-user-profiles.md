---
layout: docs
title: "User Profiles"
author: "Artisan"
category: dev/android
description: "User profile management with the Artisan Android SDK"
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

<dt>App Version</dt><dd>The version name of your app from your Android Manifest. The value is from PackageInfo.versionName (Available in Artisan SDK 2.4.0 and above).</dd>
<dt>App Build Number</dt><dd>The version number of your app from your Android Manifest. The value is from PackageInfo.versionCode (Available in Artisan SDK 2.4.0 and above).</dd>
<dt>Device Type</dt><dd>Phone or Tablet depending on if the screen is at least approximately 480x640 dp units.</dd>
<dt>Hardware Type</dt><dd>The return value from android.os.Build.MODEL.</dd>
<dt>Language</dt><dd>This is equal to the value returned from the device's default locale's language.</dd>
<dt>Last Session Date</dt><dd>The date of the second to last time the user started the app</dd>
<dt>Minutes from GMT</dt><dd>Minutes from GMT for the device's timezone.</dd>
<dt>OS Version</dt><dd>The return value from android.os.Build.VERSION.RELEASE, like "5.0.1".</dd>
<dt>OS Name</dt><dd>For android apps this is "Android".</dd>
<dt>Push Enabled</dt><dd>Whether or not push messaging is enabled via Google Cloud Messaging for the device and user.</dd>
<dt>Session Count</dt><dd>The total number of times the user has opened your app. A session begins when the app is foregrounded and ends when it is backgrounded.</dd>

Additionally, there are several profile dimensions that we have pre-defined for you. By default the values will be empty, but you can use the provided API calls to set the value. This new value will be used as part of this user's personalization profile, and will be used from this point forward for segmentation, targeting, and reporting purposes.

Specify the gender and age of the current user:

{% highlight java %}
ArtisanProfileManager.setGender(Gender.Female);
ArtisanProfileManager.setUserAge(29);
{% endhighlight %}

Set the name of the user:

{% highlight java %}
ArtisanProfileManager.setUserPrefix("Dr.");
ArtisanProfileManager.setUserFirstName("Arty");
ArtisanProfileManager.setUserMiddleName("Sans");
ArtisanProfileManager.setUserLastName("Elibom");
ArtisanProfileManager.setUserSuffix("III");
{% endhighlight %}

You can record information about the source of this user and when they first started using your app or service:

{% highlight java %}
ArtisanProfileManager.setUserReferralSource("Bob");
ArtisanProfileManager.setUserFirstSeen(new Date());
ArtisanProfileManager.setUserSignUpDate(new Date());
{% endhighlight %}

### Physical and Virtual Addresses

You can record information about the users physical and virtual addresses:

{% highlight java %}
ArtisanProfileManager.setUserStreetAddress("234 Market Street");
ArtisanProfileManager.setUserStreetAddress2("4th Floor");
ArtisanProfileManager.setUserCompany("Artisan Mobile Inc.");
ArtisanProfileManager.setUserCity("Philadelphia");
ArtisanProfileManager.setUserStateProvince("PA");
ArtisanProfileManager.setUserPostalCode("19106");
ArtisanProfileManager.setUserCountry("USA");

ArtisanProfileManager.setUserAvatarURL("http://useartisan.com/wp-content/themes/artisan-mf/images/role_developer.svg");
ArtisanProfileManager.setUserFacebook("Arty Sans");
ArtisanProfileManager.setUserTwitterName("ArtisanMobile");
ArtisanProfileManager.setUserUrl("http://useartisan.com");

ArtisanProfileManager.setUserPhoneNumber("555-555-1234");
ArtisanProfileManager.setUserEmail("sales@useartisan.com");
{% endhighlight %}

###User Preferences

You can record contact information and preferences that the user has set in your app or service related to those contact paths:

{% highlight java %}
ArtisanProfileManager.setOptedOutOfEmail(false);
ArtisanProfileManager.setOptedOutOfPush(true);
ArtisanProfileManager.setOptedOutOfText(true);
{% endhighlight %}

<div class="note note-important">
NOTE: If you are using Artisan Push, then by default Artisan will assume push messaging is enabled as long as the user has Google Play Services installed on their device and we can successfully get a device token for their device. If you set opted out of push to true for a given user profile then we will not send any Artisan Pushes to that device.
</div>

<div id="sharedid"></div>

##Shared User ID
The **sharedUserId** User Profile Variable is used to uniquely identify an app user and will be associated with all user events.

{% highlight java %}
ArtisanProfileManager.setSharedUserId("abcdef123456789");
{% endhighlight %}

<div class="note note-important">
<p>Important: The sharedUserId should NOT be any of the following: email address, phone number, or social security number.  The sharedUserId should uniquely identify the user in your system.</p>
</div>

<div id="artisan-id"></div>

##Getting the Artisan ID and Push Token

The ArtisanProfileManager can be used to access the Artisan ID for the current device as well as the Push Token from Google Cloud Messaging, if it is enabled for your app.

{% highlight java %}
String artisanId = ArtisanProfileManager.getArtisanId();
String pushToken = ArtisanProfileManager.getPushToken();
{% endhighlight %}

These values can be useful for integrating with third-party services or connecting with the Artisan web APIs.

<div class="note note-hint">
<p>If push is not enabled for this app or it has not yet been set by GCM, then getPushToken will return an empty string.</p>
</div>

<div id="register"></div>

##Register Custom Profile Variable

ArtisanProfileManager is a singleton that is automatically initialized when your app starts. Convenience methods existing for registering numbers, strings, dates, and locations. The value can optionally be set during the registration of the User Profile Variable.

This declaration should occur in the <strong>registerUserProfileVariables</strong> method of your Application class.

{% highlight java %}
@Override
public void registerUserProfileVariables() {
  ArtisanProfileManager.registerDateTime("lastSeenAt", new Date());
  ArtisanProfileManager.registerLocation("lastKnownLocation", new ArtisanLocationValue(39.949920,-75.145102));
  ArtisanProfileManager.registerNumber("totalOrderCount", 9);
  ArtisanProfileManager.registerString("memberType", "gold");
}
{% endhighlight %}

For numeric values you can pass in any java.lang.Number type

{% highlight java %}
ArtisanProfileManager.registerNumber("currentCartTotal double", 146.99); // double
ArtisanProfileManager.registerNumber("currentCartTotal float", 146.99f); // float
ArtisanProfileManager.registerNumber("currentCartTotal int", 146); // int
{% endhighlight %}

<div class="note note-hint">
  <p>Hint: Valid characters for variable names include [0-9], [a-z], [A-Z], -, and _. Any other characters will automatically be stripped out.</p>
</div>

<div id="update"></div>

##Update Profile Variable

The updating of the User Profile Variable can be accomplished by calling the matching setter for the User Variable Variable data type.

{% highlight java %}
ArtisanProfileManager.setStringValue("memberType", "platinum");
ArtisanProfileManager.setDateTimeValue("lastSeenAt", new Date());
ArtisanProfileManager.setLocationValue("lastKnownLocation", new ArtisanLocationValue(39.949920, -75.145102));
ArtisanProfileManager.setNumberValue("totalOrderCount", 9);
{% endhighlight %}

<div id="clear"></div>

##Clear Profile Variable

The **clearProfile** method will clear out the values associated with the registered User Profile Variables.

The **clearVariableValue** method will clear out the value for a single profile variable.

{% highlight java %}
ArtisanProfileManager.clearProfile();
ArtisanProfileManager.clearVariableValue("memberType");
{% endhighlight %}
