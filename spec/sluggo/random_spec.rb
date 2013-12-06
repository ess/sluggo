require 'spec_helper'
require 'sluggo/random'

describe Sluggo::Random do
  let(:klass) {Sluggo::Random}

  describe %{.base62} do
    it %{defaults to a length of 1} do
      klass.base62.length.must_equal 1
    end

    it %{can take a specific length} do
      klass.base62(12).length.must_equal 12
    end

    it %{is comprised of valid slug characters} do
      klass.base62.split('').each do |character|
        (0..61).to_a.must_include Radix62.decode62(character)
      end
    end

    it %{requires that a provided length be > 0} do
      lambda {klass.base62(0)}.must_raise ArgumentError
    end
  end
end
