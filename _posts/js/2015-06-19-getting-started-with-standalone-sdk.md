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