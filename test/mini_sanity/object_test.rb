require "test_helper"

class ObjectTest < Minitest::Test

  AN_INT = 9000

  def test_assertbang_with_truthy
    object = Object.new
    assert_equal object, object.assert!
  end

  def test_assertbang_with_falsy
    assert_raises(MiniSanity::Error){ nil.assert! }
  end

  def test_assertbang_with_matching_pattern
    [Object, Numeric, Integer, AN_INT, AN_INT..].each do |pattern|
      assert_equal AN_INT, AN_INT.assert!(pattern)
    end
  end

  def test_assertbang_with_mismatching_pattern
    [Float, AN_INT + 1, (AN_INT + 1)..].each do |pattern|
      assert_raises(MiniSanity::Error){ AN_INT.assert!(pattern) }
    end
  end

  def test_assertbang_with_truthy_block_return
    assert_equal AN_INT * 2, (AN_INT * 2).assert!(&:even?)
  end

  def test_assertbang_with_falsy_block_return
    assert_raises(MiniSanity::Error){ (AN_INT * 2).assert!(&:odd?) }
  end

  def test_assertbang_error_message
    name = "fail to win"
    string = "Foo Bar"
    pattern = /#{string.reverse}/

    error = assert_raises(MiniSanity::Error) do
      string.assert!(pattern, name: name, &:swapcase)
    end
    assert_match name, error.message
    assert_match string.inspect, error.message
    assert_match pattern.inspect, error.message
    assert_match "swapcase", error.message
  end

  def test_refutebang_with_truthy
    assert_raises(MiniSanity::Error){ Object.new.refute! }
  end

  def test_refutebang_with_falsy
    assert_equal false, false.refute!
  end

  def test_refutebang_with_matching_pattern
    [Object, Numeric, Integer, AN_INT, AN_INT..].each do |pattern|
      assert_raises(MiniSanity::Error){ AN_INT.refute!(pattern) }
    end
  end

  def test_refutebang_with_mismatching_pattern
    [Float, AN_INT + 1, (AN_INT + 1)..].each do |pattern|
      assert_equal AN_INT, AN_INT.refute!(pattern)
    end
  end

  def test_refutebang_with_truthy_block_return
    assert_raises(MiniSanity::Error){ (AN_INT * 2).refute!(&:even?) }
  end

  def test_refutebang_with_falsy_block_return
    assert_equal AN_INT * 2, (AN_INT * 2).refute!(&:odd?)
  end

  def test_refutebang_error_message
    name = "fail to win"
    string = "Foo Bar"
    pattern = /#{string.upcase}/i

    error = assert_raises(MiniSanity::Error) do
      string.refute!(pattern, name: name, &:swapcase)
    end
    assert_match name, error.message
    assert_match string.inspect, error.message
    assert_match pattern.inspect, error.message
    assert_match "swapcase", error.message
  end

  def test_assert_nil_pass
    assert_sanity(nil){|nill| nill.assert_nil! }
  end

  def test_assert_nil_fail
    refute_sanity(Object.new){|obj, name| obj.assert_nil!(name) }
  end

  def test_refute_nil_pass
    assert_sanity(Object.new){|obj| obj.refute_nil! }
  end

  def test_refute_nil_fail
    refute_sanity(nil){|nill, name| nill.refute_nil!(name) }
  end

  def test_assert_equal_pass
    assert_sanity("ok"){|str| str.assert_equal!(str + "") }
  end

  def test_assert_equal_fail
    refute_sanity(42){|int, name| int.assert_equal!(int + 1, name) }
  end

  def test_refute_equal_pass
    assert_sanity("ok"){|str| str.refute_equal!("not" + str) }
  end

  def test_refute_equal_fail
    refute_sanity(42){|int, name| int.refute_equal!(int, name) }
  end

  def test_assert_in_pass
    assert_sanity("ok"){|str| str.assert_in!(str..str) }
  end

  def test_assert_in_fail
    refute_sanity(42){|int, name| int.assert_in!([int - 1, int + 1], name) }
  end

  def test_refute_in_pass
    assert_sanity("ok"){|str| str.refute_in!(["not" + str]) }
  end

  def test_refute_in_fail
    refute_sanity(42){|int, name| int.refute_in!(int..int, name) }
  end

  def test_assert_instance_of_pass
    assert_sanity("abc"){|str| str.assert_instance_of!(String) }
  end

  def test_assert_instance_of_fail
    refute_sanity("abc"){|str, name| str.assert_instance_of!(Numeric, name) }
  end

  def test_assert_kind_of_pass
    assert_sanity(42){|int| int.assert_kind_of!(Numeric) }
  end

  def test_assert_kind_of_fail
    refute_sanity(42){|int, name| int.assert_kind_of!(Float, name) }
  end

  def test_assert_respond_to_pass
    assert_sanity([]){|array| array.assert_respond_to!(:empty?) }
  end

  def test_assert_respond_to_fail
    refute_sanity([]){|array, name| array.assert_respond_to!(:gsub, name) }
  end

end
