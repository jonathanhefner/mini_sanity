class Regexp

  # Like {https://ruby-doc.org/core/Regexp.html#method-i-match
  # +Regexp#match+}, but raises an exception if the match fails.
  #
  # @example
  #   /^([^@]+)@(.+)$/.match!("user@example.com")  # === MatchData
  #   /^([^@]+)@(.+)$/.match!("@user")             # raises exception
  #
  # @param str [String]
  #   string to search
  # @param pos [Integer]
  #   position in +str+ to begin the search
  # @return [MatchData]
  # @raise [MiniSanity::Error]
  #   if the Regexp does not match +str+
  def match!(str, pos = 0)
    result = self.match(str, pos)
    if result.nil?
      raise MiniSanity::Error.new(nil,
        "String matching #{self.inspect}#{" from position #{pos}" if pos != 0}",
        str.inspect)
    end
    result
  end

end
