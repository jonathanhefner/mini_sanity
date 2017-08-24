require "test_helper"

class StringTest < Minitest::Test

  def test_refute_empty_pass
    assert_sanity("abc") {|s| s.refute_empty! }
  end

  def test_refute_empty_fail
    refute_sanity {|name| "".refute_empty!(name) }
  end

end
