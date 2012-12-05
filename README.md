# Mongoid::NumericID

## Installation

Add this line to your application's Gemfile:

    gem 'mongoid-numericid'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid-numericid

## Usage

To use, just include Mongoid::NumericID in your model.

```ruby
class Post
	include Mongoid::Document
	include Mongoid::NumericID

	...
end
```

To use:

```ruby
my_post = Post.find(1) # or Post.with_numeric_id(1)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
