# mini_sanity [![Build Status](https://travis-ci.org/jonathanhefner/mini_sanity.svg?branch=master)](https://travis-ci.org/jonathanhefner/mini_sanity)

In-line [sanity checks], written as extensions to core Ruby objects.
See API listing below, or browse the [full documentation].

[sanity checks]: https://en.wikipedia.org/wiki/Sanity_check
[full documentation]: https://www.rubydoc.info/gems/mini_sanity/


## Example

```ruby
require "json"
require "pathname"

path = Pathname.new("hosted_files.json").assert!(&:exist?)

hosted_files = JSON.parse(path.read).assert!(Array)

urls = hosted_files.flat_map do |file_info|
  file_info.fetch("mirror_urls").refute!(&:empty?)
end

domains = urls.map do |url|
  url.assert!(%r"^https?://").split("/")[2]
end.uniq
```


## API

- [Object](https://www.rubydoc.info/gems/mini_sanity/Object)
  - [#assert!](https://www.rubydoc.info/gems/mini_sanity/Object:assert%21)
  - [#refute!](https://www.rubydoc.info/gems/mini_sanity/Object:refute%21)


## Util API

*mini_sanity* also includes a few optional utility methods which perform
some function, check an assertion on the result, and raise an error with
a helpful message if the assertion fails.  You must add
`require "mini_sanity/util"` to your script to access these methods.

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
