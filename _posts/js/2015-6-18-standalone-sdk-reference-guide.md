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
          <li><a href="#startartisan">send('startArtisan', appId, postInterval, tracerInterval, screenName)</a></li>
          <li><a href="#turnoff">send('turnArtisanOff'</a></li>
          <li><a href="#turnon">send('turnArtisanOn')</a></li>
          <li><a href="#removepushstate">send('removePushStateListener')</a></li>
        </ul>
      </li>
      <li><a href="#trackingapi">Tracking API</a>
        <ul>
          <li><a href="#trackEvent">send('trackEvent', eventName)</a></li>
          <li><a href="#trackEvent">send('trackEvent', eventName, parameters)</a></li>
          <li><a href="#trackEvent">send('trackEvent', eventName, parameters, category, subCategory, subSubCategory)</a></li>
        </ul>
      </li>
      <li><a href="#profileapi">Profile API</a>
        <ul>
          <li><a href="#setprofilevariable">send('setProfileVariable', property, value, valueType)</a></li>
          <li><a href="#clearprofilevariable">send('clearProfileVariable', property)</a></li>
          <li><a href="#clearprofile">send('clearProfile')</a></li>
        </ul>
      </li>
    </ul>
  </li>
</ul>

<div id="sdkobject"></div>

## The ArtisanSDK Object

<div id="sendmethod"></div>

## The send() Method

<div id="sendcalls"></div>

## Functions To Call Through send()

<div id="sdkcontrol"></div>

## SDK Control

<div id="startartisan"></div>

### send('startArtisan', appId, postInterval, tracerInterval, screenName)

<div id="turnoff"></div>

### send('turnArtisanOff')

<div id="turnon"></div>

### send('turnArtisanOn')

<div id="removepushstate"></div>

### send('removePushStateListener')

<div id="trackingapi"></div>

## Tracking API

<div id="trackevent"></div>

### send('trackEvent', eventName)<br>send('trackEvent', eventName, parameters)<br>send('trackEvent', eventName, parameters, category)<br>send('trackEvent', eventName, parameters, category, subCategory)<br>send('trackEvent', eventName, parameters, category, subCategory, subSubCategory)

<div id="profileapi"></div>

## Profile API

<div id="setprofilevariable"></div>

### send('setProfileVariable', property, value, valueType)

<div id="clearprofilevariable"></div>

### send('clearProfileVariable', property)

<div id="clearprofile"></div>

### send('clearProfile')