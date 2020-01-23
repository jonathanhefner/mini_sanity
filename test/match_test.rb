require "test_helper"
require "mini_sanity/match"

class MatchTest < Minitest::Test

  def test_matchbang_like_match
    strings = %w[ok OK ookk k no]
    pattern = /ok/i
    positions = [nil, 0, 1, 2, -1]

    strings.product(positions) do |string, pos|
      pos_arg = [pos].compact
      expected = pattern.match(string, *pos_arg)
      if expected
        assert_equal expected, string.match!(pattern, *pos_arg)
        assert_equal expected, pattern.match!(string, *pos_arg)
      else
        assert_raises(MiniSanity::Error){ string.match!(pattern, *pos_arg) }
        assert_raises(MiniSanity::Error){ pattern.match!(string, *pos_arg) }
      end
    end
  end

  def test_matchbang_error_message
    string = "Foo Bar"
    pattern = /#{string.reverse}/
    pos = -(string.length / 2)

    error = assert_raises(MiniSanity::Error) do
      string.match!(pattern, pos)
    end
    assert_match string.inspect, error.message
    assert_match string[pos..].inspect, error.message
    assert_match pos.to_s, error.message
    assert_match pattern.inspect, error.message
  end

end
