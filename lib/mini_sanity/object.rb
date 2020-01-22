class Object

  # Checks that a given +pattern+ matches the Object (or a derivative
  # value), and returns the Object.  Raises an exception if the pattern
  # does not match.
  #
  # If a block is given, the Object is yielded to the block, and the
  # derivative value returned by the block is checked instead.
  #
  # @example Match truthy
  #   "foo".assert!  # == "foo"
  #   nil.assert!    # raises exception
  #
  # @example Match expected value
  #   "foo".assert!("foo")  # == "foo"
  #   "bar".assert!("foo")  # raises exception
  #
  # @example Match Set of permitted values
  #   "foo".assert!(Set["foo", "bar"])  # == "foo"
  #   "bar".assert!(Set["foo", "bar"])  # == "bar"
  #   "baz".assert!(Set["foo", "bar"])  # raises exception
  #
  # @example Match Class
  #   25.assert!(Integer)   # == 25
  #   2.5.assert!(Integer)  # raises exception
  #
  # @example Match Regexp
  #   "foo".assert!(/^f/)  # == "foo"
  #   "bar".assert!(/^f/)  # raises exception
  #
  # @example Match Range
  #   2.assert!(1..4)  # == 2
  #   5.assert!(1..4)  # raises exception
  #
  # @example Match truthy derivative value
  #   [2, 5].assert!(&:any?)  # == [2, 5]
  #   [nil].assert!(&:any?)   # raises exception
  #
  # @example Match derivative value
  #   [2, 5].assert!(1.., &:length)  # == [2, 5]
  #   [].assert!(1.., &:length)      # raises exception
  #
  # @overload assert!(pattern = MiniSanity::TRUTHY, name: nil)
  #   @param pattern [#===]
  #   @param name [String, Symbol]
  #     Name to include in the error message
  #   @return [self]
  #   @raise [MiniSanity::Error]
  #     if +pattern+ does not match the Object
  #
  # @overload assert!(pattern = MiniSanity::TRUTHY, name: nil, &block)
  #   @param pattern [#===]
  #   @param name [String, Symbol]
  #     Name to include in the error message
  #   @yieldparam itself [self]
  #   @yieldreturn [Object]
  #     Derivative value
  #   @return [self]
  #   @raise [MiniSanity::Error]
  #     if +pattern+ does not match the value returned by +block+
  def assert!(pattern = MiniSanity::TRUTHY, name: nil, &block)
    result = block ? block.call(self) : self
    unless pattern === result
      raise MiniSanity::Error.new(name,
        "#{MiniSanity::Error.describe_value(&block)} matches #{pattern.inspect}",
        self.inspect)
    end
    self
  end

  # Checks that a given +pattern+ does not match the Object (or a
  # derivative value), and returns the Object.  Raises an exception if
  # the pattern matches.
  #
  # If a block is given, the Object is yielded to the block, and the
  # derivative value returned by the block is checked instead.
  #
  # @example Refute truthy
  #   false.refute!  # == false
  #   "bad".refute!  # raises exception
  #
  # @example Refute forbidden value
  #   "foo".refute!("bad")  # == "foo"
  #   "bad".refute!("bad")  # raises exception
  #
  # @example Refute Set of prohibited values
  #   "foo".refute!(Set["bad", "worse"])  # == "foo"
  #   "bad".refute!(Set["bad", "worse"])  # raises exception
  #
  # @example Refute Class
  #   25.refute!(Float)   # == 25
  #   2.5.refute!(Float)  # raises exception
  #
  # @example Refute Regexp
  #   "foo".refute!(/^ba/)  # == "foo"
  #   "bad".refute!(/^ba/)  # raises exception
  #
  # @example Refute Range
  #   2.refute!(5..)  # == 2
  #   5.refute!(5..)  # raises exception
  #
  # @example Refute truthy derivative value
  #   [2].refute!(&:empty?)  # == [2]
  #   [].refute!(&:empty?)   # raises exception
  #
  # @example Refute derivative value
  #   [2].refute!(1.., &:length)     # == [2]
  #   [2, 5].refute!(1.., &:length)  # raises exception
  #
  # @overload refute!(pattern = MiniSanity::TRUTHY, name: nil)
  #   @param pattern [#===]
  #   @param name [String, Symbol]
  #     Name to include in the error message
  #   @return [self]
  #   @raise [MiniSanity::Error]
  #     if +pattern+ matches the Object
  #
  # @overload refute!(pattern = MiniSanity::TRUTHY, name: nil, &block)
  #   @param pattern [#===]
  #   @param name [String, Symbol]
  #     Name to include in the error message
  #   @yieldparam itself [self]
  #   @yieldreturn [Object]
  #     Derivative value
  #   @return [self]
  #   @raise [MiniSanity::Error]
  #     if +pattern+ matches the value returned by +block+
  def refute!(pattern = MiniSanity::TRUTHY, name: nil, &block)
    result = block ? block.call(self) : self
    if pattern === result
      raise MiniSanity::Error.new(name,
        "#{MiniSanity::Error.describe_value(&block)} does not match #{pattern.inspect}",
        self.inspect)
    end
    self
  end

end
