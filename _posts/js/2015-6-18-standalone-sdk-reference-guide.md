---
layout: docs
title: "Artisan Javascript API"
author: "Artisan"
category: dev/js
description: "PUT DESCRIPTION HERE"
---

# Artisan Javascript Web API Reference Guide

This document provides an overview of all of the API calls available within the Artisan Javascript Web SDK.

## Table of Contents

<ul>
  <li><a href="#sdkobject">The ArtisanSDK Object</a></li>
  <li><a href="#sendmethod">The send() Method</a></li>
  <li><a href="#sendcalls">Functions To Call Through send()</a>
    <ul>
      <li><a href="#sdkcontrol">SDK Control</a>
        <ul>
          <li><a href="#startartisan">startArtisan(appId, postInterval, tracerInterval, screenName)</a></li>
          <li><a href="#turnoff">turnArtisanOff()</a></li>
          <li><a href="#turnon">turnArtisanOn()</a></li>
          <li><a href="#removepushstate">removePushStateListener()</a></li>
        </ul>
      </li>
      <li><a href="#trackingapi">Tracking API</a>
        <ul>
          <li><a href="#trackEvent">trackEvent(eventName)</a></li>
          <li><a href="#trackEvent">trackEvent(eventName, parameters)</a></li>
          <li><a href="#trackEvent">trackEvent(eventName, parameters, category, subCategory, subSubCategory)</a></li>
        </ul>
      </li>
      <li><a href="#profileapi">Profile API</a>
        <ul>
          <li><a href="#setprofilevariable">setProfileVariable(property, value, valueType)</a></li>
          <li><a href="#clearprofilevariable">clearProfileVariable(property)</a></li>
          <li><a href="#clearprofile">clearProfile()</a></li>
        </ul>
      </li>
    </ul>
  </li>
</ul>