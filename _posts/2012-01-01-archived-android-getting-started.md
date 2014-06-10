---
layout: docs
title: "Quickstart for Android"
author: "Artisan"
category: dev
description: "Getting started with the Artisan MEM platform for developers."
---
#Artisan Quickstart Guide for Android

##Prerequisites
* Android App with a minimum SDK of no less than Android 2.3.3 (API 10) and build against the latest Android SDK.

<div class="note note-hint">
If you are upgrading from an older version of Artisan please see the <a href="/dev/android-upgrade/">Artisan upgrade instructions</a>.
</div>

##Adding Artisan to Your App

###Option 1: Automatically Instrumenting your App with Artisan

Artisan comes bundled with an installer that will configure Eclipse and add the necessary files to your source root. It will also edit your AndroidManifest.xml to point to the ArtisanService that is needed to instrument your Artisan application. For most cases, we recommend using the installer, but if you prefer to configure the project yourself, please skip forward to the next section.

1\. Download the Install Wizard - You can download the Install Wizard by clicking on your App\'s Settings icon and click the Download SDK link

2\. Extract the contents of YOUR_APP_NAME-ArtisanInstaller.zip into your project\'s root directory.

3\. In a terminal, go to the artisan directory inside your project\'s root directory and run:

* install.bat (on Windows)
* sh install.sh (on Mac/OSX or linux)

This will update your manifest file, add the **artisan_library.jar** to your libs directory and create an Application class, if one doesn\'t exist already.

If there are any settings in your application\'s manifest that are not compatible with Artisan you will be notified and the installer will not complete. For example, you must specify a minimum Android SDK of 2.3.3 or higher. Change the specified settings and run the Artisan installer again.

<div class="note note-hint">
<p>If you are using Eclipse, you'll need to refresh the project in Eclipse so that the newly added files are pulled into the project. Right click on your project and choose "Refresh".</p>
</div>

<div id="artisan-application"></div>
4\. If you already have an Application class you will need to update it to extend com.artisan.application.ArtisanApplication or implement com.artisan.application.ArtisanRegisteredApplication.

The ArtisanRegisteredApplication has three required methods on it: **registerUserProfileVariables**, **registerPowerhooks**, and **registerInCodeExperiments**.

You will also need to call ArtisanManager.startArtisan in the onCreate of your Application class. Replace "YOUR_ARTISAN_APPID_HERE" with the appropriate string. You can find your app id in Artisan Tools on the screen after you first create your app or on the settings page for your app:

