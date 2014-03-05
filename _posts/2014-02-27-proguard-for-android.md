---
layout: docs
title: "ProGuard Configuration for Android"
author: "Artisan"
category: dev
description: "Configuring ProGuard for Artisan"
---
# ProGuard configuration for Artisan

The Artisan Android SDK is compatible with ProGuard.

You will need to add some exceptions to your ProGuard configuration file in order for Artisan to work in an obfuscated release build.

Primarily these exceptions are for Artisan's classes and dependencies, although we also will need exceptions for the method signatures of methods in your activities that take a View as an argument. This is so that we can provide our automatic instrumentation of your app via AspectJ for collecting analytics events.

##Prerequisites
* Enable ProGuard for your Android app.
* Follow the regular <a href="/dev/quickstart-for-android/">Artisan Installation instructions</a> for your project and verify that everything is working as expected when you build and run your app with Artisan from your favorite IDE.

##Configuration

In your ```proguard-project.txt``` file you will need to add the following exceptions.

{% highlight bash %}
# You probably already have this exception in place, no need to duplicate it if you do
-keep public class * extends android.app.Activity

# Keep method signatures for methods that are matched via AspectJ for Artisan analytics events
-keepclassmembers class * extends android.content.Context {
    public void *(android.view.View);
    public void *(android.view.MenuItem);
}

# Artisan and Artisan Dependencies
-keep class com.artisan.** { *; }
-keep interface com.artisan.** { *; }
-keepclasseswithmembers public class * extends com.artisan.service.ArtisanService {
    public *;
}
-libraryjars artisan_library/artisan_library_4.jar
-libraryjars artisan/aspectj-1.7.2/aspectjrt.jar
-libraryjars libs/jackson-core-2.2.3.jar:libs/jackson-annotations-2.2.3.jar:libs/jackson-databind-2.2.3.jar
-keep class com.fasterxml.jackson.** { *; }
-keep interface com.fasterxml.jackson.** { *; }
-keep class org.codehaus.jackson.** { *; }
-keep interface org.codehaus.jackson.** { *; }

# Artisan requires these attributes to remain in place to support AspectJ instrumentation
-keepattributes *Annotation*,Signature

# You can safely ignore warnings about these Artisan dependencies
-dontwarn org.joda.time.**
-dontwarn org.w3c.dom.bootstrap.**
{% endhighlight %}

##Recommended Reading

If you are interested in reading more about ProGuard and ProGuard configuration for Android, we recommend <a href="http://omgitsmgp.com/2013/09/09/a-conservative-guide-to-proguard-for-android/">this unofficial guide</a> and this <a href="http://proguard.sourceforge.net/manual/examples.html#androidapplication">official example</a>.

Official documentation is also available <a href="http://developer.android.com/tools/help/proguard.html">from the Android developer site</a> and <a href="http://stuff.mit.edu/afs/sipb/project/android/sdk/android-sdk-linux/tools/proguard/docs/index.html#manual/usage.html">from ProGuard</a>.
