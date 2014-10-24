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

You can delete it from your filesystem explorer, Finder, or from your favorite IDE. Or, you can delete it from a terminal:

{% highlight bash %}
# run this in a terminal
# navigate to your project's root folder (where AndroidManifest.xml is)
rm -rf artisan
{% endhighlight %}

<div class="note note-hint">
  <p>Questions about installing or upgrading? We are always more than happy to help! Send an email to <a href="mailto:support@useartisan.com?Subject=Android%20SDK%20Upgrade%20Help" target="_top">support@useartisan.com</a> or give us a call at 800.594.0401.</p>
</div>

## Upgrading from Artisan 2.1.0 to 2.1.1+

As of Artisan 2.1.1 we have moved the location of that Artisan initialization from a sublcass of the ArtisanService to your Application class.

### 1\. Go ahead and run the installer for the latest version of Artisan

{% highlight bash %}
# run this in a terminal
# navigate to your project's root folder (where AndroidManifest.xml is)
rm -rf artisan
{% endhighlight %}

In a terminal, go to the artisan directory inside your project\'s root directory and run:

* install.bat (on Windows)
* sh install.sh (on Mac/OSX or linux)

### 2\. Update your Application class to extend ArtisanApplication or implement ArtisanRegisteredApplication

Your Application Class needs to extend our class or implement our interface. Create a new Application class if you don't already have one.

