class String

  # Like {https://ruby-doc.org/core/String.html#method-i-match
  # +String#match+}, but raises an exception if the match fails.
  #
  # @example
  #   "user@example.com".match!(/^([^@]+)@(.+)$/)  # === MatchData
  #   "@user".match!(/^([^@]+)@(.+)$/)             # raises exception
  #
  # @param pattern [Regexp]
  #   pattern to search for
  # @param pos [Integer]
  #   position in the String to begin the search
  # @return [MatchData]
  # @raise [MiniSanity::Error]
  #   if +pattern+ does not match the String
  def match!(pattern, pos = 0)
    result = self.match(pattern, pos)
    if result.nil?
      raise MiniSanity::Error.new(nil,
        "String matching #{pattern.inspect}#{" from position #{pos}" if pos != 0}",
        self.inspect)
    end
    result
  end

end
