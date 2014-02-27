---
layout: docs
title: "Ant Installation for Android"
author: "Artisan"
category: dev
description: "Setting up Artisan with your Android Ant Builds"
---
# Artisan SDK Installation for ANT

<div class="note note-important">
<p>Ant is unoficially supported by Artisan at this time.</p>
</div>

Ant is an important tool for continuous integration so we want to make sure that you can build and verify your app with Artisan in it if you are using ant.

Here's what we need the ant build to do that it doesn't do by default:
* Run the artisan aspectj generator script
* Do the aspectj compilation after the java compilation

##Prerequisites
* Install Ant
* If you aren't already using ant to build your android app you can generate the initial build.xml by running the update project command from the root of your project in a terminal:
{% highlight bash %}
android update project --path .
{% endhighlight %}
* Follow the regular <a href="/dev/quickstart-for-android/">Artisan Installation instructions</a> for your project and verify that everything is working as expected when you build and run your app with Artisan from your favorite IDE.

## Artisan Ant Installation Instructions

1\. Create an **ant.properties** file if you don't have one already.

This should be in the root of your project, next to your build.xml file.

The file should contain:

{% highlight bash %}
java.compiler.classpath=artisan_library/artisan_library_4.jar
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

## Troubleshooting

* Depending on your version of the Android SDK tools there are different variables for the build files. For example, if you are using an old SDK tools (possibly version 19 and below, from 2012), project.target.class.path should be android.target.classpath. If you run into any issues like this drop us a line and we will be glad to help get it sorted out!
