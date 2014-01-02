---
layout: docs
title: "Quickstart for Android"
author: "Artisan"
category: dev
description: "Getting started with the Artisan MEM platform for developers."
---
#Artisan Quickstart Guide for Android

##Prerequisites
1\. Eclipse with Android SDK (At a minimum ensure you have support for Android 2.3.3 and build against the latest Android SDK)

2\. Add the AspectJ eclipse plugin:

* In Eclipse click Help -> Install New Software
* Click "Add\" on the right to add a new repository.
  * For the name, you can name this AspectJ.
  * For the location, you need the correct AJDT Update Site URL for your version of Eclipse:
      * Eclipse 3.8 and 4.2 Update Site URL:  http://download.eclipse.org/tools/ajdt/42/update
      * Eclipse 3.7 Update Site URL:  http://download.eclipse.org/tools/ajdt/37/update
      * For other versions of Eclipse find the correct Update Site URL on this page <a href="http://eclipse.org/ajdt/downloads/">http://eclipse.org/ajdt/downloads/</a>
  * Click \"OK\"
* Select \"AspectJ Developer Tools (Required)\" and click \"Next\" and then \"Next\" again
* Accept the licenses and click \"Finish\"
* You may be prompted to restart Eclipse after this installation is complete.

<div class="note note-important">
  <p>Important: the Artisan Android SDK is not compatible with ProGuard. Unexpected behavior may occur if you install Artisan into an app built with ProGuard.</p>
</div>

<div class="note note-hint">
  <p>Also note, the Artisan SDK uses the following jars, which will be copied in to your project:</p>
  <ul>
      <li>android-support-v4.jar</li>
      <li>httpclientandroidlib-1.1.2.jar</li>
      <li>jackson-annotations-2.2.3.jar</li>
      <li>jackson-core-2.2.3.jar</li>
      <li>jackson-databind-2.2.3.jar</li>
      <li>otto-1.3.4.jar</li>
      <li>volley.jar (built from source)</li>
  </ul>
  <p>If you are using library projects that have the same dependencies you will need to manually ensure that the dependencies do not conflict. We can only guarantee that Artisan works with these versions.</p>
</div>

##Adding Artisan to Your App

###Option 1: Automatically Instrumenting your App with Artisan

Artisan comes bundled with an installer that will configure Eclipse and add the necessary files to your source root. It will also edit your AndroidManifest.xml to point to the CustomArtisanService that is needed to instrument your Artisan application. For most cases, we recommend using the installer, but if you prefer to configure the project yourself, please skip forward to the next section.

1\. Download the Install Wizard - You can download the Install Wizard by clicking on your App\'s Settings icon and click the Download SDK link

2\. Extract the contents of YOUR_APP_NAME-ArtisanInstaller.zip into your project\'s root directory.

3\. In a terminal, go to the artisan directory inside your project\'s root directory and run:

* install.bat (on Windows)
* sh install.sh (on Mac/OSX or linux)

This will update your manifest file, add the required libraries and create the CustomArtisanService class, if one doesn\'t exist already. It will also configure an Eclipse \'Builder\' that will regenerate necessary AspectJ declarations for your Activities after every build. See \"Configuring the Artisan build script\" below for more information.

<div class="note note-important">
  <p>Note: This process will automatically update the visibility of the onStart, onStop and onDestroy of your activities so that they can be instrumented by Artisan.</p>
</div>

If there are any settings in your application\'s manifest that are not compatible with Artisan you will be notified and the installer will not complete. For example, you must specify a minimum Android SDK of 2.3.3 or higher. Change the specified settings and run the Artisan installer again.

4\. Installation is now complete. You\'ll need to refresh the project in Eclipse so that the newly added files are pulled into the project. Right click on your project and choose \"Refresh\".

Congratulations! You are now ready to start using Artisan!

Now that the SDK is installed in your app we need to connect it to Artisan. Connecting your app verifies that the SDK has been installed correctly and that your app can communicate with the Artisan platform.

###Option 2: Manually Adding the Artisan SDK to your App

If you prefer to manually install Artisan, follow the steps outlined in the rest of this document, including: updating your Eclipse project, setting up the Artisan Service, and configuring the Artisan Builder to generate the Artisan AspectJ files.

####Eclipse Project configuration

1\. Download the Artisan Android SDK - You can download the SDK by clicking on your App\'s Settings icon and click the Download SDK link

2\. Extract the contents of the SDK .zip file into your project\'s root directory.

3\. Copy the files from the \'artisan/Support\' folder into your project\'s libs directory. You might need to create this folder in the project\'s root directory if it does not already exist. If you are using library projects that have the same dependencies as Artisan you will need to manually ensure that the dependencies do not conflict. We can only guarantee that Artisan works with these versions.

4\. Copy all Android resources from \'artisan/androidResources/res\' to your project\'s \'res\' directory. Be sure to keep the subfolder structure intact.

5\. Copy all Android resources from \'artisan/androidResources/assets\' to your project\'s \'assets\' directory.

6\. Add the AspectJ nature to the Eclipse project:

* Open Eclipse. Right-click on your project in the Project Explorer and choose \"Configure -> Convert to AspectJ Project\".
* If Eclipse prompts you whether to include AspectJ files on the build path, select \"yes\".

