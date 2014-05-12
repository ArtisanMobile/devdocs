---
layout: docs
title: "Artisan Android Auto-Instrumentation"
author: "Artisan"
category: dev
description: "Getting started with the Artisan Auto-Instrumentation with AspectJ option for Android"
---

<div id="aspectj"></div>
#Artisan Auto-Instrumentation with AspectJ

<div class="note note-important">
  <p>If you don't wish to use AspectJ please see the default <a href="/dev/quickstart-for-android/">Artisan Android Installation</a> instructions.</p>
  <p>The capabilities of both versions are the same except that the AspectJ version automatically instruments your activities and collects all user interactions as analytics events. Fewer development environments are supported for the AspectJ version.</p>
  <p>For more details about what is supported with the different versions of the Artisan Android SDK, see <a href="/dev/developing-with-artisan/#android">Developing with Artisan</a>.</p>
  <p>Supported development environments and build tools for Artisan Auto-Instrumentation with AspectJ:</p>
  <ul>
    <li>Eclipse (default)</li>
    <li><a href="#intellij">IntelliJ Ultimate Edition</a></li>
    <li><a href="#ant">Ant</a></li>
  </ul>
</div>

## Artisan AspectJ Eclipse Installation

###Prerequisites

1\. Eclipse with Android SDK (At a minimum ensure you have support for Android 2.3.3 and build against the latest Android SDK)

2\. Add the AspectJ eclipse plugin (this will need to be done on each developer machine once):

* In Eclipse click Help -> Install New Software
* Click "Add\" on the right to add a new repository.
  * For the name, you can name this AspectJ.
  * For the location, you need the correct AJDT Update Site URL for your version of Eclipse:
    * Eclipse 4.3 (Kepler) Update Site URL:  `http://download.eclipse.org/tools/ajdt/43/update`
    * Eclipse 3.8 and 4.2 (Juno) Update Site URL:  `http://download.eclipse.org/tools/ajdt/42/update`
    * Eclipse 3.7 (Indigo) Update Site URL:  `http://download.eclipse.org/tools/ajdt/37/update`
    * For other versions of Eclipse find the correct Update Site URL on this page <a href="http://eclipse.org/ajdt/downloads/">http://eclipse.org/ajdt/downloads/</a>
  * Click \"OK\"
* Select \"AspectJ Developer Tools (Required)\" and click \"Next\" and then \"Next\" again
* Accept the licenses and click \"Finish\"
* You may be prompted to restart Eclipse after this installation is complete.

<div class="note note-important">
If you are using ProGuard please see the <a href="/dev/proguard-for-android/">Artisan ProGuard configuration instructions</a>.
</div>

For Eclipse installation with AspectJ you can choose between an <a href="#eclipse-automated">automated</a> or a <a href="#eclipse-manual">manual</a> installation.

<div id="eclipse-automated"></div>
###Option 1: Automatically Instrumenting your App with Artisan

Artisan comes bundled with an installer that will configure Eclipse and add the necessary files to your source root. It will also edit your AndroidManifest.xml to point to the ArtisanService that is needed to instrument your Artisan application. For most cases, we recommend using the installer, but if you prefer to configure the project yourself, please skip forward to the next section.

1\. Download the Install Wizard - You can download the Install Wizard by clicking on your App\'s Settings icon and click the Download SDK link

2\. Extract the contents of YOUR_APP_NAME-ArtisanInstaller.zip into your project\'s root directory.

3\. In a terminal, go to the artisan directory inside your project\'s root directory and run:

* sh install.sh --aspectj (on Mac/OSX or linux)
* install.bat --aspectj (on Windows)

This will update your manifest file, add the required libraries and create an Application class, if one doesn\'t exist already. It will also configure an Eclipse \'Builder\' that will regenerate necessary AspectJ declarations for your Activities after every build. See \"Configuring the Artisan build script\" below for more information.

<div class="note note-important">
  <p>Note: This process will automatically update the visibility of the onStart, onStop and onDestroy of your activities so that they can be instrumented by Artisan.</p>
</div>

If there are any settings in your application\'s manifest that are not compatible with Artisan you will be notified and the installer will not complete. For example, you must specify a minimum Android SDK of 2.3.3 or higher. Change the specified settings and run the Artisan installer again.

