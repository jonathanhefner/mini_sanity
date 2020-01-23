module MiniSanity
  class Error < RuntimeError

    def initialize(name, expected, actual)
      super(
        "\n#{name || "value"} violates expectations\n" \
        "  expected: #{expected}\n" \
        "  actual: #{actual}\n"
      )
    end

    # @!visibility private
    def self.describe_value(&block)
      if !block
        "value"
      elsif (proc_symbol = block.to_s[/\(&:(.+)\)>$/, 1])
        "value.#{proc_symbol}"
      elsif block.source_location
        "value when yielded to block at #{block.source_location.join(":")}"
      else
        "value when yielded to block"
      end
    end

  end
end
