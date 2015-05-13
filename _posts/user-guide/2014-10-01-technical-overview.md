---
layout: user-guide
title: "Technical Overview"
author: "Artisan"
category: user-guide
description: "Learn to segment users into Lists in Artisan Mobile."
---
# Technical Overview

Artisan’s technology infrastructure has been designed and built with the utmost care to deliver maximum performance while ensuring there is no adverse impact to your app or your users. Having built hundreds of mobile apps ourselves, we know how critical this is. Every consideration has been made and every precaution taken to ensure we achieve this objective. From security and reliability to performance and availability, all the latest best practices in mobile architecture and cloud computing have been applied, as well as a few innovations of our own. You work hard enough to make your app amazing and you don’t need your partners adding to your stress.

## Artisan Mobile Experience Management Overview

The Artisan Mobile Experience Management (MEM) platform is an enterprise-grade solution comprised of two major components: 1) a robust, multi-tenant cloud platform that hosts each of the Artisan products as well as our data analytics warehouse and 2) an intelligent, lightweight software development kit (SDK) that handles all communication with your app. Each of these components has been engineered with the greatest of care and is described in more detail below.

## The Artisan Cloud

The Artisan Cloud is a true multi-tenant architecture that is globally accessible through an Internet browser. All customers share a single, common infrastructure and a code base that is centrally maintained. Our platform has been engineered to be secure, stable and highly scalable – capable of supporting businesses with tens of millions of monthly active users.

<p><img src="/images/artisan-technical-overview-diagram.png" width="700" height="480" class="border-full" alt="Overview of the Artisan Cloud." /></p>

The Artisan Cloud is hosted by Amazon via the Amazon Elastic Compute Cloud (EC2) and derives all the benefits of its elastic computing infrastructure, including SOC1/SSAE 16/ISAE 3402 and ISO 27001 certification. We use all Linux-based EC2 instances for our servers. Our application services are fault-tolerant and automatically load-balanced across multiple dynamically allocated application instances.

The Artisan Cloud is composed of four essential pieces:

### The Artisan Application Service

* Manages Artisan user and organization accounts
* Allows modification to data pertaining to Artisan experiments, audience segmentation, campaigns, Power Hooks, and Canvas-based UI changes
* Includes the artisantools.com website, through which all Artisan users interact with the Artisan platform
* Includes the services.artisantools.com REST web service, through which all Artisan SDKs download playlists used to execute updates within Artisan-enabled apps
* Manages of all static asset data (including uploaded image content as part of Artisan UI changes), to be maintained and served through Amazon S3
* Schedules and submits personalized push notifications to be sent to specific user segments as part of marketing campaigns defined via artisantools.com.

### The Artisan Canvas Messaging Service

* Connects the Artisan Canvas (running in the user’s browser) directly with their Artisan-SDK enabled device for designing tests

### The Artisan Analytics Service

* Receives the analytics data collected by all Artisan-enabled apps and injecting this information into the Artisan Analytics Cloud

### The Artisan Data Service

* Persists all Artisan-related data, including the analytics data stored, collated, and managed via the Artisan Analytics Cloud

Data within the Artisan Cloud is maintained in two persistence systems within the Artisan Data Services. Core Artisan data – including organizational data, user accounts, test definitions, and persisted UI changes – is maintained within the Artisan Core Database Services.

These services are duplicated in a full master-slave, multi-instance replica set and backed up nightly to Amazon S3. Analytics data is maintained within the Artisan Analytics Cloud, which warehouses all Artisan analytics data submitted from all active apps. The Artisan Analytics Cloud distributes collected data across a thrice-redundant HDFS cluster, with all content packaged, balanced, and backed-up for ongoing analytics reporting usage.

The entire infrastructure has been designed to be fully fault tolerant with no single point of failure. The Artisan Cloud is housed across multiple Amazon EC2 availability zones, and is rapidly transferrable across multiple geographically diverse data centers throughout the United States that have power and network redundancy. If there is a failure with any instance in the system – whether it is part of the Application Services, Core Database Service, or Analytics Cloud – the infrastructure will instantly failover to a replica of that instance with no lost data or downtime. In the unlikely event that there is a facility-wide failure, network traffic will be switched over to a geographically diverse location with a full instance of the Artisan Cloud backed by a recent copy of the data.

To further ensure a high level of availability, we have deployed industry-leading monitoring tools that constantly perform a wide array of checks on all of our services and alerts are monitored on an around the clock basis.

We employ state of the art security policies and technology to ensure your data is kept safe at all times. Each and every communication is SSL/TLS with 128-bit encryption using VeriSign verified certificates. In addition, all passwords and private keys are protected with state of the art cryptographic hash functions. Additionally, organizations can enable two-factor authentication for an extra layer of protection when connecting to Artisan.

