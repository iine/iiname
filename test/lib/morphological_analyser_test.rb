require 'test_helper'

class MorphologicalAnalyserTest < ActiveSupport::TestCase

  setup do
  end

  test "should return only nouns" do
    assert_equal(["花京院", "典明"], MorphologicalAnalyser.new.extract_noun("花京院と典明です"))
  end
end