{% highlight java %}
    import com.artisan.application.ArtisanApplication;
    import com.artisan.manager.ArtisanManager;

    // Extend ArtisanApplication or implement ArtisanRegisteredApplication
    public class MySampleApplication extends ArtisanApplication {

      @Override
      public void onCreate() {
        super.onCreate();

        ArtisanManager.startArtisan(this, "YOUR_ARTISAN_APPID_HERE");
      }


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

<div id="artisan-activity"></div>
5\. Update all of your activities to extend the ArtisanActivity or implement our interface ArtisanBoundActivity

In order for your app to be properly instrumented all of your activities need to either extend ArtisanActivity or implement the ArtisanBoundActivity interface.

The simpler option is to extend ArtisanActivity. There's nothing else you need to do if you are extending from ArtisanActivity.

Sample Activity that extends ArtisanActivity:
{% highlight java %}
import com.artisan.activity.ArtisanActivity;

public class BaseActivity extends ArtisanActivity {
  ...
}
{% endhighlight %}

If you are already extending a third party Activity or don't wish to extend the ArtisanActivity you have the alternative of implementing our interface instead.

If you do, you must also make sure to add implementations for each of these methods and call the respective ArtisanActivity static method:
* implement **protected void onCreate(Bundle savedInstanceState)** and call **ArtisanActivity.artisanOnCreate(this)**
* implement **protected void onStart()** and call **ArtisanActivity.artisanOnStart(this)**
* implement **protected void onStop()** and call **ArtisanActivity.artisanOnStop(this)**
* implement **protected void onDestroy()** and call **ArtisanActivity.artisanOnDestroy()**
* implement **public void setContentView(int layoutResID)** if you are using this version of setContentView for this Activity or its subclasses and get the contentView from **ArtisanActivity.artisanGetContentView(layoutResID, this)** and pass that in to super.setContentView(View)
* implement **public void setContentView(View view)** if you are using this version of setContentView for this Activity or its subclasses and get the contentview from **ArtisanActivity.artisanGetContentView(view, this)** and pass that in to super.setContentView(View)
* implement **public void setContentView(View view, LayoutParams params)** if you are using this version of setContentView for this Activity or its subclasses and get the contentView from **ArtisanActivity.artisanGetContentView(view, params, this)** and pass that in to super.setContentView(View)
* implement **public ArtisanService getArtisanService()** and return **ArtisanActivity._getArtisanService()**

Sample Activity that implements ArtisanBoundActivity:

{% highlight java %}
import android.app.Activity;
import android.os.Bundle;
import android.view.View;

import com.artisan.activity.ArtisanActivity;
import com.artisan.services.ArtisanBoundActivity;
import com.artisan.services.ArtisanService;

public class SampleArtisanCustomerActivity extends Activity implements ArtisanBoundActivity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		ArtisanActivity.artisanOnCreate(this); // Call Artisan method AFTER super.onCreate
		setContentView(R.layout.activity_absolute_layout);
	}

	@Override
	protected void onStart() {
		super.onStart();
		ArtisanActivity.artisanOnStart(this); // Call Artisan method AFTER super.onStart
	}

	@Override
	protected void onStop() {
		super.onStop();
		ArtisanActivity.artisanOnStop(this); // Call Artisan method AFTER super.onStop
	}

	@Override
	protected void onDestroy() {
		ArtisanActivity.artisanOnDestroy(); // Call Artisan method BEFORE super.onDestroy
		super.onDestroy();
	}

        /**
         * This is the version of setContentView that most people use.
         * You only need to implement this if you are using this version of setContentView in this Activity or its subclasses.
         * If you are using it it looks something like this:
         * setContentView(R.layout.activity_main);
         */
	@Override
	public void setContentView(int layoutResID) {
		View contentView = ArtisanActivity.artisanGetContentView(layoutResID, this);
		super.setContentView(contentView);
	}

        // You only need to implement this if you are using this version of setContentView in this Activity or its subclasses.
	@Override
	public void setContentView(View view) {
		View contentView = ArtisanActivity.artisanGetContentView(view, this);
		super.setContentView(contentView);
	}

        // You only need to implement this if you are using this version of setContentView in this Activity or its subclasses.
	@Override
	public void setContentView(View view, LayoutParams params) {
		View contentView = ArtisanActivity.artisanGetContentView(view, params, this);
		super.setContentView(contentView);
	}

        /**
         * This method is required by the ArtisanBoundActivity interface.
         * You can copy this implementation as is to your Activities that extend our interface.
         */
	@Override
	public ArtisanService getArtisanService() {
		return ArtisanActivity._getArtisanService();
	}
}
{% endhighlight %}

<div class="note note-important">
If you are using ProGuard please see the <a href="/dev/proguard-for-android/">Artisan ProGuard configuration instructions</a>.
</div>

**Congratulations! You are now ready to start using Artisan!**

Now that the SDK is installed in your app we need to connect it to Artisan. Connecting your app verifies that the SDK has been installed correctly and that your app can communicate with the Artisan platform. See the getting started notification in Artisan Tools to connect your device.

You can also get started using the <a href="#api">Artisan API</a>.

Want to know more about what the Android SDK can do? See <a href="/dev/developing-with-artisan/#android">Developing with Artisan</a>.

<div id="manual"></div>
###Option 2: Manually Adding the Artisan SDK to your App

If you prefer to manually install Artisan, follow these steps, including: copying the Artisan jar to your libs, setting up the Artisan Service and updating your activities.

