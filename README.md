# mynginx

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with mynginx](#setup)
    * [What mynginx affects](#what-mynginx-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with mynginx](#beginning-with-mynginx)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This is a test module created by myself for myself, it should not be used in production.

## Module Description

Sample module to automate the configuration of a sample website with nginx

## Setup

### What mynginx affects

   user/group accounts 
   file/directory permissions
   niginx install
   git install
   

### Setup Requirements **OPTIONAL**

requires:
   
    puppetlabs-stdlib (>= 1.0.0)
    jfryman-nginx (>= 0.2.2) 

### Beginning with mynginx

puppet module install seamusmurray-mynginx
class { 'mynginx': }

## Usage

class { 'mynginx': }

## Reference

class mynginx

## Limitations

Compatible with the Operating Systems:

    Debian: 5.0, 6.0
    RedHat: 5.0, 6.0, 7.0
    SLES
    Ubuntu: 14.04, 12.04, 10.04

This module does not...

* open up tcp port 8000 on the local firewall
  
* add a SELinux policy to permit binding to port 8000

## Development

Sorry this is just a test module for myself.

## Release Notes/Contributors/Etc **Optional**

changed port from 3000 to 8000
