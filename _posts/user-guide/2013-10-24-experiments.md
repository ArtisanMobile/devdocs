---
layout: user-guide
title: "Experiments"
author: "Artisan"
category: user-guide
description: "Getting started with the Artisan MEM platform for developers."
---
# Experiments
Experiments allow you to test different variations of your app against live users to see which generates the highest level of engagement, retention, and conversion. These winning variations can then be pubished as the 'official' verison of your app to all new and existing users.  Use this capability to iterate quickly and optimize the performance of your app in all the ways it counts.

## Getting Started
There are three types of experiments that Artisan offers, each which balances power with ease of deployment:

<p><img src="/images/screens/experiment-types-800x305.jpg" width="800" height="305" alt="Types of Artisan Experiments." /></p>

* **[Canvas / Web Interface]({% post_url user-guide/2013-10-24-experiments-canvas %})**: Use the [Artisan Design Center]({% post_url user-guide/2013-10-24-app-map %}) and [Canvas]({% post_url user-guide/2013-10-24-design-canvas %}) to make simple UI changes without writing any code or deploying anything to the App Store.  The WYSIWYG Canvas can support editing most properties on UIKit-based UIs, and requires no setup or code deployment beyond the Artisan SDK being installed.  (__iOS Only__)
* **[Power Hooks]({% post_url user-guide/2013-10-24-experiments-powerhook %})**: Use [Artisan Power Hooks]({% post_url user-guide/2015-04-15-powerhooks %}) to experiment with feature flag values, business logic flags, and other code-level parameters.  Once the applicable Power Hooks are integrated into your app, you can run unlimited A/B tests without any ongoing code or app deployments.  You can also use Aritsan Experiments to target Power Hook values to specific segments.
* **[In-Code SDK]({% post_url user-guide/2013-10-24-experiments-in-code %})**: Use the [Artisan In-Code Experiment API]({% post_url ios/2014-05-09-power-hooks %}) to build variations directly within the code of your app.  These variations can then be registered with Artisan, which will manage distributing them to different users, compiling the results, and enabling a winner.

For each of these experiment types, Artisan will [show the results for the test]({% post_url user-guide/2013-10-24-experiments-results %}), and the winning variation can be published to all users within the target segment for the purposes of improving your app's performance in the wild.
