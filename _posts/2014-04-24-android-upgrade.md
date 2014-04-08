---
layout: docs
title: "Upgrading Artisan Android SDK"
author: "Artisan"
category: dev
description: "Upgrading the Artisan Android SDK"
---

# Upgrading the Artisan Android SDK

Typically upgrading is a simple process. All you need to do is get a new copy of the Artisan SDK from Artisan Tools, and expand and install it just as you did the first time. However with some versions there are additional steps required. See below for the process for upgrading from specific versions of Artisan.

As a general best practice when upgrading, you should delete the artisan directory in your project root.
{% highlight bash %}
rm -rf artisan
{% endhighlight %}

## Upgrading from Artisan 2.0.17 and below (Version installed before April 24, 2014)

<div class="note note-important">
  <p>Artisan Android 2.0.17 and below all used AspectJ. <strong>As of Artisan 2.0.18 the new default for Artisan Android does not use AspectJ</strong>, although that is still an option for auto-instrumentation. If you wish to continue using <a href="/dev/android-aspectj/">Artisan Auto-Instrumentation with AspectJ</a> you may, but you should still complete the steps below.</p>
</div>

If you are upgrading from Artisan 2.0.17 and below, then there are a few steps you will need to take to transition:

### 1\. Remove AspectJ Nature

In Eclipse, remove the AspectJ project nature by right clicking on your project and choosing AspectJ Tools -> Remove AspectJ Nature

<div class="note note-hint">
  <p>You may skip this step if you would like to opt to continue using <a href="/dev/android-aspectj/">Artisan Auto-Instrumentation with AspectJ</a>.</p>
</div>

### 2\. Remove old Artisan jar from Build Path

Also in Eclipse remove the **artisan_library_4.jar** from your Java Build Path. To do this right click on your project in the Project Explorer again and choose \"Properties\". Then in the list on the left, click on \"Java Build Path\" and select the **artisan_library_4.jar** if it is there and click the \"Remove\" button.

* You may see compile errors in Eclipse when you do this. They will be resolved when you complete the installation of the new version of Artisan.

<div class="note note-hint">
  <p>If you are going to continue using <a href="/dev/android-aspectj/">Artisan Auto-Instrumentation with AspectJ</a> you also should remove the old jar from your AspectJ inpath as well.</p>
</div>

### 3\. Clean out old Artisan artifacts

As with all upgrades, you should start by removing the artisan folder in the root of your project directory. You can also remove the artisan_library folder because you won't be needing that anymore.

{% highlight bash %}
rm -rf artisan artisan_library
{% endhighlight %}

### 4\. Remove old Artisan Dependencies

You can safely remove any dependencies from your libs folder that were added when you first installed Artisan, assuming that your app doesn't also depend on them. Artisan's old dependencies were:

<ul>
    <li>android-support-v4.jar</li>
    <li>httpclientandroidlib-1.1.2.jar</li>
    <li>jackson-annotations-2.2.3.jar</li>
    <li>jackson-core-2.2.3.jar</li>
    <li>jackson-databind-2.2.3.jar</li>
    <li>otto-1.3.4.jar</li>
    <li>volley.jar (built from source)</li>
</ul>

### 5\. Clean up IntelliJ and Ant config (if applicable)

If you had set up your IntelliJ or Ant project for Artisan AspectJ you can remove that special configuration unless you are opting to continue using <a href="/dev/android-aspectj/">Artisan Auto-Instrumentation with AspectJ</a>.

Details about what that configuration was can be found on <a href="/dev/android-aspectj/">the Artisan AspectJ page</a>.

### 6\. Proceed with Installation

Enjoy a leaner and simpler Artisan SDK! Please follow <a href="/dev/quickstart-for-android/">new Android installation instructions</a> to complete the installation of the Artisan SDK.

<div class="note note-hint">
  <p>If you are opting to continue using Artisan Auto-Instrumentation with AspectJ please use <a href="/dev/android-aspectj/">these instructions</a> instead.</p>
</div>