1\. Download the Artisan Android SDK - You can download the SDK by clicking on your App\'s Settings icon and click the Download SDK link

2\. Extract the contents of the SDK .zip file into your project\'s root directory.

3\. Copy all Android resources from \'artisan/androidResources/res\' to your project\'s \'res\' directory. Be sure to keep the subfolder structure intact.

4\. Copy all Android resources from \'artisan/androidResources/assets\' to your project\'s \'assets\' directory.

5\. Copy artisan/artisan_library/artisan_library.jar to your project's libs directory

####Configuring Artisan

Artisan is configured in your Application class.

If you don't already have an Applicaton class, create one and add it to your manifest (the classname goes in the android:name parameter of your &lt;application&gt; node of your AndroidManifest.xml).

1\. Update your application class to extend com.artisan.application.ArtisanActivity or implement com.artisan.application.ArtisanRegisteredApplication.

You will need to call ArtisanManager.startArtisan in the onCreate of your Application class. Replace "YOUR_ARTISAN_APPID_HERE" with the appropriate string. You can find your app id in Artisan Tools on the screen after you first create your app or on the settings page for your app:

{% highlight java %}
    import com.artisan.application.ArtisanApplication;
    import com.artisan.manager.ArtisanManager;

    // Extend ArtisanApplication or implement ArtisanRegisteredApplication
    public class MySampleApplication extends ArtisanApplication {

      @Override
      public void onCreate() {
        super.onCreate();

        ArtisanManager.startArtisan(this, "YOUR_ARTISAN_APPID_HERE");
      }

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

2\. In addition to updating your Application class you will need to update all of your activities.

In order for your app to be properly instrumented with Artisan all of your activities need to either extend ArtisanActivity or implement the ArtisanBoundActivity interface.

The simplest option is to extend ArtisanActivity. There's nothing else you need to do if you are extending from ArtisanActivity.

Sample Activity that extends ArtisanActivity:
{% highlight java %}
import com.artisan.activity.ArtisanActivity;

public class BaseActivity extends ArtisanActivity {
  ...
}
{% endhighlight %}

If you are already extending a third party Activity or don't wish to extend the ArtisanActivity you have the alternative of implementing our interface instead.

If you do, you must also make sure to add implementations for each of these methods and call the respective ArtisanActivity static method:
* implement **protected void onCreate(Bundle savedInstanceState)** and call **ArtisanActivity.artisanOnCreate(this)**
* implement **protected void onStart()** and call **ArtisanActivity.artisanOnStart(this)**
* implement **protected void onStop()** and call **ArtisanActivity.artisanOnStop(this)**
* implement **protected void onDestroy()** and call **ArtisanActivity.artisanOnDestroy()**
* implement **public void setContentView(int layoutResID)** if you are using this version of setContentView for this Activity or its subclasses and get the contentView from **ArtisanActivity.artisanGetContentView(layoutResID, this)** and pass that in to super.setContentView(View)
* implement **public void setContentView(View view)** if you are using this version of setContentView for this Activity or its subclasses and get the contentview from **ArtisanActivity.artisanGetContentView(view, this)** and pass that in to super.setContentView(View)
* implement **public void setContentView(View view, LayoutParams params)** if you are using this version of setContentView for this Activity or its subclasses and get the contentView from **ArtisanActivity.artisanGetContentView(view, params, this)** and pass that in to super.setContentView(View)
* implement **public ArtisanService getArtisanService()** and return **ArtisanActivity._getArtisanService()**

Sample Activity that implements ArtisanBoundActivity:

{% highlight java %}
import android.app.Activity;
import android.os.Bundle;
import android.view.View;

import com.artisan.activity.ArtisanActivity;
import com.artisan.services.ArtisanBoundActivity;
import com.artisan.services.ArtisanService;

public class SampleArtisanCustomerActivity extends Activity implements ArtisanBoundActivity {

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    ArtisanActivity.artisanOnCreate(this); // Call Artisan method AFTER super.onCreate
    setContentView(R.layout.activity_absolute_layout);
  }

  @Override
  protected void onStart() {
    super.onStart();
    ArtisanActivity.artisanOnStart(this); // Call Artisan method AFTER super.onStart
  }

  @Override
  protected void onStop() {
    super.onStop();
    ArtisanActivity.artisanOnStop(this); // Call Artisan method AFTER super.onStop
  }

  @Override
  protected void onDestroy() {
    ArtisanActivity.artisanOnDestroy(); // Call Artisan method BEFORE super.onDestroy
    super.onDestroy();
  }

        /**
         * This is the version of setContentView that most people use.
         * You only need to implement this if you are using this version of setContentView in this Activity or its subclasses.
         * If you are using it it looks something like this:
         * setContentView(R.layout.activity_main);
         */
  @Override
  public void setContentView(int layoutResID) {
    View contentView = ArtisanActivity.artisanGetContentView(layoutResID, this);
    super.setContentView(contentView);
  }

        // You only need to implement this if you are using this version of setContentView in this Activity or its subclasses.
  @Override
  public void setContentView(View view) {
    View contentView = ArtisanActivity.artisanGetContentView(view, this);
    super.setContentView(contentView);
  }

        // You only need to implement this if you are using this version of setContentView in this Activity or its subclasses.
  @Override
  public void setContentView(View view, LayoutParams params) {
    View contentView = ArtisanActivity.artisanGetContentView(view, params, this);
    super.setContentView(contentView);
  }

        /**
         * This method is required by the ArtisanBoundActivity interface.
         * You can copy this implementation as is to your Activities that extend our interface.
         */
  @Override
  public ArtisanService getArtisanService() {
    return ArtisanActivity._getArtisanService();
  }
}
{% endhighlight %}

