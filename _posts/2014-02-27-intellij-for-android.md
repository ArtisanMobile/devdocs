---
layout: docs
title: "IntelliJ Installation for Android"
author: "Artisan"
category: dev
description: "Installing Artisan for Android in IntelliJ"
---
#Artisan Quickstart Guide for Android in IntelliJ Ultimate Edition

<div class="note note-important">
<p>IntelliJ Ultimate Edition is unoficially supported by Artisan at this time. The AspectJ plugin is not supported in Community Editions of IntelliJ including Android Studio, so they cannot be used with Artisan.</p>
</div>

## Prerequisites

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

<!--<div class="note note-important">
If you are using ProGuard please see the <a href="/dev/proguard-for-android/">Artisan ProGuard configuration instructions</a>.
</div>-->

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

## Artisan installation instructions

Artisan comes bundled with an installer that will configure your project and add the necessary files to your source root.It will also edit your AndroidManifest.xml to point to the CustomArtisanService that is needed to instrument your Artisan application.

1\. Extract the contents of YourProjectName-ArtisanInstaller.zip into your project's root directory.

2\. In a terminal, go to the artisan directory inside your project's root directory and run:
{% highlight bash %}
    install.bat (on Windows)
    sh install.sh (on Mac/OSX or linux)
{% endhighlight %}

This will update your manifest file, add the required libraries, generate Artisan AspectJ instrumentation for all of your activities and create the CustomArtisanService class, if one doesn't exist already.

If there are any settings in your application's manifest that are not compatible with Artisan you will be notified and the installer will not complete. For example, you must specify a minimum Android SDK of 2.3.3 or higher. Change the specified settings and run the Artisan installer again.

3\. In IntelliJ add the **artisan_library/artisan_library_4.jar** as a Library to your module.

4\. Add all of the jars in your libs folder as Libraries for your app module

5\. Make your Activity lifecycle methods public. In order to instrument your application Artisan needs any onStart, onStop and onDestroy methods that you have implemented in your app to be public. The default for the lifecycle methods is protected, which we are not able to instrument. If you skip this step Artisan will not work properly and you may experience errors and you may have unexpected behavior.

6\. Installation is now complete.

**Congratulations! You are now ready to start using Artisan!** Now you can <a href="/dev/quickstart-for-android/#api">get started with the Artisan Android API</a>.

<div class="note note-important">
<p>CRITICAL NOTE: It is imperative that at least before your final release build the artisan install script is run again with the --aspectonly flag, like this:</p>
{% highlight bash %}
  install.sh --aspectonly
{% endhighlight %}
<p>This will regenerate the Artisan instrumentation, the gen/../Artisaninstrumentation.aj file(s), so that all of your activities are fully instrumented so that analytics can be gathered and changes applied.</p>

<p>You can also run this script at any time without doing any harm. In fact, for Eclipse we have added a builder that takes care of re-running this script after each build, but since IntelliJ is only unofficially supported at this time the script will need to be manually run.</p>
</div>
