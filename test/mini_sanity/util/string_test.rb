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

end
