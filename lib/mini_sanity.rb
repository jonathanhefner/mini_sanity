require_relative "mini_sanity/version"

module MiniSanity
  # Matches truthy values (i.e. not +false+ or +nil+).
  TRUTHY = ->(x){ !!x }

  def TRUTHY.inspect
    "MiniSanity::TRUTHY"
  end
end

require_relative "mini_sanity/error"
require_relative "mini_sanity/object"
