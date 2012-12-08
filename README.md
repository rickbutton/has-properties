# has_properties

`has_properties` provides an easy way to create basic class definitions with properties. 
It essentially wraps a lot of `attr_(reader/writer/accessor)` calls into a neat package
with a nifty initializer.

## Installation

Add this line to your application's Gemfile:

    gem 'has_properties'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install has_properties

## Usage Example

1. Include the `HasProperties` module
2. Define your properties
3. ??????
4. Profit?

```
    class Example
      include HasProperties
    
      has_read_properties :readable, :another_readable
      has_write_properties :writable, :another_writable
      has_properties :readable_and_writable
    end
    
    e = Example.new(:readable => 1, :writable => 2, :readable_and_writable => 3)
```
```
    e.readable
    => 1
```
```
    e.readable = 2
    => NoMethodError
```
```
    e.writable
    => NoMethodError
```
```
    e.writable = 3
    => 3
```
```
    e.readable_and_writable
    => 3
```
```
    e.readable_and_writable = 4
    => 4
```

### Some notes

You don't have to include every property in the initializer hash. For example, the example above
defines the `:another_readable` property, but it was never initialized when the object was created.
This means that a call to `e.another_readable` would equal `nil`.

```
    e.another_readable
    => nil
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
