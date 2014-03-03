---
layout: docs
title: "ProGuard Configuration for Android"
author: "Artisan"
category: dev
description: "Configuring ProGuard for Artisan"
---
# ProGuard configuration for Artisan

The Artisan Android SDK is compatible with ProGuard.

You will need to add some exceptions to your ProGuard configuration file in order for Artisan to work out in production.

Primarily these exceptions are for Artisan's classes and dependencies, although we also will need exceptions for the method signatures of methods in your activities that take a View as an argument. This is so that we can provide our automatic instrumentation of your app via AspectJ for collecting analytics events.

##Prerequisites
* Enable ProGuard for your Android app.
* Follow the regular <a href="/dev/quickstart-for-android/">Artisan Installation instructions</a> for your project and verify that everything is working as expected when you build and run your app with Artisan from your favorite IDE.

##Configuration

In your ```proguard-project.txt``` file you will need to add the following exceptions.

{% highlight bash %}
# You probably already have these exceptions in place
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.view.View {
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

# Keep method signatures for methods that are used for Artisan analytics events
-keepclassmembers class * extends android.content.Context {
    public void *(android.view.View);
    public void *(android.view.MenuItem);
}

# Keep the generated aspectj files intact
# TODO you will have one of these in your gen folder for each package in your app that has activities or fragments in it. They all need to be listed here
-keep class todo.your.app.package.here.ArtisanInstrumentation

# Keep the public methods in your CustomArtisanService class
-keepclasseswithmembers public class * extends com.artisan.service.ArtisanService {
    public *;
}

# Artisan and Artisan Dependencies
-libraryjars artisan_library/artisan_library_4.jar
-keep class com.artisan.** { *; }
-keep interface com.artisan.** { *; }
-libraryjars artisan/aspectj-1.7.2/aspectjrt.jar
-libraryjars libs/httpclientandroidlib-1.1.2.jar:libs/jackson-core-2.2.3.jar:libs/otto-1.3.4.jar:libs/android-support-v4.jar:libs/jackson-annotations-2.2.3.jar:libs/jackson-databind-2.2.3.jar:libs/volley.jar
-keep class com.fasterxml.jackson.** { *; }
-keep interface com.fasterxml.jackson.** { *; }
-keep class android.support.v4.** { *; }
-keep interface android.support.v4.** { *; }
-keep class ch.boye.httpclientandroidlib.** { *; }
-keep interface ch.boye.httpclientandroidlib.** { *; }
-keep class com.android.volley.** { *; }
-keep interface com.android.volley.** { *; }
-keep class org.codehaus.jackson.** { *; }
-keep interface org.codehaus.jackson.** { *; }
-keep class com.squareup.otto.** { *; }
-keep interface com.squareup.otto.** { *; }

# Artisan requires these attributes to remain in place to support AspectJ instrumentation
-keepattributes *Annotation*,Signature,Exceptions,InnerClasses,EnclosingMethod

# You can safely ignore warnings about these Artisan dependencies
-dontwarn org.joda.time.**
-dontwarn org.w3c.dom.bootstrap.**
{% endhighlight %}

<div class="note note-important">
  <p>There is one line in the above file marked with TODO. You need to add the fully qualified package for the ArtisanInstrumentation file(s) in your gen folder. There will be one for each package in your app with activities in it.</p>
</div>

##Recommended Reading

If you are interested in reading more about ProGuard and ProGuard configuration for Android, we recommend <a href="http://omgitsmgp.com/2013/09/09/a-conservative-guide-to-proguard-for-android/">this unofficial guide</a> and this <a href="http://proguard.sourceforge.net/manual/examples.html#androidapplication">official example</a>.

Official documentation is also available <a href="http://developer.android.com/tools/help/proguard.html">from the Android developer site</a> and <a href="http://stuff.mit.edu/afs/sipb/project/android/sdk/android-sdk-linux/tools/proguard/docs/index.html#manual/usage.html">from ProGuard</a>.
