require "test_helper"

class ObjectTest < Minitest::Test

  def test_refute_nil_pass
    assert_sanity(Object.new) {|o| o.refute_nil! }
  end

  def test_refute_nil_fail
    refute_sanity {|name| nil.refute_nil!(name) }
  end

  def test_assert_instance_of_pass
    assert_sanity("abc") {|s| s.assert_instance_of!(String) }
  end

  def test_assert_instance_of_fail
    refute_sanity {|name| "abc".assert_instance_of!(Numeric, name) }
  end

  def test_assert_kind_of_pass
    assert_sanity(42) {|i| i.assert_kind_of!(Numeric) }
  end

  def test_assert_kind_of_fail
    refute_sanity {|name| (42).assert_kind_of!(Float, name) }
  end

  def test_assert_respond_to_pass
    assert_sanity("abc") {|s| s.assert_respond_to!(:empty?) }
  end

  def test_assert_respond_to_fail
    refute_sanity {|name| "abc".assert_respond_to!(:pop, name) }
  end

end
