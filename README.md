# ValidatedAccessors [![Gem Version](https://badge.fury.io/rb/validated_accessors.svg)](http://badge.fury.io/rb/validated_accessors) [![Build Status](https://travis-ci.org/eloyesp/validated_accessors.svg?branch=master)](https://travis-ci.org/eloyesp/validated_accessors) [![Code Climate](http://img.shields.io/codeclimate/github/eloyesp/validated_accessors.svg)](https://codeclimate.com/github/eloyesp/validated_accessors) [![Dependency Status](https://gemnasium.com/eloyesp/validated_accessors.svg)](https://gemnasium.com/eloyesp/validated_accessors)

Attribute accessors with validation options so you notice when something
is wrong earlier.

```ruby
class Foo
  extend ValidatedAccessors

  validated_accessor :bar, valid: [:foo, :bar]

  # a transformation can be applied to the accessor for consistency

  validated_accessor(:age, valid: (18..100)) { |a| a.to_i }
end

foo = Foo.new
foo.bar = :foo # => error
foo.age = '24'
foo.age # => 24
```

And you can read the
[docs](http://rdoc.info/github/eloyesp/validated_accessors/frames).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/validated_accessors/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
