# Laissez

Lazy accessors, yo.

Adds `lazy_accessor`, `lazy_reader`, and `lazy_writer` to the Module class. Behaves just like its `attr_*` counterparts, except if the value is a Proc, the return value of calling the proc is returned instead.


### Example:

```ruby
class Person
  lazy_accessor :name
end

person = Person.new
person.name # => nil
person.name = proc { "Ron Swanson" }
person.name # => "Ron Swanson"
```

Additionally, you can pass a block to the getter instead, making the `=` unnecessary.

```ruby
person.name { "Jean-Ralphio Saperstein" }
person.name # => "Jean-Ralphio Saperstein"
```

### Why would you want to use this?
- Lazy configuration
- Cheap DSLs
- Cheap method forwarding
- Defaults that might be destructive

### Is this a good idea?
TBD.

## Installation

Add this line to your application's Gemfile:

    gem 'laissez'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install laissez

## Contributing

1. Fork it ( https://github.com/printreleaf/laissez/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

