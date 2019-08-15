require "test_helper"
require "mini_sanity/util"

class StringTest < Minitest::Test

  def test_match_bang_like_match
    strings = %w[ok OK ookk k no]
    pattern = /ok/i
    positions = [nil, 0, 1, 2, -1]

    strings.product(positions).each do |str, pos|
      args = [pattern, pos].compact
      expected = str.match(*args)
      if expected
        assert_equal expected, str.match!(*args)
      else
        assert_raises(MiniSanity::Error) { str.match!(*args) }
      end
    end
  end

  def test_change_bang_like_sub_bang
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
