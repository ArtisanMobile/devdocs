---
layout: user-guide
title: "Design Canvas"
author: "Artisan"
category: user-guide
description: "Getting started with the Artisan MEM platform for developers."
---
# Canvas
The Canvas is a WYSIWYG editor used to make dynamic, code-free changes to the visuals of your app.  These changes can include the following:

* Building an A/B test
* Creating a visual personalization
* Adding visual tags to enrich the event data collected on each screen

The Canvas is best used to make small UI tweaks that you want to apply immediately, without deploying code or an app update to your users.

## Supported Apps

The Canvas supports the following app screens:

* iOS App screens built using UIKit elements.

The Canvas does *not* support the following:

* Android apps (and associated activities)
* Interfaces created using game engines and other non-UIKit-based frameworks (e.g. Unity, Cocos2D)
* Web Views and HTML5-constructed interfaces (e.g. Apache Cordova-based apps)
* UIs drawn using CoreGraphics and other direct-draw capabilities.

## Getting Started With the Canvas
Once you've connected your app to the Artisan [Design Center]({% post_url user-guide/2013-10-24-app-map %}), you can navigate within your app to see the different actions available for each screen.  Once you've navigated to your target screen, if it's eligible for use with the Canvas, you should see the following options:

* Create a New Experiment
* Modify and Personalize
* Add a tag

Selecting any of these will automatically open the Canvas for the currently selected screen.  You can now directly interact with the screen shown in the Canvas to resize and move things on the screen such as buttons and images.

<p><img src="/images/screens/canvas-sample-screenshot-700x569.jpg" width="700" height="569" alt="Screen capture of an A/B test being built via Canvas." /></p>

On the left of the Canvas you will see the Screen Browser. The Screen Browser is a tree listing of each of the UI items that are available on your screen. Sometimes multiple items may be stacked on top of each other making it difficult to select the item that you want to make changes to. The Screen Browser makes this easy by allowing you to simply click on the name of the element you would like to change. Clicking an item in the list selects the item on the screen and displays the available properties.

Selecting an item on the screen also displays all of the properties available for you to change for that item. The properties are displayed on the right hand side of the page. Different items on the screen have different properties available for you to change, so depending on the item you selected you will be able to update text, change images, modify the font size of a paragraph, and much more.

<div class="note note-hint">
  <p>Note: For iOS UIs built using Auto-Layout, repositioning elements will fix their position to a specific static coordinate, with associated relationships updating to reflect this new static position.</p>
</div>

Depending on what you are working on, the Canvas may display additional information. For instance, if you are working on an Experiment, a list of variations is displayed. If you are personalizing a screen a list of segments will appear. You can learn more about using these tools in:

* [Personalize] { % post_url 2013-10-24-personalize.md % }
* [Optimize] { % post_url 2013-10-24-optimize.md % }

<div id="instant-publishing"></div>

## Instant Publishing
With Canvas, you are able to make changes to the design of your application and publish those changes immediately to your customers.

### Making Changes to Your App
Artisan makes it easy to make changes to your app, like fixing a typo or updating an image.

* Open the App Map by clicking on the App Map icon on the navigation menu on the left of your screen
* Using your device (or simulator) select the screen that you would like to modify and click the "Modify and Personalize" link located in the Action Sheet on the right
* Once in the Artisan Canvas you can start making changes to your screen. For example you can update the text of a button, change background colors, and move items around on the screen.
* Once you have finished making your changes, hit **Publish** on the top right corner. This will immediately publish your changes to all of your users and will be available the next time your users open their app.

You can also make changes and publish those changes to specific segments of users with Artisan Personalize. To learn more about personalizing your user experience read about **Artisan Personalize**.

<div id="canvas-tagging"></div>

## Canvas Tagging
Canvas tagging allows you to associate any piece of information displayed on the screen with an action that a user performs. For example, if your app allowed users to make purchases you could associate the total cart value with each time a user taps the "Purchase" button. This additional information allows you to create more targeted segments of users and gain deeper insights into how your users are interacting with your app.

### Applying Canvas Tags
* Click 'Create New Tag' on the right hand side of the screen
* Click Start Tagging
* Click on the object on the screen (button, switch, etc…) that triggers the event you wish to tag and click "Next"
* Now you can select the pieces of information you would like to associate with the action you selected in the previous step. This could be a piece of text, or it could be multiple pieces of information — multiple text fields, input field values, etc...
* Type the name for your tag in the text field. This name will identify the tag when you use it to filter the given event in the Event Report.
* Then click Finish.

### Deleting a Tag
* Navigate to the screen the tag is on through App Map.
* Click "Modify and Personalize", and click the Tag tab on the right hand side. (or alternatively, `Add a Tag`).
* This will open up your list of tags for the current screen.
* Click the X icon next to the tag you would like to remove.

### Viewing Tag Reports
To see reports on the relationship between the target behavior and the label or text field, go to the Events Report within Artisan Analyze.

* Click the "Analyze" icon on the navigation menu on the left of the screen
* Select the "Events" tab
* Select the event that you would like to view from the list of events

In the drop down above the Event Report, the tag that was just identified should be available. This tag will allow you to filter the Event Report to show only events that happened while this tag was present on the screen (i.e. show only when this event happened with '$24' shown as the Product Price).
You can then enter the data (e.g. Product Price of $24) to see the trend line associated with that product.