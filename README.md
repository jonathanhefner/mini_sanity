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

- `"mini_sanity/assert"`
  - [Object#assert!](https://www.rubydoc.info/gems/mini_sanity/Object:assert%21)
  - [Object#refute!](https://www.rubydoc.info/gems/mini_sanity/Object:refute%21)
- `"mini_sanity/change"`
  - [String#change](https://www.rubydoc.info/gems/mini_sanity/String:change)
  - [String#change!](https://www.rubydoc.info/gems/mini_sanity/String:change%21)
- `"mini_sanity/match"`
  - [Regexp#match!](https://www.rubydoc.info/gems/mini_sanity/Regexp:match%21)
  - [String#match!](https://www.rubydoc.info/gems/mini_sanity/String:match%21)
- `"mini_sanity/results"`
  - [Enumerator#results!](https://www.rubydoc.info/gems/mini_sanity/Enumerator:results%21)


## Installation

Install the [gem](https://rubygems.org/gems/mini_sanity):

```bash
$ gem install mini_sanity
```

Then require in your Ruby code:

```ruby
require "mini_sanity"
```


## Contributing

Run `rake test` to run the tests.


## License

[MIT License](https://opensource.org/licenses/MIT)
