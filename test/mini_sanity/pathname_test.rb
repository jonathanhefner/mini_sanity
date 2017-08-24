require "test_helper"
require "pathname"

class PathnameTest < Minitest::Test

  def test_assert_exist_pass
    assert_sanity(Pathname.new(__FILE__)) {|p| p.assert_exist! }
  end

  def test_assert_exist_fail
    refute_sanity {|name| (Pathname.new(__FILE__) / "nope").assert_exist!(name) }
  end

  def test_refute_exist_pass
    assert_sanity(Pathname.new(__FILE__) / "nope") {|p| p.refute_exist! }
  end

  def test_refute_exist_fail
    refute_sanity {|name| Pathname.new(__FILE__).refute_exist!(name) }
  end

end
