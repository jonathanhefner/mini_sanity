require "test_helper"

class EnumerableTest < Minitest::Test

  def test_assert_empty_pass
    assert_sanity(1...1) {|e| e.assert_empty! }
  end

  def test_assert_empty_fail
    refute_sanity {|name| [1].assert_empty!(name) }
  end

  def test_refute_empty_pass
    assert_sanity(1...2) {|e| e.refute_empty! }
  end

  def test_refute_empty_fail
    refute_sanity {|name| [].refute_empty!(name) }
  end

end
