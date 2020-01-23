require "test_helper"
require "mini_sanity"

class MiniSanityTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil ::MiniSanity::VERSION
  end

end
