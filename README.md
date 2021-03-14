# Rebrandly

This is very much a work in progress. I've created this so I could use Ruby to
shorten URL's with Rebrandly. I hope to continue to work on this gem in the near
future to do testing, error checking, etc. This is a very early version.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rebrandly'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rebrandly

## Usage

If using Rails, put the following into your application.rb. If just Ruby,
run this before trying to use the API.

```ruby
Rebrandly.configure do |config|
  config.api_key = 'YOUR_KEY_HERE'
end
```

### Instantiate an API object.

```ruby
api = Rebrandly::Api.new
```

### API Requests

```ruby
api.links                           # GET /v1/links
api.link(id)                        # GET /v1/links/:id
api.link_count(options)             # GET /v1/links/count
api.new_link(options)               # GET /v1/links/new
api.shorten(destination, options)   # POST /v1/links
api.update_link(id, options)        # POST /v1/links/:id
api.delete(id, options)             # DELETE /v1/links/:id
api.domains                         # GET /v1/domains
api.domain(id)                      # GET /v1/domains/:id
api.domain_count(options)           # GET /v1/domains/count
api.account                         # GET /v1/account
```

### Make a new short link

```ruby
my_domain = api.domains.first
link = api.shorten('https://google.com', domain: my_domain.to_h, title: 'Google', description: 'The Googles!!!', favourite: true)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ardavis/rebrandly.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
