$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "mini_sanity"

require "minitest/autorun"

class Minitest::Test

  def assert_sanity(subject, &block)
    if subject.nil?
      assert_nil block.call(subject)
    else
      assert_equal subject, block.call(subject)
    end
  end

  def refute_sanity(subject_name = "INSAAANE", &block)
    assert_raises(MiniSanity::Error) { block.call(nil) }
    error = assert_raises(MiniSanity::Error) { block.call(subject_name) }
    assert_match subject_name, error.message
  end

end
