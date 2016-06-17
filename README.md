# Id90Tracer

Adds Request-ID Tracing for Ruby Applications

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'id90_tracer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install id90_tracer

## Usage

This gem provides a class, `Id90Tracer::Request`, that can be used to track the
different IDs associated with a request.

At the beginning of a request, you will want to setup the Request environment.
You can do this manually, but we have included a middleware that will do this
for you.

If you're working in the context of a Rails application, create a new
initializer in `config/initializers/id90_tracer.rb` with the following content:

```ruby
# config/initializers/id90_tracer.rb
require 'id90_tracer/middleware'
Rails.application.config.middleware.insert_before(Rails::Rack::Logger, Id90Tracer::Middleware)
```

After that, you can retrieve the different tracking IDs using the following
methods:

```ruby
Id90Tracer::Request.parent_request_id
Id90Tracer::Request.request_id
Id90Tracer::Request.trace_id
```

When writing data to log files, pushing data into a queue or making internal api
requests, we should pass these tracking IDs along with the data.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/id90t/id90-tracer-ruby.

