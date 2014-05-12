---
layout: docs
title: "User Profiles"
author: "Artisan"
category: dev/android
description: "User profile management with the Artisan Android SDK"
---

#User Profiles

Artisan accepts user profile data for advanced segmentation, targeting and personalization capabilities.

##Register User Profile Variables

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

##Update User Profile Variables

The updating of the User Profile Variable can be accomplished by calling the matching setter for the User Variable Variable data type.

{% highlight java %}
ArtisanProfileManager.setStringValue("memberType", "platinum");
ArtisanProfileManager.setDateTimeValue("lastSeenAt", new Date());
ArtisanProfileManager.setLocationValue("lastKnownLocation", new ArtisanLocationValue(39.949920, -75.145102));
ArtisanProfileManager.setNumberValue("totalOrderCount", 9);
{% endhighlight %}

##Clear User Profile Variables

The **clearProfile** method will clear out the values associated with the registered User Profile Variables.

{% highlight java %}
ArtisanProfileManager.clearProfile();
{% endhighlight %}

##Register the Shared User ID
The **sharedUserId** User Profile Variable is used to uniquely indentify an app user and will be associated with all user events.

{% highlight java %}
ArtisanProfileManager.setSharedUserId("abcdef123456789");
{% endhighlight %}

<div class="note note-important">
  <p>Important: The sharedUserId should NOT be any of the following: email address, phone number, or social security number.  The sharedUserId should uniquely identify the user in your system.</p>
</div>