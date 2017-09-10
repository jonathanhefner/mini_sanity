class Pathname

  # Checks that the file or directory indicated by the Pathname exists,
  # and returns the Pathname unmodified.  If the Pathname fails this
  # check, an exception is raised.
  #
  # @example
  #   Pathname.new(__FILE__).assert_exist!          # == Pathname.new(__FILE__)
  #   Pathname.new("/dev/null/nope").assert_exist!  # == raises exception
  #
  # @param name [String, Symbol]
  #   optional name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the file or directory indicated by the Pathname does not exist
  def assert_exist!(name = nil)
    if !self.exist?
      raise MiniSanity::Error.new(name,
        "existent file or directory",
        "#{self} does not exist")
    end
    self
  end

  # Checks that the file or directory indicated by the Pathname does
  # not already exist, and returns the Pathname unmodified.  If the
  # Pathname fails this check, an exception is raised.
  #
  # @example
  #   Pathname.new("/dev/null/nope").refute_exist!  # == Pathname.new("/dev/null/nope")
  #   Pathname.new(__FILE__).refute_exist!          # raises exception
  #
  # @param name [String, Symbol]
  #   optional name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the file or directory indicated by the Pathname already exists
  def refute_exist!(name = nil)
    if self.exist?
      raise MiniSanity::Error.new(name,
        "non-existent file or directory",
        "#{self} already exists")
    end
    self
  end

end
