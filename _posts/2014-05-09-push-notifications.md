---
layout: docs
title: "Enabling Push Notifications"
author: "Artisan"
category: dev/ios
description: "Enabling Push Notifications for iOS"
---
#Enabling Push Notifications

Through Artisan you can configure Campaigns to send out targeted push messages to your app users and automatically gather analytics about message open rates, and in-app behavior before and after the message. Messages can be configured from Artisan Tools to open your app or to execute a Power Hook block.

Enabling Artisan Push includes the following steps:

<ol>
  <li><a href="#apn">Enable Apple Push Notifications for Your App</a></li>
  <li><a href="#artisan-version">Verify Artisan SDK version</a></li>
  <li><a href="#app-certificates">Add your Apple Push Certificate to Artisan Tools</a></li>
  <li><a href="#app-settings">Register for Push Notifications in your SDK</a></li>
  <li><a href="#test">Send a Test Message</a></li>
  <li><a href="#done">Build your Campaigns</a></li>
</ol>

<div id="apn"></div>

## 1. Enable Apple Push Notifications for Your App

In the <a href="https://developer.apple.com/account/overview.action" target="_blank">Apple Developer Member Center</a>, go to "Identifiers" under iOS Apps.

On the left, select "App IDs" unde "Identifiers" and click on your App. If Push Notifications is not marked as "Enabled" then click "Edit" and enable Push Notifications

<img src="/images/screens/ios-push-check-enabled-700x465.png" />

Next you will need to get the SSL Certificate from Apple for this App with Push Enabled. For more help see <a href="https://developer.apple.com/library/ios/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Chapters/ProvisioningDevelopment.html">iOS Developer Docs on Provisioning for APN</a>.

<div id="artisan-version"></div>

## 2. Verify Installed Artisan SDK Version

Artisan Push Messaging is supported for Artisan iOS SDK version 2.1.2 and above.

<div id="app-certificates"></div>

## 3. Add your Apple Push Certificate to Artisan Tools

Back in Artisan Tools on the settings page for your app you can upload your APN SSL Certificate to Artisan. You will need either the .p12 or .pem file created from the APN certificate, and it's password if any was set during creation.

<img src="/images/screens/ios-push-app-settings-500x500.png" />

<div class="note note-important">
  <p>NOTE: You will only be able to upload one APN certificate per Artisan application. You should use the development environment APN certificate for your development provisioning profile built applications and the production environment APN certificate for your App Store or Ad Hoc provisioning profile built applications. We'll determine which type of certificate you've uploaded and inform you in your app settings if you're unsure which you have.</p>
</div>

<div id="app-settings"></div>

## 4. Register for Push Notifications in your SDK

Within your iOS application, you will need to confirm that your app has registered with Apple to receive push notifications.  That means that you should have the following code in the **didFinishLaunchingWithOptions:** method in Objective-C, **application** method in Swift, of your main app delegate:

{% highlight objective-c %}
// Objective-C

// Register for push
[[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
{% endhighlight %}

{% highlight swift %}
// Swift

// Register for push
UIApplication.sharedApplication().registerForRemoteNotificationTypes(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)
{% endhighlight %}

You will also want to confirm that 'Remote notifications' are enabled within the 'Capabilities' section of the build target for your app.  In XCode, access the control panel for your build target, navigate to the 'Capabilities' tab, and ensure that 'Background Modes' is set to 'ON' and 'Remote notifications' is checked.

<img src="/images/screens//ios-push-build-target-settings-700x581.png" />

See <a href="http://developer.apple.com/library/ios/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Chapters/IPhoneOSClientImp.html#//apple_ref/doc/uid/TP40008194-CH103-SW2">Apple's iOS Developer documentation</a> for additional information on how to register your app to receive push notifications.

<div class="note note-important">
  <p>NOTE: If you are using Artisan in conjunction with another Push Notification SDK (such as Parse or Urban Airship), and are already registering for push notifications through their APIs, you will not need to re-register via the registerForRemoteNotificationTypes call to use Artisan Push Notifications.</p>
</div>

<div id="test"></div>

## 5. Send a Test Message

Once you have added your Apple Push Certificate you should send a test message to your device to make sure that everything has been configured correctly.

You will need your test device's push token. If you run your app from XCode you should see your device token in the console soon after your app starts.

<img src="/images/screens/ios-push-device-token-700x41.png" />

In Artisan Tools on your app settings page there will be a new form from which you can send a test message.

<img src="/images/screens/ios-push-send-test-message-427x350.png" />

<div class="note note-hint">
    <p><strong>If You Don't Receive the Test Push Message</strong></p>
    <p>Depending on your network it can take a minute or more for the message to arrive. If you have waited a few minutes and still haven't received the test message there are a few things to check:</p>
    <ul>
      <li><strong>Device Token</strong> Double check that you correctly copied the device token from the logs for your app.</li>
      <li><strong>Certificates</strong> Double check that you have uploaded the correct certificate for your app. The type of the uploaded certificate needs to match the type of provisioning profile that you are building with in XCode. Development builds will only receive notifications from a development certificate and distribution builds will only receive notifications from a production certificate.</li>
      <li><strong>Errors?</strong> Check that there weren't any other errors logged in the console for your app.</li>
    </ul>
    <p>We are always more than happy to help! Send an email to <a href="mailto:support@useartisan.com?Subject=Artisan%20iOS%20Push%20Help" target="_top">support@useartisan.com</a>.</p>
</div>

<div id="done"></div>

## 6. Build your Campaign

Now that you have successfully set up your App with Artisan Push you can <a href="/user-guide/campaigns">get started with Push Campaigns</a>.
