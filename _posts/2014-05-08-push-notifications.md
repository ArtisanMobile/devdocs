---
layout: docs
title: "Enabling Push Notifications"
author: "Artisan"
category: dev/android
description: "Enabling Push Notifications for Android"
---
#Enabling Push Notifications

Through Artisan you can configure Campaigns to send out targeted push messages to your app users and automatically gather analytics about message open rates, and in-app behavior before and after the message. Messages can be configured from Artisan Tools to open your app or to execute a Power Hook block.

Enabling Artisan Push includes the following steps:

<ol>
  <li><a href="#gcm">Enable Google Cloud Messaging</a></li>
  <li><a href="#artisan-version">Verify Artisan SDK version and Configuration</a></li>
  <li><a href="#app-settings">Set Server API Key in Artisan Tools</a></li>
  <li><a href="#test">Send a Test Message</a></li>
  <li><a href="#done">Build your Campaigns</a></li>
</ol>

<div id="gcm"></div>

## 1. Enable Google Cloud Messaging

If you haven't already, you need to create a project for your app in the <a target="_blank" href="https://console.developers.google.com">Google Developers Console</a>. For more help see <a href="http://developer.android.com/google/gcm/gs.html">the Android developer docs for enabling GCM</a>.

Make sure that you have enabled Google Cloud Messaging for your app under APIs & auth -> APIs

<img src="/images/screens/android-push-gcm-enabled-700x219.png" />

<div class="note note-hint">
    <p>Your app will need to have the Google Play Services Library as a dependency, if it doesn't already. For more information on setting this up see <a target="_blank" href="http://developer.android.com/google/play-services/setup.html">Android docs for setting up Google Play Services</a>.
</p>
</div>


<div id="artisan-version"></div>

## 2. Verify Installed Artisan SDK Version and Configuration

### Artisan version 2.1.4 and above

Artisan Push Messaging is supported for Artisan Android SDK version 2.1.4 and above.

<div class="note note-hint">
<p>When you run the installer it will automatically add the permissions and services required to handle receiving push messages to your AndroidManifest.xml if they aren't there already.</p>

<p>This includes these permissions:</p>

<pre>
&lt;permission android:name="com.artisan.android.demo.permission.C2D_MESSAGE" android:protectionLevel="signature"/&gt;
<br/>
&lt;uses-permission android:name="com.artisan.android.demo.permission.C2D_MESSAGE"/&gt;
<br/>
&lt;uses-permission android:name="android.permission.WAKE_LOCK" /&gt;
<br/>
&lt;uses-permission android:name="com.google.android.c2dm.permission.RECEIVE"/&gt;
</pre>

<p>As well as this new receiver and service inside the application element</p>

<pre>
&lt;receiver android:name="com.artisan.push.ArtisanPushReceiver" android:permission="com.google.android.c2dm.permission.SEND"&gt;
<br/>
&nbsp;&nbsp;&lt;intent-filter&gt;
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;action android:name="com.google.android.c2dm.intent.RECEIVE" /&gt;
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;category android:name="your.package.name.here" /&gt;
<br/>
&nbsp;&nbsp;&lt;/intent-filter&gt;
<br/>
&lt;/receiver&gt;
<br/>
<br/>
  &lt;service android:name="com.artisan.push.ArtisanPushService" /&gt;
  </pre>
</div>

### Configure your Sender ID

Your Artisan Push Sender ID is the same as your Google Project Number.

<img src="/images/screens/android-push-project-number-700x285.png" />

In your Application class you need to set your Push Sender ID in the onCreate of your application before you call ArtisanManager.startArtisan.

{% highlight java %}
import com.artisan.application.ArtisanApplication;
import com.artisan.manager.ArtisanManager;

public class ArtisanDemoApplication extends ArtisanApplication {

  @Override
  public void onCreate() {
    super.onCreate();

    // Add this line to enable Artisan Push
    ArtisanManager.setPushSenderId("000012345670000");

    ArtisanManager.startArtisan(this, "YOUR_ARTISAN_APP_ID");

    // ...
  }