7\. Add the artisan library to the build path:


* Right click on your project in the Project Explorer and choose \"Properties\".
* In the list on the left, click on \"AspectJ build\".
* Make sure that the \"Inpath\" tab is selected.
* If the artisan_library_4.jar is not already on the inpath, click \"Add jars\" and locate the artisan/artisan_library/artisan_library_4.jar in your project folder and add it to your inpath.

8\. Export the AspectJ Runtime Library

* Right click on your project in the Project Explorer and choose \"Properties\".
* In the list on the left, click on \"Java Build Path\".
* Make sure that the \"Order and Export\" tab is selected.
* If the \"AspectJ Runtime Library\" is not already selected, check it and press OK.

9\. Make your Activity lifecycle methods public. In order to instrument your application Artisan needs any onCreate, onStart, onStop and onDestroy methods that you have implemented in your app to be public. The default for the lifecycle methods is protected, which we are not able to instrument. If you skip this step Artisan will not work properly and you may experience errors and unpredictable behavior.

####Setting up the Artisan service

In order for Artisan to run within your app, the Artisan service has to be started. To do this, we will create a subclass of \'ArtisanService\' and add a declaration in the manifest which points to this service.

1\. Create a class called \'CustomArtisanService\' inside one of your source packages. This class needs to extend com.artisan.services.ArtisanService. If you would like to call it something else, you must edit the value of the \'artisan_service_name\' string resource in \'res/values/artisan_ids.xml\' to match the your custom class name.

2\. You will need to implement one abstract method to start the Artisan service. Add the following method to your CustomArtisanService class:

{% highlight java %}
import com.artisan.manager.ArtisanManager;
import com.artisan.services.ArtisanService;

public class CustomArtisanService extends ArtisanService {
  @Override
  public void startArtisanManager(ArtisanManager manager) { do
    artisanManager.start("YOUR_APP_ID");
  }
}
{% endhighlight %}

3\. The last step is updating your AndroidManifest.xml so that Android knows where to find the service and has the correct permissions. Add the following line inside the `<application>` element, using the relative path to your concrete ArtisanService class.

{% highlight java %}
<service android:name=".path.to.my.CustomArtisanService"/>
{% endhighlight %}

You will also need to add the following permissions to your AndroidManifest.xml if they aren\'t already set:

{% highlight java %}
<uses-permission android:name="android.permission.READ_PHONE_STATE"/>
<uses-permission android:name="android.permission.GET_TASKS"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
{% endhighlight %}

####Configuring the Artisan build script

Artisan generates AspectJ files alongside your code. These files live inside the \'gen/\' folder, next to your other generated code, such as R.java. It is very important that these files get generated or Artisan will not run in your application. In addition, this script will update the visibility of any new onStart, onStop and onDestroy methods on your activities so that we can instrument them automatically.

You can regenerate these files at any time by running the installer script with the \'&dash;&dash;aspectonly\' flag.

In order to regenerate these files *automatically* after every build, Eclipse needs to be configured with a \'Builder\' that will run the Artisan build script. Follow the instructions below to set up the Eclipse builder:

1\. Create a new Eclipse builder

* Right click on your project in the Project Explorer and choose \"Properties\" UPDATE.
* Click on \"Builders\" and select \"New\".
* Eclipse will ask you to \"Choose a type of external tool to create\".
* Choose \"program\" and click OK. The \'Edit Launch Configurations\' dialog will appear.
* Give your builder a name, such as \"Artisan Build Script\".

2\. For the \"location\" field, click \"Browse Workspace\" and browse to your \'artisan\' folder.

* On Mac/Linux, select **install.sh** and click OK.
* On Windows, select **install.bat** and click OK.

3\. For the \"working directory\" field, click on \"browse workspace\" and select your \'artisan\' folder. Click OK.

4\. In the \"arguments\" text box, type **&dash;&dash;aspectonly**. Click \"OK\" to save the builder configuration.

5\. Move the builder to the top of the list, above \"Android Resource Manager\".

Congratulations! You are now ready to start using Artisan!

##Analytics
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


##Power Hooks

Power Hooks are key-value pairs or code blocks with key-value arguments that are passed into your application code by Artisan when your app starts, allowing for settings, text, and logic to be modified on the fly for all user devices without revisioning or updating your application.

All hooks are created using PowerHookManager are automatically registered with the Artisan platform when you connect your device to for the first time. The registration process will detect all registered hook keys, and will display all of the hook variables and code blocks for this app in Artisan where they can be edited.  Values set on hooks on the web will automatically be downloaded by all devices upon app startup, allowing for their usage throughout your system code.

###Power Hook Variables

Register a single-value Power Hook for use with Artisan.

Use the method **registerVariable(String hookId, String friendlyName, String defaultValue)** to declare the existence of a Power Hook you would like to pass in from Artisan.

This declaration should occur in the <strong>registerPowerhooks</strong> method of your CustomArtisanService

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

This declaration should occur in the **registerPowerhooks** method of your CustomArtisanService

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

##In-code Experiments

In-code Experiments allow you to build tests around business logic inside your app.  For example, you can create a test for showing or not showing a particular screen.  Another example is testing multiple workflows.

An in-code experiments must be defined in the **registerInCodeExperiments** on your CustomArtisanService class.

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