If you already have an Application class you wil need to ArtisanApplication or implement ArtisanRegisteredApplication and call **ArtisanManager.startArtisan**

{% highlight java %}
    import com.artisan.application.ArtisanApplication;
    import com.artisan.manager.ArtisanManager;

    public class MySampleApplication extends ArtisanApplication {
      @Override
      public void onCreate() {
        super.onCreate();
        // Put your Artisan AppID here
        ArtisanManager.startArtisan(this, "YOUR_ARTISAN_APPID_HERE");
      }
{% endhighlight %}

OR

{% highlight java %}
    import com.artisan.application.ArtisanRegisteredApplication;
    import com.artisan.manager.ArtisanManager;

    public class MySampleApplication extends Application implements ArtisanRegisteredApplication {
      @Override
      public void onCreate() {
        super.onCreate();
        // Put your Artisan AppID here
        ArtisanManager.startArtisan(this, "YOUR_ARTISAN_APPID_HERE");
      }
{% endhighlight %}

4\. You\'ll need to refresh the project in Eclipse so that the newly added files are pulled into the project. Right click on your project and choose \"Refresh\".

**Congratulations! You are now ready to start using Artisan!**

Now that the SDK is installed in your app we need to connect it to Artisan. Connecting your app verifies that the SDK has been installed correctly and that your app can communicate with the Artisan platform.

<div class="note note-important">
  <p>You should not extend ArtisanActivity or manually implement the ArtisanBoundActivity interface if you are using Artisan AspectJ. This Activity instrumentation is done automatically via AspectJ</p>
</div>

<div id="eclipse-manual"></div>
###Option 2: Manually Adding the Artisan SDK to your App

If you prefer to manually install Artisan, follow the steps outlined in the rest of this document, including: updating your Eclipse project, setting up the Artisan Service, and configuring the Artisan Builder to generate the Artisan AspectJ files.

####Eclipse Project configuration

1\. Download the Artisan Android SDK - You can download the SDK by clicking on your App\'s Settings icon and click the Download SDK link

2\. Extract the contents of the SDK .zip file into your project\'s root directory.

3\. Copy all Android resources from \'artisan/androidResources/res\' to your project\'s \'res\' directory. Be sure to keep the subfolder structure intact.

4\. Copy all Android resources from \'artisan/androidResources/assets\' to your project\'s \'assets\' directory.

5\. Add the AspectJ nature to the Eclipse project:

* Open Eclipse. Right-click on your project in the Project Explorer and choose \"Configure -> Convert to AspectJ Project\".
* If Eclipse prompts you whether to include AspectJ files on the build path, select \"yes\".

6\. Add the artisan library to the build path:

* Right click on your project in the Project Explorer and choose \"Properties\".
* In the list on the left, click on \"AspectJ build\".
* Make sure that the \"Inpath\" tab is selected.
* If the artisan_library.jar is not already on the inpath, click \"Add jars\" and locate the artisan/artisan_library/artisan_library.jar in your project folder and add it to your inpath.

8\. Export the AspectJ Runtime Library

* Right click on your project in the Project Explorer and choose \"Properties\".
* In the list on the left, click on \"Java Build Path\".
* Make sure that the \"Order and Export\" tab is selected.
* If the \"AspectJ Runtime Library\" is not already selected, check it and press OK.

9\. Make your Activity lifecycle methods public. In order to instrument your application Artisan needs any onCreate, onStart, onStop and onDestroy methods that you have implemented in your app to be public. The default for the lifecycle methods is protected, which we are not able to instrument. If you skip this step Artisan will not work properly and you may experience errors and unpredictable behavior.

####Setting up the Artisan service

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

**Congratulations! You are now ready to start using Artisan with Auto-Instrumentation!**

<div id="intellij"></div>
## Android AspectJ Installation for IntelliJ

<div class="note note-important">
<p>IntelliJ Ultimate Edition support for Artisan AspectJ is in BETA. The AspectJ plugin is not supported in Community Editions of IntelliJ including Android Studio, so they cannot be used with Artisan.</p>
</div>

### Prerequisites

1\. IntelliJ IDEA Ultimate Edition with Android Plugin(s) enabled

2\. Minimum Android SDK of 10 in Android Manifest and build against the latest Android SDK (set in **project.properties**)

3\. Add the AspectJ plugin to IntelliJ
  * To make sure that the necessary plugins are enabled open the Settings/Preferences dialog.
  * In the left-hand part of the dialog, under IDE Settings, select Plugins.
  * On the Plugins page that opens in the right-hand part of the dialog, make sure that All plugins is selected in the Show box, and type aspectj in the search field.
  * Make sure that the check boxes to the left of AspectJ Support and Spring-AOP and @AspectJ support are selected.
  * Click OK in the Settings dialog.
  * Select to restart IntelliJ IDEA if so asked.
  * More details at <a href="http://www.jetbrains.com/idea/webhelp/enabling-aspectj-support-plugins.html" target="_blank">http://www.jetbrains.com/idea/webhelp/enabling-aspectj-support-plugins.html</a>

4\. Set up an AspectJ library for your module

  * Create a library for the **artisan/aspectj-1.7.2/aspectjrt.jar** jar
    * From the Module Settings choose Libraries
    * Click the + at the top to add a new library
    * Set the location as the **artisan/aspectj-1.7.2/aspectjrt.jar** in your project.
  * Add this library as a depedency of your app module

5\. Add the AspectJ Facet to your app module
  * Under module settings dialog choose Facets
  * Click the + to add a new facet and choose AspectJ

6\. Set your module to use the AspectJ compiler (ajc) instead of the Java compiler (javac)
  * In Settings/Preferences dialog expand the Compiler section and select Java Compiler under Project Settings
  * For Use Compiler select Ajc
  * For Path to Ajc compiler set the path to the artisan/aspectj-1.7.2/aspectjtools.jar in your project.

7\. Download the installer from Artisan Tools. You should have a file like: YourProjectName-ArtisanInstaller.zip

<div class="note note-important">
If you are using ProGuard please see the <a href="/dev/proguard-for-android/">Artisan ProGuard configuration instructions</a>.
</div>

### Artisan AspectJ installation instructions for IntelliJ

Artisan comes bundled with an installer that will configure your project and add the necessary files to your source root. It will also edit your AndroidManifest.xml to point to the ArtisanService that is needed to instrument your Artisan application.

1\. Extract the contents of YourProjectName-ArtisanInstaller.zip into your project's root directory.

2\. In a terminal, go to the artisan directory inside your project's root directory and run:
{% highlight bash %}
    install.bat --aspectj (on Windows)
    sh install.sh --aspectj (on Mac/OSX or linux)
{% endhighlight %}

This will update your manifest file, add the required libraries, generate Artisan AspectJ instrumentation for all of your activities and create an Application class, if one doesn't exist already.

If there are any settings in your application's manifest that are not compatible with Artisan you will be notified and the installer will not complete. For example, you must specify a minimum Android SDK of 2.3.3 or higher. Change the specified settings and run the Artisan installer again.

3\. In IntelliJ add the **artisan_library/artisan_library.jar** as a Library to your module.

4\. Make your Activity lifecycle methods public. In order to instrument your application Artisan needs any onStart, onStop and onDestroy methods that you have implemented in your app to be public. The default for the lifecycle methods is protected, which we are not able to instrument. If you skip this step Artisan will not work properly and you may experience errors and you may have unexpected behavior.

5\. Installation is now complete.

**Congratulations! You are now ready to start using Artisan!** Now you can <a href="/dev/quickstart-for-android/#api">get started with the Artisan Android API</a>.

<div class="note note-important">
<p>CRITICAL NOTE: It is imperative that at least before your final release build the artisan install script is run again with the --aspectonly flag, like this:</p>
{% highlight bash %}
  install.sh --aspectonly
{% endhighlight %}
<p>This will regenerate the Artisan instrumentation, the gen/../Artisaninstrumentation.aj file(s), so that all of your activities are fully instrumented so that analytics can be gathered and changes applied.</p>

<p>You can also run this script at any time without doing any harm. In fact, for Eclipse we have added a builder that takes care of re-running this script after each build, but since IntelliJ is only unofficially supported at this time the script will need to be manually run.</p>
</div>

<div id="ant"></div>
## Artisan SDK Installation for ANT

<div class="note note-important">
<p>Ant support for Artisan AspectJ is in BETA.</p>
</div>

Ant is an important tool for continuous integration so we want to make sure that you can build and verify your app with Artisan in it if you are using ant.

Here's what we need the ant build to do that it doesn't do by default:
* Run the artisan aspectj generator script
* Do the aspectj compilation after the java compilation

###Prerequisites
* Install Ant
* If you aren't already using ant to build your android app you can generate the initial build.xml by running the update project command from the root of your project in a terminal:
{% highlight bash %}
android update project --path .
{% endhighlight %}
* Follow the regular <a href="#aspectj">Artisan AspectJ Installation instructions</a> for your project and verify that everything is working as expected when you build and run your app with Artisan AspectJ from your favorite IDE.

### Artisan Ant Installation Instructions

1\. Create an **ant.properties** file if you don't have one already.

This should be in the root of your project, next to your build.xml file.

The file should contain:

{% highlight bash %}
java.compiler.classpath=artisan_library/artisan_library.jar
{% endhighlight %}

This will add the artisan library jar to your javac classpath even though it is not in your libs directory.

This file should be checked in to source control.

2\. Create a **custom_rules.xml** file.

This should be in the root of your project, next to your build.xml file. The contents should be:

{% highlight xml %}
<?xml version="1.0" encoding="UTF-8"?>
<project name="Artisan" default="artisan">
  <taskdef resource="org/aspectj/tools/ant/taskdefs/aspectjTaskdefs.properties">
   <classpath>
     <pathelement location="artisan/aspectj-1.7.2/aspectjtools.jar" />
   </classpath>
  </taskdef>

  <property name="aop.output" value="bin/aop" />

  <target name="-post-compile">
   <if condition="${aop.enabled}">
    <then>
     <echo message="Weaving aspects to .class files before dex converts .class files to .dex file" />
     <iajc destDir="${aop.output}" Xlintwarnings="true" showWeaveInfo="true" target="1.5" source="1.5">
      <sourceRoots>
          <pathelement location="${gen.absolute.dir}" />
      </sourceRoots>
      <inpath>
          <pathelement location="${out.classes.absolute.dir}" />
          <pathelement location="artisan_library/artisan_library_4.jar" />
      </inpath>
      <classpath>
       <path refid="project.target.class.path" />
       <path refid="project.all.jars.path" />
       <pathelement location="libs" />
      </classpath>
     </iajc>
     <move file="${out.classes.absolute.dir}" todir="${out.dir}/classes.old" />

     <!-- If your package starts with anything besides com (like org.sample.myapp), duplicate this line and add the first level of your package, replacing com like <move file="${aop.output}/org" todir="${out.classes.absolute.dir}" /> -->
     <move file="${aop.output}/com" todir="${out.classes.absolute.dir}" /> <!-- Don't delete or edit this line-->
     <delete dir="${aop.output}" />
    </then>
   </if>
  </target>

  <target name="artisan">
      <property name="aop.enabled" value="true" />
      <exec executable="bash" failonerror="true" dir="artisan">
          <arg line="install.sh --aspectonly"/>
      </exec>
  </target>
</project>
{% endhighlight %}

If you already have a custom_rules.xml file you can just copy the contents of the project element into your existing project element. If you already have a --post-compile target defined you can copy our steps after yours inside the post compile target.

This file should be checked in to source control.

3\. Copy the **artisan/aspectj-1.7.2/aspectjrt.jar** file to your project's libs directory. Check this in to source control too.

<div class="note note-hint">
  <p>TIP: To make sure that this doesn't break your Eclipse builds, in Eclipse go to your project's properties and under Java Build Path go to order and export and uncheck "AspectJ Runtime Library" so that it isn't exported twice now that it is in your libs directory.</p>
</div>

4\. Now you can build and install your app via ant with this command:

{% highlight bash %}
ant artisan debug install
{% endhighlight %}

You can do the same with any build target (release, instrument, etc). The important thing is that you call the artisan target after cleaning and before building

### Troubleshooting Ant builds for Artisan AspectJ

* Depending on your version of the Android SDK tools there are different variables for the build files. For example, if you are using an old SDK tools (possibly version 19 and below, from 2012), project.target.class.path should be android.target.classpath. If you run into any issues like this drop us a line and we will be glad to help get it sorted out!
