## 2.0.0

* [BREAKING] Drop support for Ruby < 2.6
* Add `Object#assert!`
* Add `Object#refute!`
* [BREAKING] Remove methods obsoleted by `Object#assert!` and `#refute!`
  * `Object#assert_equal!` => `assert!(expected *OR* Set[expected])`
  * `Object#assert_in!` => `assert!(permitted.to_set)`
  * `Object#assert_instance_of!` => `assert!(Set[klass], &:class)`
  * `Object#assert_kind_of!` => `assert!(klass)`
  * `Object#assert_nil!` => `assert!(nil)`
  * `Object#refute_equal!` => `refute!(forbidden *OR* Set[forbidden])`
  * `Object#refute_in!` => `refute!(prohibited.to_set)`
  * `Object#refute_nil!` => `refute!(nil)`
  * `Array#assert_length!` => `assert!(permitted_length, &:length)`
  * `Array#refute_length!` => `refute!(prohibited_length, &:length)`
  * `Enumerable#assert_empty!` => `assert!(&:empty?)`
  * `Enumerable#refute_empty!` => `refute!(&:empty?)`
  * `String#assert_empty!` => `assert!(&:empty?)`
  * `String#assert_length!` => `assert!(permitted_length, &:length)`
  * `String#assert_match!` => `assert!(pattern)`
  * `String#refute_empty!` => `refute!(&:empty?)`
  * `String#refute_length!` => `refute!(prohibited_length, &:length)`
  * `String#refute_match!` => `refute!(pattern)`
  * `Pathname#assert_dir!` => `assert!(&:directory?)`
  * `Pathname#assert_exist!` => `assert!(&:exist?)`
  * `Pathname#assert_file!` => `assert!(&:file?)`
  * `Pathname#refute_dir!` => `refute!(&:directory?)`
  * `Pathname#refute_exist!` => `refute!(&:exist?)`
  * `Pathname#refute_file!` => `refute!(&:file?)`
* [BREAKING] Remove `Object#assert_respond_to!`
* [BREAKING] Remove `Enumerable#first!`
  * Replacement for most cases: `assert!(n.., &:size).first(n)`
* [BREAKING] `require "mini_sanity"` now loads all pieces of the API.
  However, individual pieces of the API can be loaded a la carte via
  e.g. `require "mini_sanity/assert"`.
* Add `Enumerator#result!`
* Add `Enumerator#results!`


## 1.1.0

* Standardize error messages
* Add `Array#assert_length!`
* Add `Array#refute_length!`
* Add `Enumerable#assert_empty!`
* Add `Object#assert_equal!`
* Add `Object#assert_in!`
* Add `Object#assert_nil!`
* Add `Object#refute_equal!`
* Add `Object#refute_in!`
* Add `Pathname#assert_dir!`
* Add `Pathname#assert_file!`
* Add `Pathname#refute_dir!`
* Add `Pathname#refute_file!`
* Add `String#assert_empty!`
* Add `String#assert_length!`
* Add `String#refute_length!`
* Add `Enumerable#first!` (loaded via `require "mini_sanity/util"`)
* Add `Regexp#match!` (loaded via `require "mini_sanity/util"`)
* Add `String#change` (loaded via `require "mini_sanity/util"`)
* Add `String#change!` (loaded via `require "mini_sanity/util"`)
* Add `String#match!` (loaded via `require "mini_sanity/util"`)


## 1.0.0

* Initial release
