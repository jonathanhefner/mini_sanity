$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "mini_sanity"

require "minitest/autorun"

class Minitest::Test

  def assert_sanity(subject, subject_name = "INSAAANE", &block)
    if subject.nil?
      assert_nil block.call(subject, name)
    else
      assert_equal subject, block.call(subject, name)
    end
  end

  def refute_sanity(subject, subject_name = "INSAAANE", &block)
    assert_raises(MiniSanity::Error) { block.call(subject, nil) }
    error = assert_raises(MiniSanity::Error) { block.call(subject, subject_name) }
    assert_match subject_name, error.message
  end

end
