require_relative "error"


class String

  # Like {https://docs.ruby-lang.org/en/master/String.html#method-i-match
  # +String#match+}, but raises an exception if the match fails.
  #
  # @example
  #   "user@example.com".match!(/^([^@]+)@(.+)$/)  # === MatchData
  #   "@user".match!(/^([^@]+)@(.+)$/)             # raises exception
  #
  # @param pattern [Regexp]
  #   Pattern to search for
  # @param pos [Integer]
  #   Position in the String to search from
  # @return [MatchData]
  # @raise [MiniSanity::Error]
  #   if +pattern+ does not match the String
  def match!(pattern, pos = 0)
    result = self.match(pattern, pos)

    if result.nil?
      raise MiniSanity::Error.new("String does not match pattern", {
        "String" => self.inspect,
        "Relevant portion (from position #{pos})" => (self[pos..].inspect if pos != 0),
        "Pattern" => pattern.inspect,
      })
    end

    result
  end

end


class Regexp

  # Like {https://docs.ruby-lang.org/en/master/Regexp.html#method-i-match
  # +Regexp#match+}, but raises an exception if the match fails.
  #
  # @example
  #   /^([^@]+)@(.+)$/.match!("user@example.com")  # === MatchData
  #   /^([^@]+)@(.+)$/.match!("@user")             # raises exception
  #
  # @param str [String]
  #   String to search
  # @param pos [Integer]
  #   Position in +str+ to search from
  # @return [MatchData]
  # @raise [MiniSanity::Error]
  #   if the Regexp does not match +str+
  def match!(str, pos = 0)
    str.match!(self, pos)
  end

end
