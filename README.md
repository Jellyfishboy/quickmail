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

Set up an initializer file with your Quickmail access token and settings:

```ruby
Quickmail.access_token  = 'quickmail_access_token'
Quickmail.api_version = 'v1'
Quickmail.test_mode  = "true or false"
```
e.g. *config/initializers/quickmail.rb*

## Usage

This gem provides a collection of operations for use within the Quickmail API.

### Generate API access token

Use OAuth to generate new API access for an account

```ruby
Quickmail::Authentication.oauth(auth_params)
````


### List Inventory

Create all available SKUs in Inventory

```ruby
Quickmail::Inventory.list
````

### Create Order

Create a single order

```ruby
Quickmail::Order.create(order_params)
````

### Tracking

Poll the tracking endpoint to get the latest order delivery updates

```ruby
Quickmail::Tracking.poll
````

## How to contribute

* Fork the project
* Create your feature or bug fix
* Add the requried tests for it.
* Commit (do not change version or history)
* Send a pull request against the *development* branch

## Copyright
Copyright (c) 2020 [Tom Dallimore](http://www.tomdallimore.com/?utm_source=quickmail&utm_medium=website&utm_campaign=tomdallimore) ([@tom_dallimore](http://twitter.com/tom_dallimore))  
Licenced under the MIT licence.
