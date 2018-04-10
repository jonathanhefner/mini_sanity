require "test_helper"
require "mini_sanity/util"

class EnumerableTest < Minitest::Test

  def test_first_bang_like_first
    enumerables = [[], [nil], [1], [1, 2, 3], (1..3)]

    enumerables.each do |enum|
      enum_length = enum.to_a.length

      if enum_length > 0
        assert_equal [enum.first], [enum.first!]
      else
        assert_raises(MiniSanity::Error) { enum.first! }
      end

      (0..enum_length).each do |n|
        assert_equal enum.first(n), enum.first!(n)
      end

      assert_raises(MiniSanity::Error) { enum.first!(enum_length + 1) }
    end
  end

end
