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

  # Checks that the Object is nil, and returns nil.  Raises an exception
  # if the Object fails this check.
  #
  # @example
  #   record = { good: "good thing", bad: nil }
  #   record[:bad].assert_nil!  # == nil
  #
  #   record[:bad] = "bad thing"
  #   record[:bad].assert_nil!  # raises exception
  #
  # @param name [String, Symbol]
  #   Name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Object is not nil
  def assert_nil!(name = nil)
    if !self.nil?
      raise MiniSanity::Error.new(name,
        "nil",
        self.inspect)
    end
    self
  end

  # Checks that the Object is not nil, and returns the Object
  # unmodified.  Raises an exception if the Object fails this check.
  #
  # @example
  #   record = { good: "good thing", bad: nil }
  #   record[:good].refute_nil!  # == "good thing"
  #
  #   record[:good] = nil
  #   record[:good].refute_nil!  # raises exception
  #
  # @param name [String, Symbol]
  #   Name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Object is nil
  def refute_nil!(name = nil)
    if self.nil?
      raise MiniSanity::Error.new(name,
        "non-nil value",
        "nil")
    end
    self
  end

  # Checks that the Object equals (via +==+) a given +expected+ value,
  # and returns the Object unmodified.  Raises an exception if the
  # Object fails this check.
  #
  # @example
  #   "good".assert_equal!("good")  # == "good"
  #   "bad".assert_equal!("good")   # raises exception
  #
  # @param expected [Object]
  # @param name [String, Symbol]
  #   Name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Object does not equal +expected+
  def assert_equal!(expected, name = nil)
    if self != expected
      raise MiniSanity::Error.new(name,
        expected.inspect,
        self.inspect)
    end
    self
  end

  # Checks that the Object does not equal (via +==+) a given +forbidden+
  # value, and returns the Object unmodified.  Raises an exception if
  # the Object fails this check.
  #
  # @example
  #   "good".refute_equal!("bad")  # == "good"
  #   "bad".refute_equal!("bad")   # raises exception
  #
  # @param forbidden [Object]
  # @param name [String, Symbol]
  #   Name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Object equals +forbidden+
  def refute_equal!(forbidden, name = nil)
    if self == forbidden
      raise MiniSanity::Error.new(name,
        "not #{forbidden.inspect}",
        self.inspect)
    end
    self
  end

  # Checks that the Object is one of the given +permitted+ values, and
  # returns the Object unmodified.  Raises an exception if the Object
  # fails this check.
  #
  # @example
  #   "good".assert_in!(["ok", "good", "great"])  # == "good"
  #   "bad".assert_in!(["ok", "good", "great"])   # raises exception
  #
  # @param permitted [Enumerable, #include?]
  # @param name [String, Symbol]
  #   Name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Object is not included in +permitted+
  def assert_in!(permitted, name = nil)
    if !permitted.include?(self)
      raise MiniSanity::Error.new(name,
        "value included in #{permitted.inspect}",
        self.inspect)
    end
    self
  end

  # Checks that the Object is not one of the given +prohibited+ values,
  # and returns the Object unmodified.  Raises an exception if the
  # Object fails this check.
  #
  # @example
  #   "good".refute_in!(["bad", "poor", "fail"])  # == "good"
  #   "bad".refute_in!(["bad", "poor", "fail"])   # raises exception
  #
  # @param prohibited [Enumerable, #include?]
  # @param name [String, Symbol]
  #   Name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Object is included in +prohibited+
  def refute_in!(prohibited, name = nil)
    if prohibited.include?(self)
      raise MiniSanity::Error.new(name,
        "value not included in #{prohibited.inspect}",
        self.inspect)
    end
    self
  end

  # Checks that the Object is an instance of a given class, and returns
  # the Object unmodified.  Raises an exception if the Object fails this
  # check.
  #
  # @example
  #   (3.14).assert_instance_of!(Float)  # == 3.14
  #   (3).assert_instance_of!(Float)     # raises exception
  #
  # @param klass [Class]
  # @param name [String, Symbol]
  #   Name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Object is not an instance of +klass+
  def assert_instance_of!(klass, name = nil)
    if !self.instance_of?(klass)
      raise MiniSanity::Error.new(name,
        "instance of #{klass}",
        "instance of #{self.class}: #{self.inspect}")
    end
    self
  end

  # Checks that the Object is an instance of a given class or one of its
  # subclasses, and returns the Object unmodified.  Raises an exception
  # if the Object fails this check.
  #
  # @example
  #   (3.14).assert_kind_of!(Numeric)  # == 3.14
  #   "3.14".assert_kind_of!(Numeric)  # raises exception
  #
  # @param klass [Class]
  # @param name [String, Symbol]
  #   Name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Object is not an instance of +klass+ or its subclasses
  def assert_kind_of!(klass, name = nil)
    if !self.kind_of?(klass)
      raise MiniSanity::Error.new(name,
        "instance of #{klass} or one of its subclasses",
        "instance of #{self.class}: #{self.inspect}")
    end
    self
  end

  # Checks that the Object responds to a given method, and returns the
  # Object unmodified.  Raises an exception if the Object fails this
  # check.
  #
  # @example
  #   "abc".assert_respond_to!(:empty?)  # == "abc"
  #   "abc".assert_respond_to!(:pop)     # raises exception
  #
  # @param method_name [String, Symbol]
  # @param name [String, Symbol]
  #   Name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Object does not respond to +method_name+
  def assert_respond_to!(method_name, name = nil)
    if !self.respond_to?(method_name)
      raise MiniSanity::Error.new(name,
        "object responding to method #{method_name}",
        "instance of #{self.class}: #{self.inspect}")
    end
    self
  end

end
