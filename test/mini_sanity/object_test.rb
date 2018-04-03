require "test_helper"

class ObjectTest < Minitest::Test

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
