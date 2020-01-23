module MiniSanity
  class Error < RuntimeError

    def initialize(message, details = {})
      super([
        message,
        *details.compact.map{|name, value| "#{name}:\n  #{value}" }
      ].join("\n\n"))
    end

    # @!visibility private
    def self.describe_block(&block)
      if (symbol_name = block.to_s[/\(&:(.+)\)>$/, 1])
        "&:#{symbol_name}"
      elsif block&.source_location
        "block@#{block.source_location.join(":")}"
      end
    end

  end
end
