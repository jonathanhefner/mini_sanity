require "test_helper"
require "mini_sanity/results"

class ResultsTest < Minitest::Test

  def test_resultsbang_when_any_results
    collection = 0..9
    assert_equal collection.select(&:odd?), collection.select.results!(&:odd?)
  end

  def test_resultsbang_when_all_nil_results
    collection = [nil, "not nil"]
    assert_equal collection.select(&:nil?), collection.select.results!(&:nil?)
  end

  def test_resultsbang_when_no_results
    enum = (0..9).select

    error = assert_raises(MiniSanity::Error) do
      enum.results!(&:infinite?)
    end
    assert_match enum.inspect, error.message
    assert_match "infinite?", error.message
  end

  def test_resultsbang_when_non_enumerable_results
    enum = "Foo Bar".gsub(/Bar/)

    error = assert_raises(MiniSanity::Error) do
      enum.results!(&:swapcase)
    end
    assert_match enum.inspect, error.message
    assert_match "swapcase", error.message
    assert_match enum.each(&:swapcase).inspect, error.message
  end

  def test_resultsbang_requires_block
    assert_raises(ArgumentError){ [1].select.results! }
  end

  def test_resultbang_when_non_nil_result
    collection = 1..5
    assert_equal collection.find(&:even?), collection.find.result!(&:even?)
  end

  def test_resultbang_when_nil_result
    enum = (1..5).find

    error = assert_raises(MiniSanity::Error) do
      enum.results!(&:infinite?)
    end
    assert_match enum.inspect, error.message
    assert_match "infinite?", error.message
  end

  def test_resultbang_requires_block
    assert_raises(ArgumentError){ [1].find.result! }
  end

end
