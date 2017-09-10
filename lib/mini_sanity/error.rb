class MiniSanity::Error < RuntimeError

  def initialize(name, expected, actual)
    super(
      "\n#{name || "value"} violates expectations\n" \
      "  expected: #{expected}\n" \
      "  actual: #{actual}\n"
    )
  end

end
