class String

  # Checks that the String is +empty?+, and returns the String
  # unmodified.  Raises an exception if the String fails this check.
  #
  # @example
  #   "".assert_empty!     # == ""
  #   "bad".assert_empty!  # raises exception
  #
  # @param name [String, Symbol]
  #   Name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the String is not +empty?+
  def assert_empty!(name = nil)
    if !self.empty?
      raise MiniSanity::Error.new(name,
        "empty #{self.class}",
        self.inspect)
    end
    self
  end

  # Checks that the String is not +empty?+, and returns the String
  # unmodified.  Raises an exception if the String fails this check.
  #
  # @example
  #   "result".refute_empty!  # == "result"
  #   "".refute_empty!        # raises exception
  #
  # @param name [String, Symbol]
  #   Name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the String is +empty?+
  def refute_empty!(name = nil)
    if self.empty?
      raise MiniSanity::Error.new(name,
        "non-empty #{self.class}",
        self.inspect)
    end
    self
  end

  # Checks that the String matches a given +length+, and returns the
  # String unmodified.  Raises an exception if the String fails this
  # check.
  #
  # @example
  #   "password".assert_length!(8)           # == "password"
  #   "long password".assert_length!(8..64)  # == "long password"
  #   "pass".assert_length!(8..64)           # raises exception
  #
  # @param length [Integer, Range<Integer>]
  # @param name [String, Symbol]
  #   Name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the String length does not match +length+
  def assert_length!(length, name = nil)
    if !(length === self.length)
      raise MiniSanity::Error.new(name,
        "#{self.class} having #{length} characters",
        self.inspect)
    end
    self
  end

  # Checks that the String does not match a given +length+, and returns
  # the String unmodified.  Raises an exception if the String fails this
  # check.
  #
  # @example
  #   "password".refute_length!(0)           # == "password"
  #   "long password".refute_length!(0...8)  # == "long password"
  #   "pass".refute_length!(0...8)           # raises exception
  #
  # @param length [Integer, Range<Integer>]
  # @param name [String, Symbol]
  #   Name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the String length matches +length+
  def refute_length!(length, name = nil)
    if length === self.length
      raise MiniSanity::Error.new(name,
        "#{self.class} not having #{length} characters",
        self.inspect)
    end
    self
  end

  # Checks that the String matches a given regular expression, and
  # returns the String unmodified.  Raises an exception if the String
  # fails this check.
  #
  # @example
  #   "good result".assert_match!(/^good/)  # == "good result"
  #   "bad result".assert_match!(/^good/)   # raises exception
  #
  # @param regexp [Regexp]
  # @param name [String, Symbol]
  #   Name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the String does not match +regexp+
  def assert_match!(regexp, name = nil)
    if regexp !~ self
      raise MiniSanity::Error.new(name,
        "#{self.class} matching #{regexp.inspect}",
        self.inspect)
    end
    self
  end

  # Checks that the String does not match a given regular expression,
  # and returns the String unmodified.  Raises an exception if the
  # String fails this check.
  #
  # @example
  #   "good result".refute_match!(/^bad/)  # == "good result"
  #   "bad result".refute_match!(/^bad/)   # raises exception
  #
  # @param regexp [Regexp]
  # @param name [String, Symbol]
  #   Name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the String matches +regexp+
  def refute_match!(regexp, name = nil)
    if regexp =~ self
      raise MiniSanity::Error.new(name,
        "#{self.class} not matching #{regexp.inspect}",
        self.inspect)
    end
    self
  end

end