All data collected in Artisan is stored anonymously and is never shared with anyone. Our systems also undergo annual 3rd-party penetration testing and constant peer review. All employees undergo an extensive criminal, educational and employment background check and are subject to our least access privilege policies.

## The Artisan SDK

We have engineered the Artisan SDK to be lightweight and fault tolerant, never interfering with the function and performance of your app. The Artisan SDK is exceptionally easy to install (takes just a few minutes) and acts as the communication layer between the app and Artisan’s secure cloud. It enables the Artisan product suite to connect with your app for key functionality such as discovering and interpreting screen designs, dynamic delivery of changes to the UI/UX, and auto-collection of analytics for submission back to the Artisan Analytics Cloud.

The SDK adds minimal size to your app (roughly 2 megabytes) and during live experiments there is a modest 2 megabytes of additional memory overhead when in use. Message payload is also minimal at 9 kilobytes per 50 analytics messages and 3 to 5 kilobytes for “playlists” (how we describe and render UX/UI changes). Response time latency is sub-millisecond when processing message requests.

If at any time our SDK cannot connect to the Artisan Cloud, your application will continue to run as expected. All playlists are downloaded asynchronously and will never delay the normal behavior of the app itself. In instances where the Artisan secure cloud cannot be accessed, the app will continue to use whatever playlist data has already been downloaded. Any analytics data is also persisted locally on the device and retransmitted once connection is restored.

All device processes are executed in the background when spare cycles are available and each and every web socket communication utilizes 128-bit data encryption and gzip compression to minimize network utilization and ensure communications security. Analytics transmission occurs in batch jobs that occur only every 30 seconds and when the app is started or put into the background to minimize both network usage and power consumption. Our SDK operates completely independently from any other SDKs you may have installed in your app and is designed to be completely tolerant of any changes other SDKs make to the system.

The Artisan SDK is designed to work both with apps with UIs built programmatically as well as apps with UIs built using the Apple Interface Builder and Storyboard tools to create NIB and XIB files. The Artisan SDK also contains the Power Hooks and In-Code APIs. Developers can use the API to provide business users with advanced “instrumentation” to support more complex testing of alternative business logic, workflows or navigation structures. Once implemented (and resubmitted to the app store), this instrumentation is available throughout the Artisan product suite.

## Installation and Upgrades

Artisan currently supports iOS 6+ and Android 2.3.3 (API Level 10)+ devices. Google Chrome or Mozilla Firefox is required to access artisantools.com.
Installing and upgrading Artisan is simple. The easiest way to get started is by registering on our website (useartisan.com), logging into your newly created aritsantools.com account, and downloading our SDK distribution.

For iOS, decompress the archive, copy the framework and bundle files into your project, and following the remaining few steps described in your artisantools.com account. You may also install or upgrade the Artisan SDK using CocoaPods — the central CocoaPods repository (http://cocoapods.org) contains the latest Artisan distribution for easy integration.   The iOS Artisan SDK requires the CoreData, CoreLocation, CFNetwork, Security, QuartzCore, and SystemConfiguration frameworks to be enabled.

For Android, execute the installation wizard, which will download the necessary JARs, update your project manifest, and configure your project to be integrated with Artisan.  The Android SDK requires the INTERNET and ACCESS_NETWORK_STATE permissions to be enabled. Installation details can be found at docs.useartisan.com.

## Artisan in Operation

Once the Artisan SDK has been integrated, an authorized user in your organization may login to our artisantools.com web platform and connect to the app by following the on-screen instructions. This user is now in “edit mode,” which is a function available only to authorized users within your organization. The secure web interface provides an intuitive point-and-click, drag and drop interface for making design changes, conducting A/B experiments, reviewing analytics etc.

Once the app is connected to the Artisan platform, the functionality of the Artisan product suite can be invoked. This functionality includes viewing analytics for how your app is performing, building dynamic user segments based on demographic and behavioral criteria, creating marketing campaigns that include personalized push notifications, dynamically changing the app’s behavior via integrated Artisan Power Hooks, and making ad-hoc, personalized changes to the app’s interface via the Artisan Canvas WYSIWYG editor. Any updates or experiments are then saved securely in the Artisan cloud in the form of a playlist.

When an app user foregrounds their app, or when an Internet connection is established, the Artisan cloud is polled for updates to the playlist. The playlist is then asynchronously downloaded in the background and cached locally on the phone. The next time an end-user navigates to an area of the app that has been modified, the SDK checks the playlist and displays the new design, initiates the relevant experiment, or triggers the relevant Power Hook. A screen design is never changed while an app user is looking at it.

In addition, every user interaction and gesture in the app is captured and stored for analytics purposes to deliver deep insights into app utilization and user behavior.
