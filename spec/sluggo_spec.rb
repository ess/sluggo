require 'spec_helper'
require 'sluggo'

describe Sluggo do
  let(:klass) {Sluggo}
  let(:random) {Sluggo::Random}

  describe %{.rare} do
    it %{requires a block to check for uniqueness} do
      lambda {klass.rare}.must_raise ArgumentError
      klass.rare {true}.must_be_kind_of String
    end

    it %{allows a length} do
      generated = klass.rare(:length => 12) {true}
      generated.length.must_equal 12
    end

    it %{is uses Sluggo::Random} do
      random.expects(:base62)
      klass.rare {true}
    end

    it %{has 100 chances to generate a unique slug by default} do
      chances = 100
      random.expects(:base62).at_most(100).at_least(100)
      klass.rare(:length => 1) {false}
    end

    it %{also accepts a number of chances to generate a unique slug} do
      chances = 10
      random.expects(:base62).at_most(chances)
      klass.rare(:length => 1, :chances => chances) {false}
    end

    it %{needs at least 1 chance to generate a unique slug} do
      lambda {klass.rare(:length => 1, :chances => 0) {false}}.must_raise ArgumentError
      klass.rare(:length => 1, :chances => 1) {false}.must_be_kind_of String
    end
  end
end
