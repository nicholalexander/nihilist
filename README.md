# Nihil

> "Are you a nihilist?  Do you believe in nothing? Say what you want about the tenets of national socialism, at least it's an ethos." - Walter Sobchak

Nihil is a gem that provides a simple way to get more nil in your life.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add nihil
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install nihil
```

## Usage

```ruby
Nihil.new(1231).bloop # => nil

Nihil.aasdlkfjsadf(:foo) # => nil

Nihil.cookie do |x|
  x + 1
end # => nil
```

Sadly, you can't chain nils.  Something like this: `Nihil.bloop.blonk.bliff` will raise a `NoMethodError`.

Or will it?  That's where insane mode comes in!

```ruby
Nihil.insane_mode!

Nihil.bloop.blonk.bliff # => nil

nil.bloof.blonk! # => nil

Nihil.simmer_down!

Nihil.bloop.blonk.bliff # => NoMethodError
```

## Caveats

I don't think you should run insane mode.  But that's up to you really.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nicholalexander/nihil. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/nihil/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Nihil project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/nihil/blob/main/CODE_OF_CONDUCT.md).