3\. The last step is updating your AndroidManifest.xml so that Android knows where to find the service and has the correct permissions. Add the following line inside the `<application>` element.

{% highlight java %}
<service android:name="com.artisan.services.ArtisanService"/>
{% endhighlight %}

You will also need to add the following permissions to your AndroidManifest.xml if they aren\'t already set:

{% highlight java %}
<uses-permission android:name="android.permission.READ_PHONE_STATE"/>
<uses-permission android:name="android.permission.GET_TASKS"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
{% endhighlight %}

**Congratulations! You are now ready to start using Artisan!**

Now that the SDK is installed in your app we need to connect it to Artisan. Connecting your app verifies that the SDK has been installed correctly and that your app can communicate with the Artisan platform. See the getting started notification in Artisan Tools to connect your device.

Want to know more about what the Android SDK can do? See <a href="/dev/developing-with-artisan/#android">Developing with Artisan</a>.

<div id="api"></div>
##Getting Started with the Artisan API

##Analytics

Artisan automatically collects analytics events for every user, session, and page view. There's nothing you need to add to your app to capture those analytics.

But, there are likely actions that your users take in your app that you'd like to record for analytics and experiment goals. To capture these custom analytics events we have the ArtisanTrackingManager class in our API.

ArtisanTrackingManager manages all in-code analytics tracking designed for use with Artisan, to allow you to track custom views and events.

{% highlight java %}
ArtisanTrackingManager.trackEvent("Product Purchased");
{% endhighlight %}

with an optional dictionary of name/value pairs.

{% highlight java %}
Map<String, String> parameters = new HashMap<String, String>();
parameters.put("sku", "A0123456789");
parameters.put("product name", "Artisan Developer T-Shirt");
ArtisanTrackingManager.trackEvent("Product Purchased", parameters);
{% endhighlight %}

<div class="note note-hint">
<p>As an alternative to having to manually add code to track all analytics events we provide the <a href="/dev/android-aspectj/">Artisan Auto-Instrumentation with AspectJ</a> version of the Android SDK.</p>
</div>

##User Profile

ArtisanProfileManager is a singleton that is automatically initialized when your app starts. Use ArtisanProfileManager to manage the personalization profile for the current user from app inception to completion.

###Register User Profile Variables

Convenience methods existing for registering numbers, strings, dates, and locations. The value can optionally be set during the registration of the User Profile Variable.

