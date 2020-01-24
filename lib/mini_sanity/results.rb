require_relative "error"


class Enumerator

  # Iterates the Enumerator with a given +block+, and checks that the
  # result is an Enumerable that has one or more elements.  Raises an
  # exception if this check fails.  Otherwise, returns the Enumerable
  # result.
  #
  # @example
  #   [1, 2, 3].select.results!(&:odd?)  # == [1, 3]
  #   [2, 4, 6].select.results!(&:odd?)  # raises exception
  #
  # @return [Enumerable]
  # @raise [ArgumentError]
  #   if no +block+ is provided
  # @raise [MiniSanity::Error]
  #   if iterating does not result in an Enumerable, or if the resulting
  #   Enumerable has no elements
  def results!(&block)
    raise ArgumentError, "Enumerator#results! requires a block" unless block

    results = self.each(&block)

    if !results.is_a?(Enumerable)
      raise MiniSanity::Error.new("Result from Enumerator with block is not an Enumerable", {
        "Enumerator" => self.inspect,
        "Block" => MiniSanity::Error.describe_block(&block),
        "Result" => results.inspect,
      })
    elsif !results.any?{ true }
      raise MiniSanity::Error.new("No results from Enumerator with block", {
        "Enumerator" => self.inspect,
        "Block" => MiniSanity::Error.describe_block(&block),
      })
    end

    results
  end

  # Iterates the Enumerator with a given +block+, and checks that the
  # result is not nil.  Raises an exception if the result is nil.
  # Otherwise, returns the non-nil result.
  #
  # @example
  #   [1, 2, 3].find.result!(&:even?)  # == 2
  #   [1, 3, 5].find.result!(&:even?)  # raises exception
  #
  # @return [Object]
  # @raise [ArgumentError]
  #   if no +block+ is provided
  # @raise [MiniSanity::Error]
  #   if iterating results in a nil value
  def result!(&block)
    raise ArgumentError, "Enumerator#result! requires a block" unless block

    result = self.each(&block)

    if result.nil?
      raise MiniSanity::Error.new("Nil result from Enumerator with block", {
        "Enumerator" => self.inspect,
        "Block" => MiniSanity::Error.describe_block(&block),
      })
    end

    result
  end

end
