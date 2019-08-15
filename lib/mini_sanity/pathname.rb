class Pathname

  # Checks that the Pathname represents an existing file or directory,
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
  #   if the Pathname does not represent an existing file or directory
  def assert_exist!(name = nil)
    if !self.exist?
      raise MiniSanity::Error.new(name,
        "existent file or directory",
        "#{self} does not exist")
    end
    self
  end

  # Checks that the Pathname does not represent an existing file or
  # directory, and returns the Pathname unmodified.  If the Pathname
  # fails this check, an exception is raised.
  #
  # @example
  #   Pathname.new("/dev/null/nope").refute_exist!  # == Pathname.new("/dev/null/nope")
  #   Pathname.new(__FILE__).refute_exist!          # raises exception
  #
  # @param name [String, Symbol]
  #   optional name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Pathname represents an existing file or directory
  def refute_exist!(name = nil)
    if self.exist?
      raise MiniSanity::Error.new(name,
        "non-existent file or directory",
        "#{self} already exists")
    end
    self
  end

  # Checks that the Pathname represents an existing directory, and
  # returns the Pathname unmodified.  If the Pathname fails this check,
  # an exception is raised.
  #
  # @example
  #   Pathname.new(__dir__).assert_dir!   # == Pathname.new(__dir__)
  #   Pathname.new(__FILE__).assert_dir!  # == raises exception
  #
  # @param name [String, Symbol]
  #   optional name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Pathname does not represent an existing directory
  def assert_dir!(name = nil)
    if !self.directory?
      raise MiniSanity::Error.new(name,
        "existent directory",
        "#{self} is not a directory")
    end
    self
  end

  # Checks that the Pathname does not represent an existing directory,
  # and returns the Pathname unmodified.  If the Pathname fails this
  # check, an exception is raised.
  #
  # @example
  #   Pathname.new(__FILE__).refute_dir!  # == Pathname.new(__FILE__)
  #   Pathname.new(__dir__).refute_dir!   # raises exception
  #
  # @param name [String, Symbol]
  #   optional name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Pathname represents an existing directory
  def refute_dir!(name = nil)
    if self.directory?
      raise MiniSanity::Error.new(name,
        "not an existent directory",
        "#{self} is a directory")
    end
    self
  end

  # Checks that the Pathname represents an existing file, and returns
  # the Pathname unmodified.  If the Pathname fails this check, an
  # exception is raised.
  #
  # @example
  #   Pathname.new(__FILE__).assert_file!  # == Pathname.new(__FILE__)
  #   Pathname.new(__dir__).assert_file!   # == raises exception
  #
  # @param name [String, Symbol]
  #   optional name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Pathname does not represent an existing file
  def assert_file!(name = nil)
    if !self.file?
      raise MiniSanity::Error.new(name,
        "existent file",
        "#{self} is not a file")
    end
    self
  end

  # Checks that the Pathname does not represent an existing file, and
  # returns the Pathname unmodified.  If the Pathname fails this check,
  # an exception is raised.
  #
  # @example
  #   Pathname.new(__dir__).refute_file!   # == Pathname.new(__dir__)
  #   Pathname.new(__FILE__).refute_file!  # raises exception
  #
  # @param name [String, Symbol]
  #   optional name to include in the error message
  # @return [self]
  # @raise [MiniSanity::Error]
  #   if the Pathname represents an existing file
  def refute_file!(name = nil)
    if self.file?
      raise MiniSanity::Error.new(name,
        "not an existent file",
        "#{self} is a file")
    end
    self
  end

end