  // ...
}
{% endhighlight %}


<div id="app-settings"></div>

## 3. Set Server API Key in Artisan Tools

In the <a target="_blank" href="https://console.developers.google.com">Google Developers Console</a> for your project you will need to create a new Server API Key for Artisan.

Go to APIs & auth -> Credentials and create a new key, choose "Server Key" and leave the IP address field blank. For more help see <a href="http://developer.android.com/google/gcm/gs.html#access-key">the Android developer docs for obtaining a Server Access Key</a> Copy the key that is generated.

<img src="/images/screens/android-push-server-api-key-700x193.png" />

Back in Artisan Tools on the settings page for your app you can add this Server API Key to enable Artisan Push.

<img src="/images/screens/android-push-app-settings-448x350.png" />

<div id="test"></div>

## 4. Send a Test Message

Once you have added your server API key you should send a test message to your device to make sure that everything has been configured correctly.

You will need your test device's Registration ID. If you run your app from Eclipse or another IDE where you have access to LogCat you will be able to get your Registration ID--Artisan logs the ID each time the app is started up.

<img src="/images/screens/android-push-log-registration-id-700x65.png" />

<div class="note note-hint">
    <p><strong>If You Don't See your Registration Id in the logs</strong></p>
    <p></p>
    <ul>
      <li><strong>Logging connected?</strong> Check that your device is connected to LogCat and are seeing other log messages for your app. Check to make sure you aren't filtering the logs and that you have them set so that "info" level logs are visible.</li>
      <li><strong>Google Play Services installed?</strong> Check that you have Google Play Services installed and up to date on your device. You can get Google Play Services from the Play Store.</li>
      <li><strong>Sender ID</strong> Double check that the sender ID you set in your application class matches the project number of the project that you enabled Google Cloud Messaging for.</li>
      <li><strong>Permissions correct</strong> Double check that you have the correct permissions in your AndroidManifest.xml. You should have android.permission.WAKE_LOCK and com.google.android.c2dm.permission.RECEIVE</li>
      <li><strong>Artisan Version</strong> Check that you have Artisan 2.1.4 or above installed. When you start the app you should see a log message that says "Starting Artisan with App ID : 012301230123 App Version : 1.0 SDK Version : 2.1.4"</li>
    </ul>
</div>

In Artisan Tools on your app settings page there will be a new form from which you can send a test message.

<img src="/images/screens/android-push-send-test-message-439x350.png" />

If you do not see this form please make sure you have successfully set your Server API Key in step 3, above.

<div class="note note-hint">
    <p><strong>If You Don't Receive the Test Push Message</strong></p>
    <p>Depending on your network it can take a minute or more for the message to arrive. If you have waited a few minutes and still haven't received the test message there are a few things to check if you don't receive your test message:</p>
    <ul>
      <li><strong>Registration ID</strong> Double check that you correctly copied the Registration ID from the logs for your app. You should not include the part that says "Artisan Push Registration Id: ", just the letters and numbers that come after that.</li>
      <li><strong>GCM enabled?</strong> Go back to step 1 and make sure that GCM is enabled for your project in the Google Developers Console.</li>
      <li><strong>Sender ID</strong> Double check that the sender ID you set in your application class matches the project number of the project that you enabled Google Cloud Messaging for.</li>
      <li><strong>Errors?</strong> Check that there weren't any other errors logged in the console for your app.</li>
    </ul>
    <p>We are always more than happy to help! Send an email to <a href="mailto:support@useartisan.com?Subject=Artisan%20Android%20Push%20Help" target="_top">support@useartisan.com</a> or give us a call at 800.594.0401.</p>
</div>

<div id="done"></div>

## 5. Build your Campaign

Now that you have successfully set up your App with Google Cloud Messaging and configured Artisan Push you can <a href="/user-guide/campaigns">get started with Push Campaigns</a>.
