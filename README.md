# Sluggo #

Sometimes, we just want a string of quasi-random gobbledeygook to use as
a token of some sort. We may want these strings to be unique (or at least
somewhat close to it), or we may just them to be a given length.

That's what this is for.

## Important Note ##

This is very much not ready for primetime. I'm only releasing right now so
as to stop working on it and accept a baseline.

## Install ##

You can add it to your Gemfile:

    gem 'sluggo'

Or you can do it the hard way:

    gem install sluggo

## Usage ##

```ruby
require 'sluggo'

# Let's get a 6-character random base62 slug

slug = Sluggo::Random.base62(6)

# Heck, let's get a possibly unique 6-character base62 slug
# This works by passing a block to the rare method. If the block
# returns true, we assume that the proposed slug is unique and
# return it. We're going to assume that we're working with a
# Widget with a .open_key? method that returns true if the 
# supplied key isn't in use.

slug = Sluggo.rare(6) {|slug| Widget.open_key?(slug)}
```

## License ##

MIT License. Copyright 2013 Ess
