require "test_helper"

class EnumerableTest < Minitest::Test

  def test_assert_empty_pass
    assert_sanity(1...1){|enum| enum.assert_empty! }
  end

  def test_assert_empty_fail
    refute_sanity([1]){|enum, name| enum.assert_empty!(name) }
  end

  def test_refute_empty_pass
    assert_sanity(1...2){|enum| enum.refute_empty! }
  end

  def test_refute_empty_fail
    refute_sanity([]){|enum, name| enum.refute_empty!(name) }
  end

end
