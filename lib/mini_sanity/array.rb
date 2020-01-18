class Array

  # Checks that the Array matches a given +length+, and returns the
  # Array unmodified.  Raises an exception if the Array fails this
  # check.
  #
  # @example
  #   coord = [1, 2]
  #   coord.assert_length!(2)     # == [1, 2]
  #   coord.assert_length!(2..3)  # == [1, 2]
  #   coord.assert_length!(3)     # raises exception
  #
  # @param length [Integer, Range<Integer>]
  # @param name [String, Symbol]
  #   Name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Array length does not match +length+
  def assert_length!(length, name = nil)
    if !(length === self.length)
      raise MiniSanity::Error.new(name,
        "#{self.class} having #{length} elements",
        self.inspect)
    end
    self
  end

  # Checks that the Array does not match a given +length+, and returns
  # the Array unmodified.  Raises an exception if the Array fails this
  # check.
  #
  # @example
  #   a_few = [1, 2]
  #   a_few.refute_length!(0)     # == [1, 2]
  #   a_few.refute_length!(0..1)  # == [1, 2]
  #   a_few.refute_length!(0..2)  # raises exception
  #
  # @param length [Integer, Range<Integer>]
  # @param name [String, Symbol]
  #   Name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Array length matches +length+
  def refute_length!(length, name = nil)
    if length === self.length
      raise MiniSanity::Error.new(name,
        "#{self.class} not having #{length} elements",
        self.inspect)
    end
    self
  end

end
