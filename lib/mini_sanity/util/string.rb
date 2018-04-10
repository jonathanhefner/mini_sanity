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

  # Like {https://ruby-doc.org/core/String.html#method-i-sub
  # +String#sub+}, but raises an exception if the result is the same as
  # the original String.
  #
  # @example
  #   "author: YOUR_NAME".change(/\bYOUR_NAME\b/, "Me")  # == "author: Me"
  #   "author: TODO".change(/\bYOUR_NAME\b/, "Me")       # raises exception
  #
  # @param pattern [Regexp, String]
  #   pattern to search for
  # @param replacement [String, Hash, &block]
  #   substitution value (see +String#sub+ documentation for full details)
  # @return [String]
  # @raise [MiniSanity::Error]
  #   if the result is the same as the original String
  def change(pattern, replacement = nil, &replacement_block)
    result = if replacement
      self.sub(pattern, replacement)
    else
      self.sub(pattern, &replacement_block)
    end

    if result == self
      raise MiniSanity::Error.new(nil,
        "String matching #{pattern.inspect}",
        self.inspect)
    end

    result
  end

end
