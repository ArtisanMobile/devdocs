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
* Click "Add" on the right to add a new repository.
  * For the name, you can name this AspectJ.
  * For the location, you need the correct AJDT Update Site URL for your version of Eclipse:
      * Eclipse 3.8 and 4.2 Update Site URL:  http://download.eclipse.org/tools/ajdt/42/update
      * Eclipse 3.7 Update Site URL:  http://download.eclipse.org/tools/ajdt/37/update
      * For other versions of Eclipse find the correct Update Site URL on this page <a href="http://eclipse.org/ajdt/downloads/">http://eclipse.org/ajdt/downloads/</a>
  * Click "OK"
* Select "AspectJ Developer Tools (Required)" and click "Next" and then "Next" again
* Accept the licenses and click "Finish"
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
      <li>jackson-core-asl-1.9.7.jar</li>
      <li>jackson-databind-2.2.3.jar</li>
      <li>jackson-mapper-asl-1.9.7.jar</li>
      <li>otto-1.3.4.jar</li>
      <li>volley.jar (built from source)</li>
  </ul>
  <p>If you are using library projects that have the same dependencies you will need to manually ensure that the dependencies do not conflict. We can only guarantee that Artisan works with these versions.</p>
</div>

##Adding Artisan to Your App

###Option 1: Automatically Instrumenting your App with Artisan

Artisan comes bundled with an installer that will configure Eclipse and add the necessary files to your source root. It will also edit your AndroidManifest.xml to point to the CustomArtisanService that is needed to instrument your Artisan application. For most cases, we recommend using the installer, but if you prefer to configure the project yourself, please skip forward to the next section.

1\. Download the Install Wizard - You can download the Install Wizard by clicking on your App's Settings icon and click the Download SDK link

2\. Extract the contents of YOUR_APP_NAME-ArtisanInstaller.zip into your project's root directory.

3\. In a terminal, go to the artisan directory inside your project's root directory and run:

* install.bat (on Windows)
* sh install.sh (on Mac/OSX or linux)

This will update your manifest file, add the required libraries and create the CustomArtisanService class, if one doesn't exist already. It will also configure an Eclipse 'Builder' that will regenerate necessary AspectJ declarations for your Activities after every build. See "Configuring the Artisan build script" below for more information.

Note: This process will automatically update the visibility of the onStart, onStop and onDestroy of your activities so that they can be instrumented by Artisan.

If there are any settings in your application's manifest that are not compatible with Artisan you will be notified and the installer will not complete. For example, you must specify a minimum Android SDK of 2.3.3 or higher. Change the specified settings and run the Artisan installer again.

4\. Installation is now complete. You'll need to refresh the project in Eclipse so that the newly added files are pulled into the project. Right click on your project and choose "Refresh".

Congratulations! You are now ready to start using Artisan!

Now that the SDK is installed in your app we need to connect it to Artisan. Connecting your app verifies that the SDK has been installed correctly and that #{@app.name} can communicate with the Artisan platform.

###Option 2: Manually Adding the Artisan SDK to #{@app.name}

If you prefer to manually install Artisan, follow the steps outlined in the rest of this document, including: updating your Eclipse project, setting up the Artisan Service, and configuring the Artisan Builder to generate the Artisan AspectJ files.

####Eclipse Project configuration

1\. Download the Artisan Android SDK - You can download the SDK by clicking on your App's Settings icon and click the Download SDK link

2\. Extract the contents of the SDK .zip file into your project's root directory.

3\. Copy the files from the 'artisan/Support' folder into your project's libs directory. You might need to create this folder in the project's root directory if it does not already exist. If you are using library projects that have the same dependencies as Artisan you will need to manually ensure that the dependencies do not conflict. We can only guarantee that Artisan works with these versions.

4\. Copy all Android resources from 'artisan/androidResources/res' to your project's 'res' directory. Be sure to keep the subfolder structure intact.

5\. Copy all Android resources from 'artisan/androidResources/assets' to your project's 'assets' directory.

6\. Add the AspectJ nature to the Eclipse project:

* Open Eclipse. Right-click on your project in the Project Explorer and choose "Configure -> Convert to AspectJ Project".
* If Eclipse prompts you whether to include AspectJ files on the build path, select "yes".

7\. Add the artisan library to the build path:


* Right click on your project in the Project Explorer and choose "Properties".
* In the list on the left, click on "AspectJ build".
* Make sure that the "Inpath" tab is selected.
* If the artisan_library_4.jar is not already on the inpath, click "Add jars" and locate the artisan/artisan_library/artisan_library_4.jar in your project folder and add it to your inpath.

8\. Export the AspectJ Runtime Library

* Right click on your project in the Project Explorer and choose "Properties".
* In the list on the left, click on "Java Build Path".
* Make sure that the "Order and Export" tab is selected.
* If the "AspectJ Runtime Library" is not already selected, check it and press OK.

9\. Make your Activity lifecycle methods public. In order to instrument your application Artisan needs any onCreate, onStart, onStop and onDestroy methods that you have implemented in your app to be public. The default for the lifecycle methods is protected, which we are not able to instrument. If you skip this step Artisan will not work properly and you may experience errors and unpredictable behavior.

####Setting up the Artisan service

In order for Artisan to run within your app, the Artisan service has to be started. To do this, we will create a subclass of 'ArtisanService' and add a declaration in the manifest which points to this service.

1\. Create a class called 'CustomArtisanService' inside one of your source packages. This class needs to extend com.artisan.services.ArtisanService. If you would like to call it something else, you must edit the value of the 'artisan_service_name' string resource in 'res/values/artisan_ids.xml' to match the your custom class name.

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

You will also need to add the following permissions to your AndroidManifest.xml if they aren't already set:

{% highlight java %}
<uses-permission android:name="android.permission.READ_PHONE_STATE"/>
<uses-permission android:name="android.permission.GET_TASKS"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
{% endhighlight %}

####Configuring the Artisan build script

Artisan generates AspectJ files alongside your code. These files live inside the 'gen/' folder, next to your other generated code, such as R.java. It is very important that these files get generated or Artisan will not run in your application. In addition, this script will update the visibility of any new onStart, onStop and onDestroy methods on your activities so that we can instrument them automatically.

You can regenerate these files at any time by running the installer script with the '--aspectonly' flag.

In order to regenerate these files *automatically* after every build, Eclipse needs to be configured with a 'Builder' that will run the Artisan build script. Follow the instructions below to set up the Eclipse builder:

1\. Create a new Eclipse builder

* Right click on your project in the Project Explorer and choose "Properties".
* Click on "Builders" and select "New".
* Eclipse will ask you to "Choose a type of external tool to create".
* Choose "program" and click OK. The 'Edit Launch Configurations' dialog will appear.
* Give your builder a name, such as "Artisan Build Script".

2\. For the "location" field, click "Browse Workspace" and browse to your 'artisan' folder.

* On Mac/Linux, select **install.sh** and click OK.
* On Windows, select **install.bat** and click OK.

3\. For the "working directory" field, click on "browse workspace" and select your 'artisan' folder. Click OK.

4\. In the "arguments" text box, type '--aspectonly'. Click "OK" to save the builder configuration.

5\. Move the builder to the top of the list, above "Android Resource Manager".

Congratulations! You are now ready to start using Artisan!
