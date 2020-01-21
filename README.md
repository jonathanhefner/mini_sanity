# mini_sanity [![Build Status](https://travis-ci.org/jonathanhefner/mini_sanity.svg?branch=master)](https://travis-ci.org/jonathanhefner/mini_sanity)

In-line [sanity checks], written as extensions to core Ruby objects.
See API listing below, or browse the [full documentation].

[sanity checks]: https://en.wikipedia.org/wiki/Sanity_check
[full documentation]: https://www.rubydoc.info/gems/mini_sanity/


## Example

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


## API

- [Object](https://www.rubydoc.info/gems/mini_sanity/Object)
  - [#assert!](https://www.rubydoc.info/gems/mini_sanity/Object:assert%21)
  - [#assert_equal!](https://www.rubydoc.info/gems/mini_sanity/Object:assert_equal%21)
  - [#assert_in!](https://www.rubydoc.info/gems/mini_sanity/Object:assert_in%21)
  - [#assert_instance_of!](https://www.rubydoc.info/gems/mini_sanity/Object:assert_instance_of%21)
  - [#assert_kind_of!](https://www.rubydoc.info/gems/mini_sanity/Object:assert_kind_of%21)
  - [#assert_nil!](https://www.rubydoc.info/gems/mini_sanity/Object:assert_nil%21)
  - [#assert_respond_to!](https://www.rubydoc.info/gems/mini_sanity/Object:assert_respond_to%21)
  - [#refute_equal!](https://www.rubydoc.info/gems/mini_sanity/Object:refute_equal%21)
  - [#refute_in!](https://www.rubydoc.info/gems/mini_sanity/Object:refute_in%21)
  - [#refute_nil!](https://www.rubydoc.info/gems/mini_sanity/Object:refute_nil%21)
- [Array](https://www.rubydoc.info/gems/mini_sanity/Array)
  - [#assert_length!](https://www.rubydoc.info/gems/mini_sanity/Array:assert_length%21)
  - [#refute_length!](https://www.rubydoc.info/gems/mini_sanity/Array:refute_length%21)
- [Enumerable](https://www.rubydoc.info/gems/mini_sanity/Enumerable)
  - [#assert_empty!](https://www.rubydoc.info/gems/mini_sanity/Enumerable:assert_empty%21)
  - [#refute_empty!](https://www.rubydoc.info/gems/mini_sanity/Enumerable:refute_empty%21)
- [String](https://www.rubydoc.info/gems/mini_sanity/String)
  - [#assert_empty!](https://www.rubydoc.info/gems/mini_sanity/String:assert_empty%21)
  - [#assert_length!](https://www.rubydoc.info/gems/mini_sanity/String:assert_length%21)
  - [#assert_match!](https://www.rubydoc.info/gems/mini_sanity/String:assert_match%21)
  - [#refute_empty!](https://www.rubydoc.info/gems/mini_sanity/String:refute_empty%21)
  - [#refute_length!](https://www.rubydoc.info/gems/mini_sanity/String:refute_length%21)
  - [#refute_match!](https://www.rubydoc.info/gems/mini_sanity/String:refute_match%21)
- [Pathname](https://www.rubydoc.info/gems/mini_sanity/Pathname)
  - [#assert_dir!](https://www.rubydoc.info/gems/mini_sanity/Pathname:assert_dir%21)
  - [#assert_exist!](https://www.rubydoc.info/gems/mini_sanity/Pathname:assert_exist%21)
  - [#assert_file!](https://www.rubydoc.info/gems/mini_sanity/Pathname:assert_file%21)
  - [#refute_dir!](https://www.rubydoc.info/gems/mini_sanity/Pathname:refute_dir%21)
  - [#refute_exist!](https://www.rubydoc.info/gems/mini_sanity/Pathname:refute_exist%21)
  - [#refute_file!](https://www.rubydoc.info/gems/mini_sanity/Pathname:refute_file%21)


## Util API

*mini_sanity* also includes a few optional utility methods which perform
some function, check an assertion on the result, and raise an error with
a helpful message if the assertion fails.  You must add
`require "mini_sanity/util"` to your script to access these methods.

- [Enumerable](https://www.rubydoc.info/gems/mini_sanity/Enumerable)
  - [#first!](https://www.rubydoc.info/gems/mini_sanity/Enumerable:first%21)
- [Regexp](https://www.rubydoc.info/gems/mini_sanity/Regexp)
  - [#match!](https://www.rubydoc.info/gems/mini_sanity/Regexp:match%21)
- [String](https://www.rubydoc.info/gems/mini_sanity/String)
  - [#change](https://www.rubydoc.info/gems/mini_sanity/String:change)
  - [#change!](https://www.rubydoc.info/gems/mini_sanity/String:change%21)
  - [#match!](https://www.rubydoc.info/gems/mini_sanity/String:match%21)


## Installation

Install the [gem](https://rubygems.org/gems/mini_sanity):

```bash
$ gem install mini_sanity
```

Then require in your Ruby code:

```ruby
require "mini_sanity"
require "mini_sanity/util" # OPTIONAL
```


## Contributing

Run `rake test` to run the tests.


## License

[MIT License](https://opensource.org/licenses/MIT)
