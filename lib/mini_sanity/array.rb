class Array

  # Checks that the Array matches a given length, and returns the Array
  # unmodified.  If the Array fails this check, an exception is
  # raised.
  #
  # @example
  #   coord = [0, 0, 0]
  #   coord.assert_length(3)!  # == [0, 0, 0]
  #
  #   coord = [0, 0]
  #   coord.assert_length(3)!  # raises exception
  #
  #   coord = [0, 0]
  #   coord.assert_length(2..3)!  # == [0, 0]
  #
  # @param length [Integer, Range<Integer>]
  #   length to match
  # @param name [String, Symbol]
  #   optional name to include in the error message
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

  # Checks that the Array does not match a given length, and returns the
  # Array unmodified.  If the Array fails this check, an exception is
  # raised.
  #
  # @example
  #   some = ["one"]
  #   some.refute_length!(0)  # == ["one"]
  #
  #   some = []
  #   some.refute_length(0)!  # raises exception
  #
  #   many = ["one", "many"]
  #   many.refute_length!(0..1)  # == ["one", "many"]
  #
  # @param length [Integer, Range<Integer>]
  #   length to not match
  # @param name [String, Symbol]
  #   optional name to include in the error message
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
