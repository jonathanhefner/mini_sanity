# mini_sanity

In-line [sanity checks], written as extensions to core Ruby objects.  See
API listing below, or browse the [full documentation].

[sanity checks]: https://en.wikipedia.org/wiki/Sanity_check
[full documentation]: http://www.rubydoc.info/gems/mini_sanity/


# Example

```ruby
require "json"
require "pathname"

path = Pathname.new("hosted_files.json").assert_exist!

hosted_files = JSON.parse(path.read).assert_instance_of!(Array)

urls = hosted_files.flat_map do |file_info|
  file_info.fetch("mirror_urls").refute_empty!
end

domains = urls.map do |url|
  url.assert_match!(%r"^https?://").split("/")[2]
end.uniq
```


# API

- [Object](http://www.rubydoc.info/gems/mini_sanity/Object)
  - [#assert_equal!](http://www.rubydoc.info/gems/mini_sanity/Object:assert_equal%21)
  - [#assert_instance_of!](http://www.rubydoc.info/gems/mini_sanity/Object:assert_instance_of%21)
  - [#assert_kind_of!](http://www.rubydoc.info/gems/mini_sanity/Object:assert_kind_of%21)
  - [#assert_nil!](http://www.rubydoc.info/gems/mini_sanity/Object:assert_nil%21)
  - [#assert_respond_to!](http://www.rubydoc.info/gems/mini_sanity/Object:assert_respond_to%21)
  - [#refute_equal!](http://www.rubydoc.info/gems/mini_sanity/Object:refute_equal%21)
  - [#refute_nil!](http://www.rubydoc.info/gems/mini_sanity/Object:refute_nil%21)
- [Array](http://www.rubydoc.info/gems/mini_sanity/Array)
  - [#assert_length!](http://www.rubydoc.info/gems/mini_sanity/Array:assert_length%21)
- [Enumerable](http://www.rubydoc.info/gems/mini_sanity/Enumerable)
  - [#assert_empty!](http://www.rubydoc.info/gems/mini_sanity/Enumerable:assert_empty%21)
  - [#refute_empty!](http://www.rubydoc.info/gems/mini_sanity/Enumerable:refute_empty%21)
- [String](http://www.rubydoc.info/gems/mini_sanity/String)
  - [#assert_empty!](http://www.rubydoc.info/gems/mini_sanity/String:assert_empty%21)
  - [#assert_match!](http://www.rubydoc.info/gems/mini_sanity/String:assert_match%21)
  - [#refute_empty!](http://www.rubydoc.info/gems/mini_sanity/String:refute_empty%21)
  - [#refute_match!](http://www.rubydoc.info/gems/mini_sanity/String:refute_match%21)
- [Pathname](http://www.rubydoc.info/gems/mini_sanity/Pathname)
  - [#assert_exist!](http://www.rubydoc.info/gems/mini_sanity/Pathname:assert_exist%21)
  - [#refute_exist!](http://www.rubydoc.info/gems/mini_sanity/Pathname:refute_exist%21)


## Installation

Install from [Ruby Gems](https://rubygems.org/gems/mini_sanity):

```bash
$ gem install mini_sanity
```

Then require in your Ruby script:

```ruby
require "mini_sanity"
```


## Contributing

Run `rake test` to run the tests.  You can also run `rake irb` for an
interactive prompt that pre-loads the project code.


## License

[MIT License](https://opensource.org/licenses/MIT)
