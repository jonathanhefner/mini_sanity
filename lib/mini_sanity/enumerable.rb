module Enumerable

  # Checks that the Enumerable is not empty, and returns the Enumerable
  # unmodified.  If the Enumerable fails this check, an exception is
  # raised.
  #
  # @example
  #   [7, 8].refute_empty!  # == [7, 8]
  #   [].refute_empty!      # raises exception
  #
  # @param name [String, Symbol]
  #   optional name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Enumerable is empty
  def refute_empty!(name = nil)
    if self.empty?
      raise MiniSanity::Error.new("#{name || self.class} is empty")
    end
    self
  end

end
