---
layout: docs
title: "Artisan Javascript API"
author: "Artisan"
category: dev/js
description: "Javascript Web API Reference Guide"
---

# Artisan Javascript Web API Reference Guide

This document provides an overview of all of the API calls available within the Artisan Javascript Web SDK.

## Table of Contents

<ul>
  <li><a href="#artisansendmethod">The send() Method</a></li>
  <li><a href="#sendcalls">Functions To Call Through send()</a>
    <ul>
      <li><a href="#sdkcontrol">SDK Control</a>
        <ul>
          <li><a href="#startartisan">send('startArtisan', appId, postInterval, tracerInterval, screenName)</a></li>
          <li><a href="#turnoff">send('turnArtisanOff'</a></li>
          <li><a href="#turnon">send('turnArtisanOn')</a></li>
          <li><a href="#removepushstate">send('removePushStateListener')</a></li>
        </ul>
      </li>
      <li><a href="#trackingapi">Tracking API</a>
        <ul>
          <li><a href="#trackEvent">send('trackEvent', eventName)</a></li>
          <li><a href="#trackEvent">send('trackEvent', eventName, parameters)</a></li>
          <li><a href="#trackEvent">send('trackEvent', eventName, parameters, category, subCategory, subSubCategory)</a></li>
        </ul>
      </li>
      <li><a href="#profileapi">Profile API</a>
        <ul>
          <li><a href="#setprofilevariable">send('setProfileVariable', property, value, valueType)</a></li>
          <li><a href="#clearprofilevariable">send('clearProfileVariable', property)</a></li>
          <li><a href="#clearprofile">send('clearProfile')</a></li>
        </ul>
      </li>
    </ul>
  </li>
</ul>

<div id="artisansendmethod"></div>

## The send() Method

### ArtisanSDK.send(functionName, parameter1, parameter2, ...)

### Parameters

* functionName: (String) The name of the function being called

* parameter1, parameter2, ... : (varies per function) The parameters to pass to the given function

The `send()` method allows all of the functionality of Artisan's analytics to be condensed into one compact function. The first parameter `send()` takes is the name of the desired function call as a string. The subsequent parameters will all be sent as parameters to the function.

<div id="sendcalls"></div>

# Functions To Call Through send()

<div id="sdkcontrol"></div>

## SDK Control

<div id="startartisan"></div>

### send("startArtisan", appId, postInterval, tracerInterval, screenName)

#### Parameters

* appId: (String) The website's ID, a 24-character alphanumerical String

* postInterval: (Int) Sets the interval, in milliseconds, at which collected analytics events are sent to Artisan [Optional, may be null]

* tracerInterval: (Int) Sets the interval, in milliseconds, at which the SDK will send the current user profile information to Artisan [Optional, may be null]

* screenName: (String) A custom name to use in place of the URL domain [Optional, may be null]

This function kickstarts the Artisan analytics functionality. The appId parameter is the only required parameter, and is client-generated. If the appId is not included, incorrect, or null, then NO analytics will be collected.

{% highlight javascript %}
ArtisanSDK.send("startArtisan", "yourAppId");
ArtisanSDK.send("startArtisan", "yourAppId", 5000);
ArtisanSDK.send("startArtisan", "yourAppId", 5000, 3600000);
ArtisanSDK.send("startArtisan", "yourAppId", 5000, 3600000, "yourScreenName");
{% endhighlight %}

<div id="turnoff"></div>

### send("turnArtisanOff")

Turn off automatic analytics tracking.

{% highlight javascript %}
ArtisanSDK.send("turnArtisanOff");
{% endhighlight %}

<div id="turnon"></div>

### send("turnArtisanOn")

Turn on automatic analytics tracking.

{% highlight javascript %}
ArtisanSDK.send("turnArtisanOn");
{% endhighlight %}

<div id="removepushstate"></div>

### send("removePushStateListener")

Turn off page view events for push states.

{% highlight javascript %}
ArtisanSDK.send("removePushStateListener");
{% endhighlight %}

<div id="trackingapi"></div>

## Tracking API

<div id="trackevent"></div>

### send("trackEvent", eventName)<br>send("trackEvent", eventName, parameters)<br>send("trackEvent", eventName, parameters, category)<br>send("trackEvent", eventName, parameters, category, subCategory)<br>send("trackEvent", eventName, parameters, category, subCategory, subSubCategory)

#### Parameters

* eventName: (String) Name of the event to track.

* parameters: (Associative Array) Context parameters to tag to the event. [Optional, may be null]

* category: (String) Category for the event for use in filtering and reporting. [Optional, may be null]

* subCategory: (String) Sub-category for the event for use in filtering and reporting. [Optional, may be null]

* subSubCategory: (String) Sub-sub-category for the event for use in filtering and reporting. [Optional, may be null]

Manually track an analytics event with the specified name.

Use the `parameters` parameter to supply additional context data in the form of key-value pairs. For instance, if you have a product page that you want to check, but you also want to be able to know which products are being viewed, you could track an event named "Viewed Product" and pass the product ID as additional data. Optionally, you can provide a category, sub-category and sub-sub-category for the event, which can be used for reporting on Artisan Tools.

{% highlight javascript %}
ArtisanSDK.send("trackEvent", "Logged In");
ArtisanSDK.send("trackEvent", "Viewed Product", {'sku':'A0123456789'});
ArtisanSDK.send("trackEvent", "Viewed Product", {'sku':'A0123456789'}, "Womens");
ArtisanSDK.send("trackEvent", "Viewed Product", {'sku':'A0123456789'}, "Womens", "Tops");
ArtisanSDK.send("trackEvent", "Viewed Product", {'sku':'A0123456789'}, "Womens", "Tops", "T-Shirts");
{% endhighlight %}

<div id="profileapi"></div>

## Profile API

<div id="setprofilevariable"></div>

### send("setProfileVariable", property, value, valueType)

#### Parameters

* property: (String) Name of the profile variable

* value: (String) A string representation of the value to store for the given property

* valueType: (String) A string representation of the datatype of the value. This can be one of `"string"`, `"datetime"`, `"float"`, `"int"`, `"geolocation"`, or `"version"`

Specify an attribute of the current user. The property can be used to store any data, from more standard categories (i.e. name, age) to specific items tailored to a specific website.

This information is added to the personalization profile of the current user for segmentation, targeting, and reporting purposes.

{% highlight javascript %}
ArtisanSDK.send("setProfileVariable", "firstName", "John", "string");
ArtisanSDK.send("setProfileVariable", "age", "23", "int");
{% endhighlight %}

<div id="clearprofilevariable"></div>

### send("clearProfileVariable", property)

#### Parameters

* property: (String) Name of the profile variable

Unset the value for a user profile variable.

Use this method to clear out the value for any custom user profile variable. This is equivalent to setting the value to `null` using the `setProfileVariable` method.

{% highlight javascript %}
ArtisanSDK.send("clearProfileVariable", "firstName");
{% endhighlight %}

<div id="clearprofile"></div>

### send("clearProfile")

Clear out all previously specified profile information for the current user.

{% highlight javascript %}
ArtisanSDK.send("clearProfile");
{% endhighlight %}