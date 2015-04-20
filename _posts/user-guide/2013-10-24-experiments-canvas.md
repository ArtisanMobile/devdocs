---
layout: user-guide
title: "Experiments"
author: "Artisan"
category: user-guide/experiments
description: "Getting started with the Artisan MEM platform for developers."
---
# Experiments

## Creating a Canvas Experiment

To create a new Canvas Experiment, you'll need an instance of your app with the Artisan SDK installed running on either your device or within the simulator.  With this installation, observe the following steps:

* Navigate to the [Artisan Design Center]({% post_url user-guide/2013-10-24-app-map %}).
* Follow the instructions to connect your app to Artisan.
* Navigate to the screen on which you want to conduct the UI experiment.
* Click 'Create A New Experiment' on the right sidebar.

<img src="/images/screens/experiment-app-map-800x496.png" height="496" width="800" class="border-full" alt="Creating a new Canvas Experiment." />

### Designing Your Experiment

Once your new experiment is created, you will automatically be navigated to the [Artisan Canvas](% post_url user-guide/2013-10-24-design-canvas %}).  Here, you'll be able to create all of the variations for your experiment, design them, and get them ready to be published.

#### Creating Variations

The Variations panel located at the top left of the Canvas allows you to create multiple versions of the screen to experiment with. When you create a new experiment you will see two variations:

* "A" is your control. This is the current version of your screen that contains no changes and that your users are seeing on their devices. You'll notice that you can't make any changes to your control.
* "B" is a duplicate of your control. This is where you'll start making changes for experiment.

You can add as many variations that you need to by clicking the "+" button on the Variations panel. 

<img src="/images/screens/experiments-canvas-variations-330x310.gif" height="310" width="330" class="border-full" alt="Adding variations to a Canvas Experiment." />

You can also duplicate a variation by hovering your mouse over the variation and clicking the "duplicate" icon that appears to the right of the variation name.

#### Designing Variations

To change the design of a variation, simply choose the variation that you would like to work with by clicking on its name in the variation panel. From there you can select items on the screen to move, resize, or change the properties of.

<img src="/images/screens/experiments-canvas-800x507.png" height="507" width="800" class="border-full" alt="Sample Canvas Experiment design screen." />

See [Getting Started with the Artisan Canvas](% post_url user-guide/2013-10-24-design-canvas %}/getting-started) for more details on how to use the Canvas to design your variation.

If you want to revert the current variation back to its unedited state, click the "Revert Changes" button at the top of the Canvas.  This will revert the current variation back to match the Control variation.

When you are ready to start testing your designs click the "Ready to Test" button at the top of the Canvas. This will allow you to continue configuring your experiment.

## Configuring and Publishing a Canvas Experiment

See [Configuring Your Experiment]({% post_url user-guide/2013-10-24-experiments-settings %}).