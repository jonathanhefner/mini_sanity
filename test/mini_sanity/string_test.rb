require "test_helper"

class StringTest < Minitest::Test

  def test_assert_empty_pass
    assert_sanity("") {|s| s.assert_empty! }
  end

  def test_assert_empty_fail
    refute_sanity {|name| "abc".assert_empty!(name) }
  end

  def test_refute_empty_pass
    assert_sanity("abc") {|s| s.refute_empty! }
  end

  def test_refute_empty_fail
    refute_sanity {|name| "".refute_empty!(name) }
  end

  def test_assert_match_pass
    assert_sanity("abc") {|s| s.assert_match!(/b/) }
  end

  def test_assert_match_fail
    refute_sanity {|name| "abc".assert_match!(/x/, name) }
  end

  def test_refute_match_pass
    assert_sanity("abc") {|s| s.refute_match!(/x/) }
  end

  def test_refute_match_fail
    refute_sanity {|name| "abc".refute_match!(/b/, name) }
  end

end
