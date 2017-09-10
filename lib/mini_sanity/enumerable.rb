module Enumerable

  # Checks that the Enumerable is not empty, and returns the Enumerable
  # unmodified.  If the Enumerable fails this check, an exception is
  # raised.
  #
  # @example
  #   ["result 1"].refute_empty!  # == ["result 1"]
  #   [].refute_empty!            # raises exception
  #
  # @param name [String, Symbol]
  #   optional name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Enumerable is empty
  def refute_empty!(name = nil)
    if self.empty?
      raise MiniSanity::Error.new(name,
        "non-empty #{self.class}",
        self.inspect)
    end
    self
  end

end
