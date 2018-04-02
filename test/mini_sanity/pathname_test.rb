require "test_helper"
require "pathname"

class PathnameTest < Minitest::Test

  def test_assert_exist_pass
    assert_sanity(Pathname.new(__FILE__)){|path| path.assert_exist! }
  end

  def test_assert_exist_fail
    refute_sanity(Pathname.new(__FILE__) / "nope"){|path, name| path.assert_exist!(name) }
  end

  def test_refute_exist_pass
    assert_sanity(Pathname.new(__FILE__) / "nope"){|path| path.refute_exist! }
  end

  def test_refute_exist_fail
    refute_sanity(Pathname.new(__FILE__)){|path, name| path.refute_exist!(name) }
  end

end
