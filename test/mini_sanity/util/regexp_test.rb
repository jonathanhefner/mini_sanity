require "test_helper"
require "mini_sanity/util"

class RegexpTest < Minitest::Test

  def test_match_bang_like_match
    strings = %w[ok OK ookk k no]
    pattern = /ok/i
    positions = [nil, 0, 1, 2, -1]

    strings.product(positions).map(&:compact).each do |args|
      expected = pattern.match(*args)
      if expected
        assert_equal expected, pattern.match!(*args)
      else
        assert_raises(MiniSanity::Error) { pattern.match!(*args) }
      end
    end
  end

end
