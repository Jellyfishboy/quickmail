## Quickmail

[![Gem Version](https://badge.fury.io/rb/quickmail.svg)](https://badge.fury.io/rb/quickmail)

A Ruby wrapper for the Quickmail API.

## Installation

Add module to your Gemfile:

```ruby
gem 'quickmail'
```

Then run bundle to install the Gem:

```sh
bundle install
```

Set up an initializer file with your Quickmail API keys:

```ruby
Quickmail.username  = 'quickmail_api_key'
Quickmail.password  = 'quickmail_api_secret'
Quickmail.api_version = 'v1'
```
e.g. *config/initializers/quickmail.rb*

## Usage

This gem provides a collection of operations for use within the Quickmail API.


## How to contribute

* Fork the project
* Create your feature or bug fix
* Add the requried tests for it.
* Commit (do not change version or history)
* Send a pull request against the *development* branch

## Copyright
Copyright (c) 2018 [Tom Dallimore](http://www.tomdallimore.com/?utm_source=Quickmail&utm_medium=website&utm_campaign=tomdallimore) ([@tom_dallimore](http://twitter.com/tom_dallimore))  
Licenced under the MIT licence.
