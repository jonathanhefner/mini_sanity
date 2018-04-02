require "test_helper"

class StringTest < Minitest::Test

  def test_assert_empty_pass
    assert_sanity(""){|str| str.assert_empty! }
  end

  def test_assert_empty_fail
    refute_sanity("abc"){|str, name| str.assert_empty!(name) }
  end

  def test_refute_empty_pass
    assert_sanity("abc"){|str| str.refute_empty! }
  end

  def test_refute_empty_fail
    refute_sanity(""){|str, name| str.refute_empty!(name) }
  end

  def test_assert_match_pass
    assert_sanity("abc"){|str| str.assert_match!(/./) }
  end

  def test_assert_match_fail
    refute_sanity("abc"){|str, name| str.assert_match!(/\n/, name) }
  end

  def test_refute_match_pass
    assert_sanity("abc"){|str| str.refute_match!(/\n/) }
  end

  def test_refute_match_fail
    refute_sanity("abc"){|str, name| str.refute_match!(/./, name) }
  end

  def test_assert_length_pass_with_int
    assert_sanity("abc"){|str| str.assert_length!(str.length) }
  end

  def test_assert_length_pass_with_range
    assert_sanity("abc"){|str| str.assert_length!(0..str.length) }
  end

  def test_assert_length_fail_with_int
    refute_sanity("abc"){|str, name| str.assert_length!(str.length + 1, name) }
  end

  def test_assert_length_fail_with_range
    refute_sanity("abc"){|str, name| str.assert_length!(0...str.length, name) }
  end

end
