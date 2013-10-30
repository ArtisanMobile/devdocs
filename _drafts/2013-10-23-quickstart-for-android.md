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
  * For the location, paste the url http://download.eclipse.org/tools/ajdt/42/update
  * Click "OK"
* Select "AspectJ Developer Tools (Required)" and click "Next" and then "Next" again
* Accept the licenses and click "Finish"
* You may be prompted to restart Eclipse after this installation is complete.

3\. Download the Artisan Android SDK

<div class="note note-important">
  <p>Important: the Artisan Android SDK is not compatible with ProGuard. Unexpected behaviour may occur if you install Artisan into an app built with ProGuard.</p>
</div>

##Adding the Artisan SDK
Manual installation of the Artisan Android SDK includes three steps:

1\. Updating your Eclipse project

2\. Setting up the Artisan Service

3\. Configuring the Artisan Builder to generate the Artisan AspectJ files

###Eclipse Project configuration

1\. Unzip the contents of 'artisan-x.x.x.zip' into a folder in the root of your project directory.

2\. Copy the files from the 'artisan/Support' folder into your project's libs directory. You might need to create this folder in the project's root directory if it does not already exist.

3\. Copy all Android resources from 'artisan/androidResources/res' to your project's 'res' directory. Be sure to keep the subfolder structure intact.

4\. Copy all Android resources from 'artisan/androidResources/assets' to your project's 'assets' directory.

5\. Add the AspectJ nature to the Eclipse project:

* Open Eclipse. Right-click on your project in the Project Explorer and choose "Configure -> Convert to AspectJ Project".
* If Eclipse prompts you whether to include AspectJ files on the build path, select "yes".

6\. Add the artisan library to the build path:

* Right click on your project in the Project Explorer and choose "Properties".
* In the list on the left, click on "AspectJ build".
* Make sure that the "Inpath" tab is selected.
* If the artisan_library_4.jar is not already on the inpath, click "Add jars" and locate the artisan/artisan_library/artisan_library_4.jar in your project folder and add it to your inpath.

7\. Export the AspectJ Runtime Library

* Right click on your project in the Project Explorer and choose "Properties".
* In the list on the left, click on "Java Build Path".
* Make sure that the "Order and Export" tab is selected.
* If the "AspectJ Runtime Library" is not already selected, check it and press OK.

8\. Make your Activity lifecycle methods public. In order to instrument your application Artisan needs any onCreate, onResume, onPause and onDestroy methods that you have implemented in your app as well as any methods in your activities that are callbacks for clicks or other events (generally, any method that takes a View as a parameter) to be public. The default for the lifecycle methods is protected, which we are not able to instrument. If you skip this step Artisan will not work properly and you may experience errors and unpredictable behavior.

<<<<<<< Updated upstream:_drafts/2013-10-23-quickstart-for-android.md
###Setting up the Artisan service
=======
####Setting up the Artisan service
>>>>>>> Stashed changes:_posts/2013-10-23-quickstart-for-android.md
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


<<<<<<< Updated upstream:_drafts/2013-10-23-quickstart-for-android.md
###Configuring the Artisan build script
=======
####Configuring the Artisan build script
>>>>>>> Stashed changes:_posts/2013-10-23-quickstart-for-android.md

Artisan generates AspectJ files alongside your code. These files live inside the 'gen/' folder, next to your other generated code, such as R.java. It is very important that these files get generated or Aritsan will not run in your application.

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