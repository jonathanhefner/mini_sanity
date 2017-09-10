class String

  # Checks that the String is not empty, and returns the String
  # unmodified.  If the String fails this check, an exception is raised.
  #
  # @example
  #   "abc".refute_empty!  # == "abc"
  #   "".refute_empty!     # raises exception
  #
  # @param name [String, Symbol]
  #   optional name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the String is empty
  def refute_empty!(name = nil)
    if self.empty?
      raise MiniSanity::Error.new(name,
        "non-empty #{self.class}",
        self.inspect)
    end
    self
  end

  # Checks that the String matches a given regular expression, and
  # returns the String unmodified.  If the String fails this check, an
  # exception is raised.
  #
  # @example
  #   "abc".assert_match!(/b/)  # == "abc"
  #   "abc".assert_match!(/x/)  # raises exception
  #
  # @param regexp [Regexp]
  #   regular expression to check
  # @param name [String, Symbol]
  #   optional name to include in the error message
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
  # and returns the String unmodified.  If the String fails this check,
  # an exception is raised.
  #
  # @example
  #   "abc".refute_match!(/x/)  # == "abc"
  #   "abc".refute_match!(/b/)  # raises exception
  #
  # @param regexp [Regexp]
  #   regular expression to check
  # @param name [String, Symbol]
  #   optional name to include in the error message
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
