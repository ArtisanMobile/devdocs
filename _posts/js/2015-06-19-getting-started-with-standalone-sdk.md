---
layout: docs
title: "Artisan Javascript API"
author: "Artisan"
category: dev/js
description: "Getting Started with the Artisan Javascript Web SDK"
---

# Getting Started with the Artisan Javascript Web SDK

<ul>
  <li><a href="#installation">Installation</a></li>
  <li><a href="#collectinganalytics">Collecting Analytics</a></li>
</ul>

<div id="installation"></div>

## Installation

{% highlight html %}
<script type="text/javascript">
!function(e){window.ArtisanSDK={sendQ:[],setProfileQ:[],setProfileVariable:function(){ArtisanSDK.setProfileQ.push(arguments)},send:function(){ArtisanSDK.sendQ.push(arguments)}},e?ArtisanSDK.send("turnArtisanOff"):(Element.prototype._addEventListener=Element.prototype.addEventListener,Element.prototype.addEventListener=function(e,t,n){if("click"===e){var s=function(n){ArtisanSDK.send("trackWebViewElementEvent",e,n.target),t.apply(this,arguments)};this._addEventListener(e,s,n)}else this._addEventListener(e,t,n)});var t=document.createElement("script");t.async=!0,t.src="http://version.artisantools.com.s3.amazonaws.com/ArtisanSDK-web.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(t,n)}();

ArtisanSDK.send("startArtisan", YOUR_APP_ID, POST_INTERVAL, TRACER_INTERVAL, YOUR_SCREEN_NAME);
</script>
{% endhighlight %}

<div id="collectinganalytics"></div>

## Collecting Analytics

### Automatic Instrumentation

Once the Javascript Web SDK code block is included in your HTML document, Artisan will automatically track the following events:

* Pageviews will be recorded with URL of the current document. If no document name can be determined, the pageview will be omitted.
* All `click` events on all HTML elements with click handler(s) assigned will be recorded, whether dynamically loaded or included at the time the page is loaded.
* All `click` events on anchors and buttons will be sent even if no click handler is defined.
* All `click` events will be sent using the following attributes (in priority order) as an identifier: "name", "ng:click", "ng-click", "href", "id"
* If you prefer to assign your own identifier, you can add an attribute called "artisanName" which will override the identifier collected from the attributes listed above.

These events will appear in the Artisan Events and Retention reports.