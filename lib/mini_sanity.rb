require_relative "mini_sanity/version"

module MiniSanity
  # Matches truthy values (i.e. not +false+ or +nil+).
  TRUTHY = ->(x){ !!x }

  def TRUTHY.inspect
    "MiniSanity::TRUTHY"
  end
end

require_relative "mini_sanity/error"
require_relative "mini_sanity/array"
require_relative "mini_sanity/enumerable"
require_relative "mini_sanity/object"
require_relative "mini_sanity/pathname"
require_relative "mini_sanity/string"
