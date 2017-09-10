class Object

  # Checks that the Object is not nil, and returns the Object
  # unmodified.  If the Object fails this check, an exception is raised.
  #
  # @example
  #   ["result 1"].first.refute_nil!  # == "result 1"
  #   [].first.refute_nil!            # raises exception
  #
  # @param name [String, Symbol]
  #   optional name to include in the error message
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

  # Checks that the Object is an instance of a given class, and returns
  # the Object unmodified.  If the Object fails this check, an exception
  # is raised.
  #
  # @example
  #   123.assert_instance_of!(Numeric)  # == 123
  #   123.assert_instance_of!(String)   # raises exception
  #
  # @param klass [Class]
  #   class to check
  # @param name [String, Symbol]
  #   optional name to include in the error message
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
  # subclasses, and returns the Object unmodified.  If the Object fails
  # this check, an exception is raised.
  #
  # @example
  #   123.assert_kind_of!(Numeric)  # == 123
  #   123.assert_kind_of!(Float)    # raises exception
  #
  # @param klass [Class]
  #   class to check
  # @param name [String, Symbol]
  #   optional name to include in the error message
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
  # Object unmodified.  If the Object fails this check, an exception is
  # raised.
  #
  # @example
  #   "abc".assert_respond_to!(:empty?)  # == "abc"
  #   "abc".assert_respond_to!(:pop)     # raises exception
  #
  # @param method_name [String, Symbol]
  #   name of method to check
  # @param name [String, Symbol]
  #   optional name to include in the error message
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