{% highlight java %}
    import com.artisan.application.ArtisanApplication;

    public class MySampleApplication extends ArtisanApplication {
{% endhighlight %}

OR

{% highlight java %}
    import com.artisan.application.ArtisanRegisteredApplication;

    public class MySampleApplication extends Application implements ArtisanRegisteredApplication {
{% endhighlight %}

<div class="note note-hint">
FYI, if you just created your Application class, you have to reference it in the android:name property of the &lt;application&gt; element in your AndroidManifest.xml.

{% highlight java %}
<application android:name=".MySampleApplication" ...>
{% endhighlight %}
</div>

### 3\. Implement required methods for ArtisanRegisteredApplication

The ArtisanRegisteredApplication has three required methods on it: **registerUserProfileVariables**, **registerPowerhooks**, and **registerInCodeExperiments**.

* Since you are upgrading you may have implemented these methods on your CustomArtisanService. If so, you can simply move those methods from your CustomArtisanService to your Application class.

Feel free to copy and paste these samples:

{% highlight java %}
/**
 * Register your Artisan Power Hook variables and Power Hook blocks here
 *
 * For example:
 *
 * PowerHookManager.registerVariable("WelcomeText", "Welcome Text Sample PowerHook", "Welcome to Artisan!");
 *
 * <code>
 *  HashMap<String, String> defaultData = new HashMap<String, String>();
 *  defaultData.put("discountCode", "012345ABC");
 *  defaultData.put("discountAmount", "25%");
 *  defaultData.put("shouldDisplay", "true");
 *
 *  PowerHookManager.registerBlock("showAlert", "Show Alert Block", defaultData, new ArtisanBlock() {
 *    public void execute(Map<String, String> data, Map<String, Object> extraData) {
 *      if ("true".equalsIgnoreCase(data.get("shouldDisplay"))) {
 *        StringBuilder message = new StringBuilder();
 *        message.append("Buy another for a friend! Use discount code ");
 *        message.append(data.get("discountCode"));
 *        message.append(" to get ");
 *        message.append(data.get("discountAmount"));
 *        message.append(" off your purchase of 2 or more!");
 *        Toast.makeText((Context) extraData.get("context"), message, Toast.LENGTH_LONG).show();
 *      }
 *    }
 * });
 * </code>
 *
 * More examples at http://docs.useartisan.com/dev/quickstart-for-android/#power-hooks
 *
 */
@Override
public void registerPowerhooks() {

}

/**
 * Register your Artisan In-code Experiments here
 *
 * For example:
 *
 * ArtisanExperimentManager.registerExperiment("my first experiment");
 * ArtisanExperimentManager.addVariantForExperiment("blue variation", "my first experiment");
 * ArtisanExperimentManager.addVariantForExperiment("green variation", "my first experiment");
 *
 * More examples at http://docs.useartisan.com/dev/quickstart-for-android/#in-code
 */
@Override
public void registerInCodeExperiments() {

}

/**
 * Register your Artisan In-code Experiments here
 *
 * For example:
 *
 * ArtisanProfileManager.registerDateTime("lastSeenAt", new Date());
 * ArtisanProfileManager.registerLocation("lastKnownLocation");
 * ArtisanProfileManager.registerNumber("totalOrderCount", ArtisanDemoApplication.totalOrderCount);
 * ArtisanProfileManager.registerString("visitorType", "anonymous");
 * ArtisanProfileManager.setGender(Gender.Female);
 * ArtisanProfileManager.setUserAge(29);
 * ArtisanProfileManager.setSharedUserId("abcdef123456789");
 * ArtisanProfileManager.setUserAddress("234 Market Street, Philadelphia, PA 19106");
 *
 * More examples at http://docs.useartisan.com/dev/quickstart-for-android/#api
 */
@Override
public void registerUserProfileVariables() {

}
{% endhighlight %}
### 4\. Move startArtisan code

Your CustomArtisanService probably has code like this:

{% highlight java %}
public class CustomArtisanService extends ArtisanService {

  @Override
  public void startArtisanManager(ArtisanManager artisanManager) {
      // REMOVE THIS
      artisanManager.start("52a5d8482b222086ae00001f");
  }
{% endhighlight %}

This should move to your Application class onCreate method in a new form:

{% highlight java %}
import com.artisan.application.ArtisanApplication;
import com.artisan.manager.ArtisanManager;

public class MySampleApplication extends ArtisanApplication {

  @Override
  public void onCreate() {
      super.onCreate();
      // ADD THIS, pass in a reference to your Application class and your Artisan AppID
      ArtisanManager.startArtisan(this, "52a5d8482b222086ae00001f");
  }
{% endhighlight %}

### 5\. Update your AndroidManifest.xml to remove the old Service class

Remove this from your AndroidManifest.xml
{% highlight java %}
<service android:name=".CustomArtisanService"/>
{% endhighlight %}

And add this if it isn't there already. If you ran the installer in Step 1, then this should already be in your manifest:

{% highlight java %}
<service android:name="com.artisan.services.ArtisanService"/>
{% endhighlight %}

You can actually delete the CustomArtisanService file now, assuming that you have moved all of the user profile variable, power hook and in-code experiment configuration to your Application class already.

All done! With this change we have solved issues where the Artisan API wasn't always ready in th onCreate, onStart, or onResume for the first Activity of the app.

## Upgrading from Artisan 2.0.x (Version installed before April 30, 2014)

<div class="note note-important">
  <p>Artisan Android 2.0.x used AspectJ. <strong>As of Artisan 2.1.0 the new default for Artisan Android does not use AspectJ</strong>, although that is still an option for auto-instrumentation. If you wish to continue using <a href="/dev/android-aspectj/">Artisan Auto-Instrumentation with AspectJ</a> you may, but you should still complete the steps below.</p>
</div>

If you are upgrading from Artisan 2.0.x, then there are a few steps you will need to take to transition:

### 1\. Remove AspectJ Nature

In Eclipse, remove the AspectJ project nature by right clicking on your project and choosing AspectJ Tools -> Remove AspectJ Nature

<img src="/images/remove_aspectj_capability.png" />

<div class="note note-hint">
  <p>You may skip this step if you would like to opt to continue using <a href="/dev/android-aspectj/">Artisan Auto-Instrumentation with AspectJ</a>.</p>
</div>

### 2\. Remove old Artisan jar from Build Path

Also in Eclipse remove the **artisan_library_4.jar** from your Java Build Path.

<ol>
  <li>Right click on your project in the Project Explorer again and choose "Properties"</li>
  <li>Then in the list on the left, click on "Java Build Path"</li>
  <li>Select the <strong>artisan_library_4.jar</strong> if it is there</li>
  <li>Click the "Remove" button</li>
</ol>

<img src="/images/remove_old_android_jar.png" />

* You may see compile errors in Eclipse when you do this. They will be resolved when you complete the installation of the new version of Artisan.

<div class="note note-hint">
  <p>If you are going to continue using <a href="/dev/android-aspectj/">Artisan Auto-Instrumentation with AspectJ</a> you also should remove the old jar from your AspectJ inpath as well.</p>
</div>

### 3\. Clean out old Artisan artifacts

As with all upgrades, you should start by removing the artisan folder in the root of your project directory. You can also remove the artisan_library folder because you won't be needing that anymore.

You can delete these folders from your filesystem explorer, Finder, or from your favorite IDE. Or, you can delete it from a terminal:

{% highlight bash %}
# run this in a terminal
# navigate to your project's root folder (where AndroidManifest.xml is)
rm -rf artisan artisan_library
{% endhighlight %}

### 4\. Remove old Artisan Dependencies

You can safely remove any dependencies from your libs folder that were added when you first installed Artisan, <strong>assuming that your app doesn't also depend on them</strong>. Artisan's old dependencies were:

<ul>
    <li>android-support-v4.jar</li>
    <li>httpmime-4.2.1.jar</li>
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