This declaration should occur in the <strong>registerUserProfileVariables</strong> method of your Application class.

{% highlight java %}
@Override
public void registerUserProfileVariables() {
  ArtisanProfileManager.registerDateTime("lastSeenAt", new Date());
  ArtisanProfileManager.registerLocation("lastKnownLocation", new ArtisanLocationValue(39.949920,-75.145102));
  ArtisanProfileManager.registerNumber("totalOrderCount", 9);
  ArtisanProfileManager.registerString("memberType", "gold");
}
{% endhighlight %}

For numeric values you can pass in any java.lang.Number type

{% highlight java %}
ArtisanProfileManager.registerNumber("currentCartTotal double", 146.99); // double
ArtisanProfileManager.registerNumber("currentCartTotal float", 146.99f); // float
ArtisanProfileManager.registerNumber("currentCartTotal int", 146); // int
{% endhighlight %}

<div class="note note-hint">
  <p>Hint: Valid characters for variable names include [0-9], [a-z], [A-Z], -, and _. Any other characters will automatically be stripped out.</p>
</div>

###Update User Profile Variables

The updating of the User Profile Variable can be accomplished by calling the matching setter for the User Variable Variable data type.

{% highlight java %}
ArtisanProfileManager.setStringValue("memberType", "platinum");
ArtisanProfileManager.setDateTimeValue("lastSeenAt", new Date());
ArtisanProfileManager.setLocationValue("lastKnownLocation", new ArtisanLocationValue(39.949920, -75.145102));
ArtisanProfileManager.setNumberValue("totalOrderCount", 9);
{% endhighlight %}

###Clear User Profile Variables

The **clearProfile** method will clear out the values associated with the registered User Profile Variables.

{% highlight java %}
ArtisanProfileManager.clearProfile();
{% endhighlight %}

###Setting the shared user Id
The **sharedUserId** User Profile Variable is used to uniquely indentify an app user.

<div class="note note-important">
  <p>Important: The sharedUserId should NOT be any of the following: email address, phone number, or social security number.  The sharedUserId should uniquely identify the user in your system.</p>
</div>

{% highlight java %}
ArtisanProfileManager.setSharedUserId("abcdef123456789");
{% endhighlight %}

###User Profile Variables for Advanced Targeting

The methods **setGender**, **setUserAge**, and **setUserAddress** can all be used like any other User Profile Variable for Advanced Targeting in Artisan Experiments. These dimensions can also be used for creating segments and reporting.

The **setGender** method expects one of the following enum values: Gender.Female, Gender.Male, Gender.NA or nil (from **com.artisan.incodeapi.ArtisanProfileManager.Gender**);

{% highlight java %}
ArtisanProfileManager.setGender(Gender.Female);
{% endhighlight %}

The **setUserAge** method expects an Integer or int.

{% highlight java %}
ArtisanProfileManager.setUserAge(29);
{% endhighlight %}

The **setUserAddress** method expects a String.

{% highlight java %}
ArtisanProfileManager.setUserAddress("234 Market Street, Philadelphia, PA 19106");
{% endhighlight %}

<div id="power-hooks"></div>
##Power Hooks

Power Hooks are key-value pairs or code blocks with key-value arguments that are passed into your application code by Artisan when your app starts, allowing for settings, text, and logic to be modified on the fly for all user devices without revisioning or updating your application.

All hooks are created using PowerHookManager are automatically registered with the Artisan platform when you connect your device to for the first time. The registration process will detect all registered hook keys, and will display all of the hook variables and code blocks for this app in Artisan where they can be edited.  Values set on hooks on the web will automatically be downloaded by all devices upon app startup, allowing for their usage throughout your system code.

###Power Hook Variables

Register a single-value Power Hook for use with Artisan.

Use the method **registerVariable(String hookId, String friendlyName, String defaultValue)** to declare the existence of a Power Hook you would like to pass in from Artisan.

This declaration should occur in the <strong>registerPowerhooks</strong> method of your Application class

