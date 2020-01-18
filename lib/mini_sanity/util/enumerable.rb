module Enumerable

  # Like {https://docs.ruby-lang.org/en/master/Enumerable.html#method-i-first
  # +Enumerable#first+}, but raises an exception if the Enumerable
  # contains fewer than the requested number of elements.
  #
  # @example
  #   [7, 8, 9].first!     # == 7
  #   [7, 8, 9].first!(1)  # == [7]
  #   [7, 8, 9].first!(2)  # == [7, 8]
  #   [7, 8, 9].first!(4)  # raises exception
  #   [].first!            # raises exception
  #
  # @overload first!()
  #   @return [Object]
  #   @raise [MiniSanity::Error]
  #     if the Enumerable does not contain at least one element
  #
  # @overload first!(n)
  #   @param n [Integer]
  #   @return [Array]
  #   @raise [MiniSanity::Error]
  #     if the Enumerable does not contain at least +n+ elements
  def first!(n = nil)
    result = n.nil? ? self.first : self.first(n)

    if (result.nil? && !self.any?{ true }) || (!n.nil? && result.length < n)
      raise MiniSanity::Error.new(nil,
        "Enumerable having at least #{n || 1} elements",
        self.inspect)
    end

    result
  end

end
