---
layout: docs
title: "Cocoapod Install for Artisan iOS"
author: "Artisan"
category: dev
description: "Cocoapod Installation for Artisan iOS SDK"
---

# Cocoapod Installation for Artisan iOS SDK

## Installing CocoaPods

If you aren't already using Cocoapods, installing CocoaPods is easy. From the terminal in your project directory:

{% highlight bash %}
$ [sudo] gem install cocoapods
$ pod setup
{% endhighlight %}

##Referencing the ArtisanSpecs Repository

The ArtisanSDK is not distributed through the CocoaPods pod spec repository. We maintain our own private spec repository to manage the different release versions of Artisan. In order to inform CocoaPods about the location of this repository you can run:

{% highlight bash %}
pod repo add ArtisanSpecs git@github.com:ArtisanMobile/ArtisanSpecs.git
{% endhighlight %}

## Creating/Editing a Podfile

In order to manage your library dependecies with CocoaPods you need to [create a podfile](http://docs.cocoapods.org/podfile.html).

Create a file called `Podfile` in the root directory of your project with the following:

{% highlight bash %}
platform :ios, '6.0'  # minimum ios version for Artisan

pod 'ArtisanSDK'
{% endhighlight %}

If you are already using CocoaPods, you can just add the pod line to your existing pod file and update the minimum iOS platform version.

The above line will use the latest version of Artisan. Should you choose to lock yourself at a version you can modify that line:
{% highlight bash %}
  pod 'ArtisanSDK', '2.1.0'
{% endhighlight %}

In order to upgrade or downgrade the version number you will need to delete the previously downloaded files from your Pods directory. From the directory containing your Podfile:

{% highlight bash %}
  rm -rf Pods/ArtisanSDK
{% endhighlight %}

## Install Dependencies

Installing your dependencies is as easy as executing `pod install` from the location of your podfile.

Should you want to update Artisan to a newer version, you can update your podfile to reflect that version and re-run `pod install`.

<div class="note note-hint">
  <p>When you install your dependencies, CocoaPods will create an _**.xcworkspace**_ for your project. You will need to open this instead of your .xcodeproj file whenever you want to work with your project from this point forward.</p>
  <p>The workspace keeps your code separate from the dependencies managed by CocoaPods while keeping track of the required build settings for each sub-project and implementing them on a per-project basis.</p>
</div>

## Enabling Artisan in Your Project

To enable Artisan at this point requires the addition of two lines to your AppDelegate file.

8\. Add the following import statement to the top of the .m file for the App Delegate:

{% highlight objective-c %}
#import <ArtisanSDK/ArtisanSDK.h>
{% endhighlight %}

<div class="note note-important">
  <p>Important: The ArtisanSDK import line should be included in your App .pch file or at the top of each class where you reference the Artisan SDK.</p>
</div>

9\. Add the following line to the bottom of the **didFinishLaunchingWithOptions:** method of the AppDelegate.

{% highlight objective-c %}
[ARManager startWithAppId:@"YOUR_APP_ID"];
{% endhighlight %}

<div class="note note-important">
  <p>Important: Make sure to fill in the parameter `startWithAppId` with your App ID, provided by us. You can find your App ID in Artisan Tools either in your getting started notification or in the settings page for your app.</p>
</div>

## Troubleshooting

If you see this error when running pod install:

{% highlight bash %}
    [!] The target `mysampletarget [Debug]` overrides the `OTHER_LDFLAGS` build setting defined in `Pods/Pods.xcconfig'.
        - Use the `$(inherited)` flag, or
        - Remove the build settings from the target.
{% endhighlight %}

You can follow these steps to fix it in xcode:
* Select your project file.
* Select your target.
* Select the Build Settings tab.
* Locate Other Linker Flags and add `$(inherited)`


If building your project after enabling the SDK through the code changes above results in an error referencing an inability to locate `<ArtisanSDK/ArtisanSDK.h>` you may need to edit your build settings on your target. To do this:

* Select your project file.
* Select your target.
* Select the Build Settings tab.
* Locate the Framework Search Paths and add `$(PODS_ROOT)/ArtisanSDK`

This should allow you to successfully build your app.
