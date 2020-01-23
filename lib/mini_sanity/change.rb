require_relative "error"


class String

  # Like {https://docs.ruby-lang.org/en/master/String.html#method-i-sub-21
  # +String#sub!+}, but raises an exception if no substitution is
  # performed.
  #
  # @example
  #   info = "library: LIB_NAME\nlanguage: LIB_LANG\n"
  #   info.change!(/\bLIB_NAME\b/, "mini_sanity")  # == "library: mini_sanity\nlanguage: LIB_LANG\n"
  #   info                                         # == "library: mini_sanity\nlanguage: LIB_LANG\n"
  #   info.change!(/\bLIB_LANGUAGE\b/, "Ruby")     # raises exception
  #
  # @overload change!(pattern, replacement)
  #   @param pattern [Regexp, String]
  #     Pattern to search for
  #   @param replacement [String]
  #     Replacement String (see +String#sub+ documentation for more
  #     information)
  #   @return [String]
  #   @raise [MiniSanity::Error]
  #     if no substitution was performed
  #
  # @overload change!(pattern, hash)
  #   @param pattern [Regexp, String]
  #     Pattern to search for
  #   @param hash [Hash]
  #     Substitution Hash (see +String#sub+ documentation for more
  #     information)
  #   @return [String]
  #   @raise [MiniSanity::Error]
  #     if no substitution was performed
  #
  # @overload change!(pattern, &block)
  #   @param pattern [Regexp, String]
  #     Pattern to search for
  #   @yieldparam match [String]
  #     Matched String
  #   @yieldreturn [String]
  #     Replacement String
  #   @return [String]
  #   @raise [MiniSanity::Error]
  #     if no substitution was performed
  def change!(pattern, replacement = nil, &block)
    result = if replacement
      self.sub!(pattern, replacement)
    else
      self.sub!(pattern, &block)
    end

    if !result
      raise MiniSanity::Error.new(nil,
        "String matching #{pattern.inspect}",
        self.inspect)
    end

    result
  end

  # Like {https://docs.ruby-lang.org/en/master/String.html#method-i-sub
  # +String#sub+}, but raises an exception if no substitution is
  # performed.
  #
  # @example
  #   info = "library: LIB_NAME\nlanguage: LIB_LANG\n"
  #   info.change(/\bLIB_NAME\b/, "mini_sanity")  # == "library: mini_sanity\nlanguage: LIB_LANG\n"
  #   info                                        # == "library: LIB_NAME\nlanguage: LIB_LANG\n"
  #   info.change(/\bLIB_LANGUAGE\b/, "Ruby")     # raises exception
  #
  # @overload change(pattern, replacement)
  #   @param pattern [Regexp, String]
  #     Pattern to search for
  #   @param replacement [String]
  #     Replacement String (see +String#sub+ documentation for more
  #     information)
  #   @return [String]
  #   @raise [MiniSanity::Error]
  #     if no substitution was performed
  #
  # @overload change(pattern, hash)
  #   @param pattern [Regexp, String]
  #     Pattern to search for
  #   @param hash [Hash]
  #     Substitution Hash (see +String#sub+ documentation for more
  #     information)
  #   @return [String]
  #   @raise [MiniSanity::Error]
  #     if no substitution was performed
  #
  # @overload change(pattern, &block)
  #   @param pattern [Regexp, String]
  #     Pattern to search for
  #   @yieldparam match [String]
  #     Matched String
  #   @yieldreturn [String]
  #     Replacement String
  #   @return [String]
  #   @raise [MiniSanity::Error]
  #     if no substitution was performed
  def change(pattern, replacement = nil, &block)
    self.dup.change!(pattern, replacement, &block)
  end

end
