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

end
