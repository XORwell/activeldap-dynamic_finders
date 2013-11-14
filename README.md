[![Build Status](https://travis-ci.org/XORwell/activeldap-dynamic_finders.png)](https://travis-ci.org/XORwell/activeldap-dynamic_finders) [![Code Climate](https://codeclimate.com/repos/52840661c7f3a31afb022567/badges/ef5745b61ee31ef9a4dc/gpa.png)](https://codeclimate.com/repos/52840661c7f3a31afb022567/feed) [![Dependency Status](https://gemnasium.com/XORwell/activeldap-dynamic_finders.png)](https://gemnasium.com/XORwell/activeldap-dynamic_finders)


# ActiveLdap::DynamicFinders

Dynamic finders for [ActiveLdap](https://github.com/activeldap/activeldap)


## Installation

Add this line to your application's Gemfile:

    gem 'active_ldap-dynamic_finders'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_ldap-dynamic_finders

## Usage

First at all, add it to your ActiveLdap model:

```ruby
class User < ActiveLdap::Base

  include ActiveLdap::DynamicFinders # <- Add this line
  
  ...
end
```

Then you can use `.find_by_*` and `.find_by_*_and_*` methods. _Replace * with any attribute available in your ActiveDirectory_

```ruby
User.find_by_cn('jim')
```
```ruby
User.find_by_cn_and_mail('jim', 'jim@example.com')
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
