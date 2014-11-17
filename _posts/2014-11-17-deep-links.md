---
layout: docs
title: "Deep Linking with Aritsan"
author: "Artisan"
category: dev/ios
description: "Deep Linking for iOS"
---

#Deep Linking with Artisan

Through Artisan you can leverage and track interaction with deep links for your app. Out of the box, Artisan will automatically collect analytics events for any deep link that is used to open the application. Additionally, by adding a few simple url parameters you can automatically track extra analytics information or kick of an Artisan Power Hook Block when the link is clicked. This combination makes it possible to generate targeted, dynamic deep links for your app users at any time.

If you have implemented a custom URL Scheme for your app, then Artisan will automatically record when a deep link is used and will not interfere with your existing code to handle the event and route the user to a specific location. For more information about getting started with deep links on iOS, see Apple's documentation for <a href="https://developer.apple.com/library/ios/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/Inter-AppCommunication/Inter-AppCommunication.html#//apple_ref/doc/uid/TP40007072-CH6-SW1">Implementing Custom URL Schemes</a>.

<ul>
  <li><a href="#additional-information">Tracking Additional Information</a></li>
  <li><a href="#power-hooks">Triggering Artisan Power Hook Blocks</a></li>
</ul>

<div id="additional-information"></div>

## Tracking Additional Information

To track additional information with the deep link opened event, simply include the information in the url parameters. All parameters will automatically be collected by Artisan, but there are some specific parameters that you can use which you can leverage for other features of the Artisan platform, like the shared user id for the User Profile or category structure for categorized analytics reporting.

### Parameters

<dt>SUID</dt>
<dd>The shared user ID. A foreign key for the user from another user system of record. This will be stored permanently in the shared user id in the Artisan User Profile on this device.</dd>

<dt>HSUID</dt>
<dd>The shared user ID where each character has been converted to hex for obfuscation. NOTE: If there is a SUID this parameter will be ignored.</dd>

<dt>SRC</dt>
<dd>
  <p>The channel that the deep link came from. Options are:</p>
  <ul>
  <li>WEB - Opened from mobile web</li>
  <li>EMAIL - Opened from email</li>
  <li>SMS - Opened from SMS</li>
  <li>APP - Opened from another app</li>
  <li>AD - Opened from an ad</li>
  <li>EXTENSION - Opened from a today extension</li>
  <li>ANYTHING ELSE - Something not on the list</li>
  <li>UNKNOWN (this will be the default if not specified)</li>
  </ul>
</dd>

<dt>FCID</dt>
<dd>The foreign campaign ID. A foreign key of the campaign from another campaign system of record.</dd>

<dt>FVID</dt>
<dd>The foreign variation ID. A foreign key of the variation from another campaign system of record.</dd>

<dt>ACAT</dt>
<dd>The category of the deep link event.</dd>

<dt>ASCAT</dt>
<dd>The secondary category (subcategory) of the deep link event.</dd>

<dt>ATCAT</dt>
<dd>The tertiary category (subsubcategory) of the deep link event.</dd>

<dt>ANYTHING ELSE</dt>
<dd>All other parameters will be tagged along with the deep link event. These tags will be available to you for reporting, segmentation and personalization.</dd>

### Reserved Parameters

<div class="note note-important">
  <p>The parameters <strong>ACID</strong>, <strong>VID</strong> and <strong>TTR</strong> are reserved for internal use by Artisan. These parameters are used when triggering a deep link from an Artisan Campaign via push message or In-App message.</p>
</div>

### Example:

Here's a sample URL that will open a deep link in the app and have Artisan automatically record that it came from an email and the foreign campaign ID 278730

{% highlight text %}
mysampleapp://cart?SRC=EMAIL&FCID=278730
{% endhighlight %}

<div id="power-hooks"></div>

## Triggering Artisan Power Hook Blocks

By including the PH parameter and matching the name of one of your registered Power Hook Blocks you can automatically trigger a Power Hook Block from a deep link click after the app is opened.

For more information about registering Artisan Power Hook Block see our documentation for <a href="/dev/ios/power-hooks/#code-blocks">Power Hook Code Blocks</a>.

### Power Hook Parameters

<dt>PH</dt>
<dd>The name of the Power Hook to execute.</dd>
<dt>ARPHP_*</dt>
<dd>If there are extra Power Hook parameters they should each be url parameters. Each powerhook parameter name should the prefix ARPHP_ in the URL parameter. For example, if the powerhook parameter was COUPON_CODE the URL parameter would be ARPHP_COUPON_CODE</dd>

When the deep link is clicked the Power Hook Block will be executed with the current values from Artisan with the provided parameters as the extra_data dictionary. This has a similar effect to calling:

{% highlight text %}
[ARPowerHookManager executeBlockWithId:samplePowerHookName data:powerHookParameters context:nil];
{% endhighlight %}

<div class="note note-important">
  <p>The Power Hook parameters that you pass in here are used as the extra_data for your power hook block. These may add to or override the current values configured in Artisan Tools or for any active Power Hook experiments that the user is participating in.</p>
</div>

### Example:

Here's a sample URL that will open a deep link in the app and call a Power Hook Block named "ShowCartAddDiscount" with parameters discountPercent=20 and param_couponId=XYZZY. Artisan will collect the foreign campaign ID=121121 and that this link was opened from a web link.

{% highlight text %}
artisandemo://?SRC=WEB&PH=ShowCartAddDiscount&ARPHP_discountPercent=20&ARPHP_couponId=XYZZY&FCID=121121
{% endhighlight %}
