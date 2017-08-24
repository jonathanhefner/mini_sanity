class Object

  # Checks that the Object is not nil, and returns the Object
  # unmodified.  If the Object fails this check, an exception is raised.
  #
  # @example
  #   [7, 8].first.refute_nil!  # == 7
  #   [].first.refute_nil!      # raises exception
  #
  # @param name [String, Symbol]
  #   optional name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Object is nil
  def refute_nil!(name = nil)
    if self.nil?
      message = name ? "#{name} is nil" : "unexpected nil"
      raise MiniSanity::Error.new(message)
    end
    self
  end

  # Checks that the Object is an instance of a given class, and returns
  # the Object unmodified.  If the Object fails this check, an exception
  # is raised.
  #
  # @example
  #   "abc".assert_instance_of!(String)   # == "abc"
  #   "abc".assert_instance_of!(Numeric)  # raises exception
  #
  # @param klass [Class]
  #   class to check
  # @param name [String, Symbol]
  #   optional name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Object is not an instance of +klass+
  def assert_instance_of!(klass, name = nil)
    unless self.instance_of?(klass)
      prelude = name ? "#{name} is instance of #{self.class}" : "unexpected #{self.class}"
      raise MiniSanity::Error.new("#{prelude}; expected #{klass}")
    end
    self
  end

end
