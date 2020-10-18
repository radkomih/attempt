# Attempt

Retry library with configurable waiting strategy.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'attempt'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install attempt

## Usage

```ruby
Attempt.new.execute do
  raise StandardError.new('Wooops!!!')
end

Attempt.new(tries: 2).execute do
  raise StandardError.new('Wooops!!!')
end

Attempt.new(exceptions: [StandardError]).execute do
  raise StandardError.new('Wooops!!!')
end

# constant|incremental|random|exponential
Attempt.new(wait_strategy: :constant).execute do
  raise StandardError.new('Wooops!!!')
end

callback = Proc.new { |e, context_message| puts "#{e.message} #{context_message}" }

Attempt.new(failure_callback: callback).execute(context: 'syncing resources') do
  raise StandardError.new('Wooops!!!')
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/radkomih/attempt.