{% highlight java %}
@Override
public void registerPowerhooks() {
  PowerHookManager.registerVariable("addToCartButton", "Add To Cart Button Text", "Buy Now");
  ...
}
{% endhighlight %}

The method **getVariableValue** retrieves the value of a Power Hook from Artisan.  This will return the value specified in the Artisan platform, or the default value if none has been specified.

{% highlight java %}
Button cart_button = (Button) findViewById(R.id.AddToCartButton);
cart_button.setText(PowerHookManager.getVariableValue("addToCartButton"));
{% endhighlight %}

<div class="note note-important">
  <p>NOTE: If you request the value for this Power Hook Variable in your first Activity's onCreate method, before the Artisan Service has a chance to start up, you may get a null value in return. The Artisan Service is started up at the time your first activity is created, and should be ready by the time your first activity gets to onResume. For the rest of your application's lifecycle you can assume that Power Hooks will work as expected.</p>
</div>

<div class="note note-hint">
  <p>HINT: Each time your code passes over a <strong>getVariableValue</strong> method call the most recently downloaded value to the user's device will be referenced.  If you do not want the value to change during the life-cycle of the object you can assign the value to a variable.</p>
</div>

###Power Hook Code Blocks

Use the **registerBlock(String blockId, String friendlyName, Map&lt;String, String&gt; defaultData, ArtisanBlock block)** method to declare the existence of a code block you would like to use in your app with data that is configurable from Artisan.

This declaration should occur in the **registerPowerhooks** method of your Application class

* **blockId** - The name of the block to register. Name must be unique for this app.
* **friendlyName** - The name for this code block that will be displayed in Artisan Tools.
* **defaultData** - The default data for this code block. This should be string keys and values. This data will be used if no data is passed in from Artisan Tools for this code block for this app.
* **block** - The block of code executed when executeBlock is called.

<div class="note note-hint">
  <p>Hint: The ArtisanBlock execute method takes in two Maps. The <strong>data</strong> Map will include either the default data that you passed in when you registered, or updated data from Artisan. The Map <strong>extraData</strong> is data that you will pass in when you call executeBlock. This is often used to pass in an Android Context, like in the example below. Although, extraData can also be used to pass in any information that is relevant from wherever this block will be exectued, like the optional productName variable in the example below.</p>
</div>

{% highlight java %}
@Override
public void registerPowerhooks() {
  ...
  HashMap<String, String> defaultData = new HashMap<String, String>();
  defaultData.put("discountCode", "012345ABC");
  defaultData.put("discountAmount", "25%");
  defaultData.put("shouldDisplay", "true");

  PowerHookManager.registerBlock("showAlert", "Show Alert Block", defaultData, new ArtisanBlock() {
    @Override
    public void execute(Map<String, String> data, Map<String, Object> extraData) {
      if ("true".equalsIgnoreCase(data.get("shouldDisplay"))) {
        StringBuilder message = new StringBuilder();
        if (extraData.get("productName") != null) {
          message.append("Buy another ");
          message.append(data.get("productName"));
          message.append(" for a friend! ");
        }
        message.append("Use discount code ");
        message.append(data.get("discountCode"));
        message.append(" to get ");
        message.append(data.get("discountAmount"));
        message.append(" off your next purchase!");
        Toast.makeText((Context) extraData.get("context"), message, Toast.LENGTH_LONG).show();
      }
    }
  });
}
{% endhighlight %}

Use the method **executeBlock(String blockId)** or **executeBlock(String blockId, Map&lt;String, Object&gt; extraData)** to execute a Power Hook code block from Artisan. The code block will use the values specified in the data parameter registered in ArtisanTools.com to execute the block. You can override the default data using ArtisanTools.com.

Power Hook code blocks can be used for referencing code that can be executed conditionally. Examples are displaying a modal popup to remind the user to perform certain actions in the app, managing the logic for applying a discount code, or displaying a survey to a segment of users.

* **blockId** - The name of the code to register. Name must be unique for this app.
* **extraData** - Additional data to use when executing this block. If you need a context to execute your block, you can pass one in here.

