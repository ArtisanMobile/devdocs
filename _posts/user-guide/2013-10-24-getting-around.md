---
layout: user-guide
title: "Getting Around"
author: "Artisan"
category: user-guide
description: "Getting started with the Artisan MEM platform for developers."
---
# Getting Around

## Notifications
The Notification center helps you stay on top of your app's performance. Artisan will send you alerts on how your app is performing, A/B test suggestions, Goal Funnel trends, and other helpful communications. You can access the Notification Center by clicking on the Notifications icon on the menu bar.

If you have an unread message, the notification icon will be highlighted and display the number of unread messages waiting for you:

<img src="/images/screens/nav-unread-messages-700x58.png" height="58" width="700" class="border-full" alt="Artisan navigation menu showing unread notifications." />

You can open you notification inbox any time by clicking on the notifications icon in menu. Your notification inbox contains read and unread items. Unread items are indicated by a bold subject name. To open a notification, click on a notification to open and read the notification details. You can close a notification by clicking the Close icon, located on the top right of the notification.

<div id="account-settings"></div>

## Account Settings

The account settings screen can be accessed by hovering over the user icon to the right of the notifications icon at the top of your screen. On this page you will be able to view your account usage and manage user access controls.

### Account Usage

View your account usage, including the number of monthly active users (MAU) used during the current and prior calendar month.  Please <a href="mailto:support@useartisan.com">contact us</a> with any questions regarding account usage.

<div id="manage-users"></div>

### Manage Users

The 'Users' area can be used to add, remove, and edit all of the users who have access to your organization within Artisan.  Use this to manage who can log into artisantools.com, as well as what level of access they have to use Artisan functionality and view analytics.

#### Adding Users

To invite a new user to your organization, click `Invite a User` on the right-hand side of the 'Users' area, then fill in the information in the prompt.

Artisan currently supports the following roles within an organization:

* **Read-Only User**: This user will only have access to view Artisan analytics data, as well as the results of your experiments and campaigns.  They will not be able to create new experiments or campaigns, edit power hook values, publish personalization changes, or anything else that modifies the experience of your app.
* **User**: This user will have full enablement of Artisan functionality -- including the ability to create and publish experiments, UI changes, Power Hooks, and other app modifications.
* **Administrator**: This user will have full enablement of Artisan functionality, and will also be able to add, remove, and modify other user accounts within this organization.

Upon clicking 'Send Invite', Artisan will automatically send an email to that user with instructions on how to register with Artisan.  Once they register, they will automatically be added to your organization.  

You can revoke this invite at any time, which will invalidate the temporary credentials included in the Artisan registration email.

#### Editing and Removing Users

You can edit a user account at any time by clicking their name in the 'Users' table.  Here, you can edit their name, job title, email address, and access role.

<div class="note note-hint">
  <p><strong>NOTE:</strong> If you edit a user's email address, this will change their username when logging into Artisan.</p>
</div>

You can also delete any user out of the system by clicking the 'Delete' button in their row of the User table.  Their access to Artisan will be revoked immediately.

### Two-factor Authentication

From your Account Settings you can enable two-factor authentication for your organization. This will require all users in the organization to enter an 8-digit code in addition to their username and password in order to access Artisan. Authentication codes are sent via email to the address associated with the user account.

<img src="/images/screens/two-factor-enable-organization.png" class="border-full"/>

A two-factor code will be required each time the user authenticates with Artisan from the web and when connecting a device to Artisan. You can opt to "Remember me for 30 days" when logging in to artisantools.com. When connecting a device your authentication token will be stored and you can make the Artisan gesture to re-connect without having to enter your credentials as long as your session is valid or until you log out on the web or via the "Log Out" button on the Artisan overlay (or by tapping the Artisan notification for Android).

When logging in each user has a maximum of 3 attempts to enter a valid two-factor code. If the maximum attempts have been made the user will be locked out of the Artisan platform. As an organization administrator you can unlock the user by clicking "Unlock" next to their user account information.

<img src="/images/screens/two-factor-unlock-user.png" class="border-full"/>

<div class="note note-important">
	<p>For connecting devices to Artisan with two-factor authentication you will need to have at least Artisan iOS SDK v2.3.5 or Artisan Android SDK v2.3.2 installed.</p>
</div>
