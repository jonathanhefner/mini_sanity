require "test_helper"

class EnumerableTest < Minitest::Test

  def test_refute_empty_pass
    assert_sanity([7, 8]) {|e| e.refute_empty! }
  end

  def test_refute_empty_fail
    refute_sanity {|name| [].refute_empty!(name) }
  end

end