Sample usage of a Power Hook Block (from the onClick handler for an add to cart button):

{% highlight java %}
Map<String, Object> extraData = new HashMap<String, Object>();
extraData.put("productName", "Artisan Andy Plush Toy");
extraData.put("context", this);
PowerHookManager.executeBlock("showAlert", extraData);
{% endhighlight %}

<div class="note note-important">
  <p>NOTE: If you execute this Power Hook Block in your first Activity's onCreate method, before the Artisan Service has a chance to start up, the call may be ignored. The Artisan Service is started up at the time your first activity is created, and should be ready by the time your first activity gets to onResume. For the rest of your application's lifecycle you can assume that Power Hooks will work as expected.</p>
</div>

<div id="in-code"></div>
##In-code Experiments

In-code Experiments allow you to build tests around business logic inside your app.  For example, you can create a test for showing or not showing a particular screen.  Another example is testing multiple workflows.

An in-code experiments must be defined in the **registerInCodeExperiments** on your Application class.

The method **registerExperimentWithDescription(String experimentName)** or **registerExperimentWithDescription(String experimentName, String description)** takes a string representing the name of your experiment and an optional string for a description that will be displayed in Artisan Tools.

{% highlight java %}
@Override
public void registerInCodeExperiments() {
  ArtisanExperimentManager.registerExperiment("Cart Process", "Skip or don't skip the product detail page");
  ...
}
{% endhighlight %}

Next, register each variant by name with the experiment with **addVariantForExperiment(String variantName, String experimentName)** or **addVariantForExperiment(String variantName, String experimentName, boolean isDefault)**.
* **variantName** The name of the variant to add. This needs to be unique for the experiment.
* **experimentName** The name of the experiment to which this variant should be added. This needs to be the name a variant previously created via **registerExperiment**.
* **isDefault** Sets whether this variant is the default. The default variant will be used in instances where the experiment is not active (i.e. completed or not yet published). If no variant is marked as the default the first variant you add will be the default.

{% highlight java %}
@Override
public void registerInCodeExperiments() {
  ArtisanExperimentManager.registerExperiment("Cart Process", "Skip or don't skip the product detail page");
  ArtisanExperimentManager.addVariantForExperiment("Don't Skip Product Details", "Cart Process", true);
  ArtisanExperimentManager.addVariantForExperiment("Skip Product Details", "Cart Process");
}
{% endhighlight %}

<div class="note note-important">
  <p>Important: If the experiment is not running the default variant will be selected.</p>
</div>

Call the method **setExperimentViewedForExperiment(String experimentName)** to mark the experiment has been viewed for the current user session. This call should be made at the location within the code where you want to mark the experiment as viewed.

Use the method **isCurrentVariantForExperiment(String variantName, String experimentName)** to determine which experiment variation is active.

{% highlight java %}
ArtisanExperimentManager.setExperimentViewedForExperiment("Buy Button Test");

if (ArtisanExperimentManager.isCurrentVariantForExperiment("button says add to cart", "Buy Button Test")) {
  textView.setText("Add to Cart");
} else if (ArtisanExperimentManager.isCurrentVariantForExperiment("button says buy now", "Buy Button Test")) {
  textView.setText("Buy Now!");
}
{% endhighlight %}

<div class="note note-hint">
  <p>Hint: The logic for choosing the variant should generally be in the <strong>onResume</strong> method of your Activity or in a location where the code will be exercised each time the screen is displayed.  This is necessary so the test can be turned on and off without requiring the rebuilding of the screen.</p>
</div>

To set the goal of an in-code experiment you call the **setTargetReachedForExperiment(String experimentName)** method.  This call should be made at the location within the code where you want to mark the goal as achieved.

{% highlight java %}
ArtisanExperimentManager.setTargetReachedForExperiment("Buy Button Test");
{% endhighlight %}

## Javadoc

For extensive javadoc for the Artisan API see <a href="/dev/android-javadocs">Android API Javadocs</a> for the version of the Artisan SDK that you are using.