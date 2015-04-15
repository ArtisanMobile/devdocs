---
layout: user-guide
title: "Power Hooks"
author: "Artisan"
category: user-guide
description: "Creating Power Hooks in Artisan."
---
# Power Hooks

## Getting Started

Power Hooks are in-code variables whose values you can control via the Artisan Tools Power Hook Control Panel, with these values transmitted automatically to all targeted devices to control business logic, unlock functionality, modify parameters, and otherwise change the behavior of your app.  Applications for Power Hooks include:

* Implementing feature flags to enable different aspects of your app for different audiences.
* Controlling operating parameters such as discount values, coupon codes, sale offers, ad pre-roll lengths, difficulty controls, etc.
* Passing URLs for static content and other assets.
* Controlling screen layouts.
* A/B testing business logic.

Additionally, Artisan also supports **Power Hook Code Blocks**.  These are code blocks that accept groups of parameters controlled like ordinary Power Hooks.  These code blocks can be used to trigger special conversion actions for your Artisan Campaigns, including push notifications and in-app notifications.

### To get started with Power Hooks:

1. **Get Power Hooks installed into your application.** The [iOS Developer Guide]({% post_url ios/2014-05-09-power-hooks %}), [Android Developer Guide]({% post_url android/2014-05-08-power-hooks %}), and [JS Developer Guide]({% post_url js/2014-07-18-hybrid-sdk-reference-guide %}/#powerhookapi) each provide an overview on how to get Power Hooks initialized within your application code.

1. **Register your installed Power Hooks with Artisan Tools.** Once your Power Hooks are successfully integrated into your app, you can register them with Artisan by connecting your app directly to Artisan Tools.

1. **Update your Power Hook values.** Use the Artisan Power Hook Control Panel to update the value of your Power Hooks, preview their impact on your app, launch A/B tests for their values, and publish personalized values to specific segments.

1. **Create Power Hook Code Blocks.** Perform the same steps to create Power Hook Code Blocks, which can be used to customer groups of Power Hooks and enable powerful custom calls-to-action for your Artisan campaigns.

