---
layout: user-guide
title: "Managing Your Account"
author: "Artisan"
category: user-guide
description: "Managing your account for Artisan organizational users."
---
# Managing Your Account

## Table of Contents

<ul>
  <li><a href="#account-settings">Account Settings</a></li>
  <li><a href="#manage-users">Manage Users</a></li>
  <li><a href="#enabling-api">Enabling the Artisan API</a></li>
</ul>

<div id="account-settings"></div>

## Account Settings

From the Account Settings page, you can view and manage your organization's details, including users in the organization and your API settings.

<img src="/images/screens/nav-account-settings.png" class="border-full"/>

### Account Usage

You can view your account usage on the main page by clicking the Artisan logo in the upper left-hand corner. This includes the number of monthly active users (MAU) used during the current and prior calendar month.  Please <a href="mailto:support@useartisan.com">contact us</a> with any questions regarding account usage.

<div id="manage-users"></div>

## Manage Users

Invite and manage users from the Account Settings page for your organization. You can invite, edit, and remove users, as well as manage what level of access they have to use Artisan functionality and view analytics. To show all users who are in the organization or who have been invited, click 'Show All Users'.

### Adding Users

To invite a new user to your organization, scroll to the 'Users and Groups' section, then click `Invite a User` and fill in the information in the prompt.

Artisan currently supports the following roles within an organization:

* **Read-Only User**: This user will only have access to view Artisan analytics data, as well as the results of your experiments and campaigns.  They will not be able to create new experiments or campaigns, edit power hook values, publish personalization changes, or anything else that modifies the experience of your app.
* **User**: This user will have full enablement of Artisan functionality -- including the ability to create and publish experiments, UI changes, Power Hooks, and other app modifications.
* **Administrator**: This user will have full enablement of Artisan functionality, and will also be able to add, remove, and modify other user accounts within this organization.

Upon clicking 'Send Invite', Artisan will automatically send an email to that user with instructions on how to register with Artisan. Once they register, they will automatically be added to your organization.

If the user still hasn't accepted the original invite, you can click 'Resend Invite' to send a new invitation email.

You can revoke this invite at any time, which will invalidate the temporary credentials included in the Artisan registration email.

### Editing and Removing Users

You can edit a user account at any time by clicking their name in the 'Users' table.  Here, you can edit their name, job title, email address, and access role.

<div class="note note-hint">
  <p><strong>NOTE:</strong> If you edit a user's email address, this will change their username when logging into Artisan.</p>
</div>

You can also delete any user out of the system by clicking their name in the 'Users' table, then clicking the 'Delete' button at the bottom of their user profile. Their access to Artisan will be revoked immediately.

### Two-factor Authentication

From the Account Settings page, you can enable two-factor authentication for your organization. This will prevent unauthorized users from accessing an Artisan user account, even if they have a password, by requiring all users in the organization to enter an 8-digit code in addition to their username and password in order to access Artisan. Authentication codes are sent via email to the address associated with the user account.

<img src="/images/screens/two-factor-enable-organization.png" class="border-full"/>

A two-factor code will be required each time the user authenticates with Artisan from the web and when connecting a device to Artisan. You can opt to "Remember me for 30 days" when logging in to artisantools.com. When connecting a device your authentication token will be stored and you can make the Artisan gesture to re-connect without having to enter your credentials as long as your session is valid or until you log out on the web or via the "Log Out" button on the Artisan overlay (or by tapping the Artisan notification for Android).

When logging in each user has a maximum of 3 attempts to enter a valid two-factor code. If the maximum attempts have been made the user will be locked out of the Artisan platform. As an organization administrator you can unlock the user by clicking 'Unlock' in their row in the Users table.

<img src="/images/screens/two-factor-unlock-user.png" class="border-full"/>

<div class="note note-important">
	<p>For connecting devices to Artisan with two-factor authentication you will need to have at least Artisan iOS SDK v2.3.5 or Artisan Android SDK v2.3.2 installed.</p>
</div>

<div id="enabling-api"></div>

## Enabling the Artisan API

The Artisan API allows developers to make requests and receive responses directly to and from the Artisan platform in JSON format. In order to use the API, you must first enable it in Account Settings.

See the [Artisan API Getting Started Guide]({% post_url api/2015-06-10-getting-started-api %}) for details.

