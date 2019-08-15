require "test_helper"

class ArrayTest < Minitest::Test

  def test_assert_length_pass_with_int
    assert_sanity([1]){|array| array.assert_length!(array.length) }
  end

  def test_assert_length_pass_with_range
    assert_sanity([1]){|array| array.assert_length!(0..array.length) }
  end

  def test_assert_length_fail_with_int
    refute_sanity([1]){|array, name| array.assert_length!(array.length + 1, name) }
  end

  def test_assert_length_fail_with_range
    refute_sanity([1]){|array, name| array.assert_length!(0...array.length, name) }
  end

  def test_refute_length_pass_with_int
    assert_sanity([1]){|array| array.refute_length!(array.length + 1) }
  end

  def test_refute_length_pass_with_range
    assert_sanity([1]){|array| array.refute_length!(0...array.length) }
  end

  def test_refute_length_fail_with_int
    refute_sanity([1]){|array, name| array.refute_length!(array.length, name) }
  end

  def test_refute_length_fail_with_range
    refute_sanity([1]){|array, name| array.refute_length!(0..array.length, name) }
  end

end
