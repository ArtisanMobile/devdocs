---
layout: docs
title: "Developing with Artisan"
author: "Artisan"
category: dev
description: "Getting started with the Artisan MEM platform for developers."
---
#Developing with Artisan

##iOS Topics
<table>
  <colgroup>
    <col width="20%" />
    <col width="40%" />
    <col width="40%" />
  </colgroup>
  <thead>
    <tr>
      <th>iOS Topic</th>
      <th>Supported</th>
      <th>Not Supported</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Development Environment</th>
      <td>Native iOS code XCode, NIBs and Story Boards for iOS</td>
      <td>Unity, Appcelerator, Phone Gap and Mono Touch</td>
    </tr>
    <tr>
      <th>Artisan &amp; ViewWillAppear</th>
      <td>Artisan makes dynamic changes at the ViewWillAppear stage of the app lifecycle</td>
      <td>Any changes the app makes after ViewWillAppear may have an adverse impact on the desired Artisan change</td>
    </tr>
    <tr>
      <th>Conditional content changes that occur after ViewWillAppear</th>
      <td>Artisan recommends to not make conditional content changes after ViewWillAppear</td>
      <td>Any changes the app makes after ViewWillAppear may have an adverse impact on the desired Artisan change</td>
    </tr>
    <tr>
      <th>Ordering &amp; Editing Table Cells</th>
      <td>Artisan supports Tables Cells via our Incode Capability click iOS Incode or Android Incode for more information</td>
      <td>Table Cells are currently not supported via Canvas</td>
    </tr>
    <tr>
      <th>AutoLayout - Buttons</th>
      <td>Artisan supports AutoLayout via our Incode capability click iOS Incode or Android Incode for more information</td>
      <td>Artisan does not support AutoLayout via Canvas</td>
    </tr>
    <tr>
      <th>Static Images - Buttons</th>
      <td>Artisan Canvas allows you to upload and exchange image files used for buttons</td>
      <td>Artisan Canvas does not support the editing of images used for buttons</td>
    </tr>
    <tr>
      <th>Multiple or layered ViewControllers</th>
      <td>Artisan allows you to select the desired ViewController to be experimented with</td>
      <td>NA</td>
    </tr>
    <tr>
      <th>Apps with Only One ViewController</th>
      <td>Artisan supports running one experiment per ViewController per user</td>
      <td>A single user cannot receive multiple experiments or multiple variations per ViewController</td>
    </tr>
    <tr>
      <th>Multiple experiments per ViewController</th>
      <td>Artisan supports running one experiment per ViewController per user</td>
      <td>A single user cannot receive multiple experiments or multiple variations per ViewController</td>
    </tr>
    <tr>
      <th>Identifying ViewControllers and Elements</th>
      <td>Developers name ViewControllers that can be easily understood by non-technical users</td>
      <td>Artisan does not support renaming ViewControllers via the Canvas</td>
    </tr>
    <tr>
      <th>Multiple Conversion Goals in Same Experiment</th>
      <td>Artisan supports multiple conversion goals via our Incode capability click iOS Incode or Android Incode for more information</td>
      <td>Artisan does not support multiple conversion goals via Canavs </td>
    </tr>
    <tr>
      <th>Same Conversion Goal Across Multiple ViewControllers</th>
      <td>Artisan supports setting the goal across multiple ViewControllers via our Incode capability click iOS Incode or Android Incode for more information</td>
      <td>Artisan does not support setting the same conversion goals across multiple ViewControllers via Canvas.</td>
    </tr>
    <tr>
      <th>Experimenting with Navigation Bar</th>
      <td>Artisan supports experimenting with elements in the navigation bar via our Incode capability click iOS Incode or Android Incode for more information</td>
      <td>Artisan does not support experimenting with elements in the navigation bar via Canvas.</td>
    </tr>
  </tbody>
</table>

###Known SDK Compatibility Issues for iOS

* IIViewDeck SDK
* Parse (Resolved)

Check out [this article](https://getsatisfaction.com/artisan/topics/third_party_conflicts) for more information on how to resolve the third party SDK conflicts.

<div id="android"></div>

##Android Topics
<table>
  <colgroup>
    <col width="20%" />
    <col width="40%" />
    <col width="40%" />
  </colgroup>
  <thead>
    <tr>
      <th>Android Topic</th>
      <th>Supported</th>
      <th>Not Supported</th>
    </tr>
  </thead>
  <tbody>
<tr>
  <th>Development Environment</th>
  <td>Artisan is regularly tested in apps built in Eclipse and with Ant and Proguard. Support for Gradle, Maven, Android Studio and IntelliJ is in BETA</td>
  <td>Artisan AspectJ with auto-instrumentation (optional version of SDK) cannot be used in Android Studio or IntelliJ Community Edition because the AspectJ plugin isn't available there.</td>
</tr>
<tr>
  <th>Artisan &amp; onStart</th>
  <td>Artisan makes dynamic changes at the onStart stage of the activity lifecycle</td>
  <td>Any changes the app makes after onStart may have an adverse impact on the desired Artisan change</td>
</tr>
<tr>
  <th>Conditional content changes that occur after onStart</th>
  <td>Artisan recommends to not make conditional content changes after onStart</td>
  <td>Any changes the app makes after onStart may have an adverse impact on the desired Artisan change</td>
</tr>
<tr>
  <th>Layouts</th>
  <td>Artisan supports scaling and translating views via the Artisan Canvas on Android for devices running API 12 and above.</td>
  <td>Artisan does not support resizing or moving views with Canvas on Gingerbread devices at this time.</td>
</tr>
<tr>
  <th>Multiple or layered Views, Activities and Fragments</th>
  <td>Artisan Canvas for Android does not yet support Fragments and layered views.</td>
  <td>NA</td>
</tr>
<tr>
  <th>Apps with Only One Activity</th>
  <td>Artisan supports apps with only one Activity. Special care must be taken with the In-Code API to account for the Artisan Service starting up.</td>
  <td>NA</td>
</tr>
<tr>
  <th>Multiple experiments per Activity</th>
  <td>Artisan supports running one experiment per Activity at a time for Canvas experiments</td>
  <td>You cannot run multiple experiments for an Activity at the same time</td>
</tr>
<tr>
  <th>Identifying Activities and Elements</th>
  <td>Developers name Activities that can be easily understood by non-technical users</td>
  <td>Artisan does not support renaming Activities or Fragments via the Canvas</td>
</tr>
<tr>
  <th>Multiple Conversion Goals in Same Experiment</th>
  <td>Artisan supports multiple conversion goals via our In-Code capability. See <a href="/dev/android/incode-experiments/">Android In-Code</a> for more information.</td>
  <td>Artisan does not support multiple conversion goals via Canvas</td>
</tr>
<tr>
  <th>Experimenting with Action Bar</th>
  <td>Artisan supports experimenting with elements in the action bar via our In-Code capability. See <a href="/dev/android/incode-experiments/">Android In-Code</a> for more information.</td>
  <td>Artisan does not support experimenting with elements in the action bar via Canvas.</td>
</tr>
</tbody>
</table>

###Known SDK Compatibility Issues for Android

* The Artisan SDK dependencies are bundled into the Artisan jar and obfuscated to avoid any version conflicts with other libraries. However, if you are using the **ch.boye.httpclientandroidlib** jar you might have issues when dexing due to duplicate files.
   * SOLUTION: You can pass the --expanded flag in when you install Artisan to install a version of Artisan without our dependencies obfuscated and bundled in. Our dependencies will be copied in to your libs folder by the installer. You will have to manage any version conflicts between the Artisan dependencies and your existing dependencies.
