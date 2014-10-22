---
layout: docs
title: "Artisan Javascript API"
author: "Artisan"
category: dev/js
description: "Getting Started with the Artisan Javascript SDK"
---

# Getting Started with the Artisan Javascript SDK

The Artisan SDK doesn't end with just your native code -- it can be integrated with your Android and iOS WebViews to provide all of the same capability for your HTML5 code.  This capability includes:

* Automatic analytics collection for all pageviews, buttons, and links.
* Power Hooks support.
* Ability to update Artisan User Profile data.
* Full in-code A/B testing support.

This guide walks through how to get the Artisan SDK integrated with the HTML5 code in your app, as well as the best way to use the Artisan Javascript APIs.

<ul>
  <li><a href="#installation">Installation</a></li>
  <li><a href="#collectinganalytics">Collecting Analytics</a></li>
  <li><a href="#runningexperiments">Running A/B Experiments</a></li>
  <li><a href="#usingpowerhooks">Using Power Hooks</a></li>
</ul>

<div id="installation"></div>

## Installation

### iOS

To enable usage of the Artisan Javascript API within a UIKit WebView, you'll want to add the following line of code to the `<head>` tag of your HTML document:

{% highlight html %}
<script type="text/javascript" src="https://cdn-api.artisantools.com/1.4/ArtisanSDK-min.js"></script>
{% endhighlight %}

This will import the Artisan Javascript API into the page and will enable all of the methods defined in the [Javascript API Reference Guide]({% post_url 2014-07-18-hybrid-sdk-reference-guide %}).
Your view controller must implement the UIWebViewDelegate protocol.

{% highlight html %}
@interface ViewController : UIViewController <UIWebViewDelegate> {
...
}
{% endhighlight %}

Then set viewController as the webView's delegate:

<img src="/images/webviewdelegate.png" height="402" width="529" alt="The Artisan Campaign Types." />

The Artisan iOS SDK will take care of the rest.

### Android

Add the following line of code to the `onCreate` method of the Activity containing your WebView:

{% highlight java %}
ArtisanJavascriptBridge.addArtisanJavascriptInterfaceToWebView(this, [YOUR_WEB_VIEW]);
{% endhighlight %}

This will enable Javascript in your WebView and will allow the Artisan Android SDK to communicate with the Artisan Javascript API.

To then use the Artisan Javascript API within that WebView, you'll want to add the following line of code to the `<head>` tag of your HTML document:

{% highlight html %}
<script type="text/javascript" src="https://cdn-api.artisantools.com/1.4/ArtisanSDK-min.js"></script>
{% endhighlight %}

This will import the Artisan Javascript code into the page and will enable all of the calls defined in the [Javascript API Reference Guide]({% post_url 2014-07-18-hybrid-sdk-reference-guide %}).

<div id="collectinganalytics"></div>

## Collecting Analytics

### Automatic Instrumentation

Once the SDK Javascript file is included in your HTML document, Artisan will automatically track the following events:

* All pageviews, with the location set to the URL of the current document.
* All `click` events on all `<button>` elements that have an `id` or `name` attribute defined.
* All `click` events on all `<a>` elements that have an `id`, `name`, or `href` attribute defined.

These events will appear in the Artisan Events and Retention reports just like the events Artisan tracks within the native iOS and Android code.

### Manual Instrumentation

Artisan also provides the ability to manually track analytics events wihtin your Javascript code.  The [`trackEvent(eventName)`]({% post_url 2014-07-18-hybrid-sdk-reference-guide %}#trackEvent) and [`trackEvent(eventName, parameters)`]({% post_url 2014-07-18-hybrid-sdk-reference-guide %}#trackEvent) methods are available to record any event and bundle them with additional context.  You can then bind these API calls to event listeners or call them manually to send additional information to Artisan.

### Commerce Instrumentation

Shopping cart workflows can be tracked through the dedicated [Artisan JS Purchase Workflow API]({% post_url 2014-07-18-hybrid-sdk-reference-guide %}#purchaseworkflowapi).  This set of calls can be used to record when specific products are viewed, what products have been added or removed from the user's shopping cart, and what the final status is of the user's shopping transaction (including what products were ultimately purchased or abandoned).

### User Profile Management

The Javascript API enables you access to the user's Artisan Profile, including all profile information already tracked via the native SDK.  Use the [Javascript Profile API]({% post_url 2014-07-18-hybrid-sdk-reference-guide %}#profileapi) to record additional information about this user, which will automatically be attached to all recorded analytics events and used in real-time as part of Artisan segmentation.

<div id="runningexperiments"></div>

## Running A/B Experiments

The Artisan Javascript API includes the [Experiment API]({% post_url 2014-07-18-hybrid-sdk-reference-guide %}#experimentapi), which offers the same in-code A/B testing capability present in the Native SDKs.  

Register your in-code A/B tests in your native wrapper (via the `registerExperiment` and `addVariant` methods in the Artisan ExperimentManager), and then define how different variants will behave in your WebView by wrapping pieces of your JS code with `if` statements using the [`isCurrentVariantForExperiment(variantName, experimentName)`]({% post_url 2014-07-18-hybrid-sdk-reference-guide %}#iscurrentvariantforexperiment) method.  You can also manually specify your test entrance and conversion points via the Experiment API, allowing fine-grained control over how conversion rate is calculated for your test.  

These Javascript API methods work interchangeably with their Native SDK equivalents, so an Artisan in-code A/B test can be implemented partially in native code and partially through the Javascript API with no additional glue code necessary.  Just use the same experimentName throughout all calls to the Native and Javascript Experiment APIs and it will all be treated as the same test.

<div id="usingpowerhooks"></div>

## Using Power Hooks

Artisan Power Hooks are fully accessible within WebViews via the [Power Hook API]({% post_url 2014-07-18-hybrid-sdk-reference-guide %}#powerhookapi).  All Power Hooks registered in the native wrapper are available via the [`getValueForHookById(id)`]({% post_url 2014-07-18-hybrid-sdk-reference-guide %}#getvaluebyhookid) method, which will return as String whatever value of that Power Hook has most recently been retrieved from Artisan.
