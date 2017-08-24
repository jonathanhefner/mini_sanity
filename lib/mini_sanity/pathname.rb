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
    unless self.exist?
      descriptor = name ? "#{name} (#{self})" : self.to_s
      raise MiniSanity::Error.new("#{descriptor} does not exist")
    end
    self
  end

end
