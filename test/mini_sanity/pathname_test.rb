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

  def test_assert_dir_pass
    assert_sanity(Pathname.new(__dir__)){|path| path.assert_dir! }
  end

  def test_assert_dir_fail
    refute_sanity(Pathname.new(__FILE__)){|path, name| path.assert_dir!(name) }
  end

  def test_refute_dir_pass
    assert_sanity(Pathname.new(__FILE__)){|path| path.refute_dir! }
  end

  def test_refute_dir_fail
    refute_sanity(Pathname.new(__dir__)){|path, name| path.refute_dir!(name) }
  end

  def test_assert_file_pass
    assert_sanity(Pathname.new(__FILE__)){|path| path.assert_file! }
  end

  def test_assert_file_fail
    refute_sanity(Pathname.new(__dir__)){|path, name| path.assert_file!(name) }
  end

  def test_refute_file_pass
    assert_sanity(Pathname.new(__dir__)){|path| path.refute_file! }
  end

  def test_refute_file_fail
    refute_sanity(Pathname.new(__FILE__)){|path, name| path.refute_file!(name) }
  end

end
