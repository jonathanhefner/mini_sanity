require "test_helper"
require "mini_sanity/change"

class ChangeTest < Minitest::Test

  def test_changebang_like_subbang
    strings = %w[abc aaa x]
    pattern = /a/
    replacement = ""

    strings.each do |str|
      if pattern =~ str
        expected = str.dup.sub!(pattern, replacement)
        assert_equal expected, str.dup.change!(pattern, replacement)
        assert_equal expected, str.dup.change!(pattern, Hash.new{ replacement })
        assert_equal expected, (str.dup.change!(pattern){ replacement })
        assert_same str, str.change!(pattern, replacement)
      else
        assert_raises(MiniSanity::Error) { str.change!(pattern, replacement) }
      end
    end
  end

  def test_changebang_error_message
    string = "Foo Bar"
    pattern = /#{string.reverse}/

    error = assert_raises(MiniSanity::Error) do
      string.change!(pattern, "")
    end
    assert_match string.inspect, error.message
    assert_match pattern.inspect, error.message
  end

  def test_change_like_sub
    strings = %w[abc aaa x]
    pattern = /a/
    replacement = ""

    strings.each do |str|
      if pattern =~ str
        original = str.dup
        expected = str.sub(pattern, replacement)
        assert_equal expected, str.change(pattern, replacement)
        assert_equal expected, str.change(pattern, Hash.new{ replacement })
        assert_equal expected, (str.change(pattern){ replacement })
        assert_equal original, str, "original string was mutated"
      else
        assert_raises(MiniSanity::Error) { str.change(pattern, replacement) }
      end
    end
  end

end
