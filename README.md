Heartwood::Decorator
==========

Heartwood's Decorator is a generator that uses ActiveSupport's concern idiom to add instance and class methods to decorate a Ruby on Rails model class.

Unlike the [Draper gem](https://github.com/drapergem/draper), there's no need to call any specific methods, as the decorator's methods get included in their model's class (see below for more details).

Installation
----------

Add this line to your application's Gemfile:

```ruby
gem 'heartwood-decorator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install heartwood-decorator

Usage
----------

To generate a new decorator, use the generator:

    $ bundle exec rails g heartwood:decorator MODEL

Here `MODEL` should be the name of the model you wish to decorate. You can use the underscored version (e.g. `my_model`) or the camelcased class name (e.g. `MyModel).

The generator creates a file in the `app/generators` directory (e.g. a `user` generator would be created at `app/generators/user_generator.rb`).

The generator also includes the generator module within the model (e.g. `include UserGenerator`).

Following ActiveSupport's concern idiom, you can use the `included` and `class_methods` methods to add instance and class methods to the model. Here is an example decorating a `User` model:

```ruby
# app/models/user.rb
class User < ApplicationRecord
  # Assume User has a `name` attribute.
end

# app/decorators/user_decorator.rb
module UserDecorator
  # Instance methods use the `included` method.
  included do
    def first_name
      name.split(' ').first
    end
  end

  # Class methods use the `class_methods` method.
  class_methods do
    def say_hello
      'Hello!'
    end
  end
end

user = User.new(name: 'Ian Malcolm')
user.first_name # => "Ian"
User.say_hello # => "Hello!"
```

Development
----------

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Contributing
----------

Bug reports and pull requests are welcome on GitHub at https://github.com/seancdavis/heartwood-decorator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

License
----------

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

Code of Conduct
----------

Everyone interacting in the Heartwood::Decorator project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/seancdavis/heartwood-decorator/blob/master/CODE_OF_CONDUCT.md).
