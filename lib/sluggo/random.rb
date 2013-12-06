require 'radix62'

module Sluggo
  # Used for generating random strings of gobbledeygook
  class Random
    # Generate a random base62-encoded string
    # @param length (Integer)
    # @return [String] a random selection of base62 digits
    # @raise [ArgumentError] when length < 1
    def self.base62(length = 1)
      length = sanitize_length(length)
      Array.new(length).map {Radix62.encode62(rand(62))}.join
    end

    class << self
      private
      def sanitize_length(length)
        length = length.to_i
        raise ArgumentError.new('length must be at lest 1') if length < 1
        length
      end
    end
  end
end
