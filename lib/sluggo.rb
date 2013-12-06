require 'radix62'
require 'sluggo/version'
require 'sluggo/random'

# Sluggo generates strings that look like tokens
module Sluggo
    # Repeatedly attempt to generate a unique token, where uniqueness is
    # determined by a provided code block. This may not actually end up
    # generating a unique token, but possibly just a rare token.
    # @param options [Hash]
    # @option options [Integer] :length (6) the length of the token to return
    # @option options [Integer] :chances (100) the number of tries before
    #   giving up on uniqueness
    # @param is_unique [Proc] a proc that returns true if the supplied
    #   |slug| is unique
    # @raise [ArgumentError] if no block is given
    # @raise [ArgumentError] if chances are provided, but is < 1
    # @raise [ArgumentError] if length is provided, but is < 1
    def self.rare(options = {}, &is_unique)
      length, chances, is_unique = sanitize_options(
        options.merge({:is_unique => is_unique})
      )

      while (chances -= 1) >= 0 do
        current_slug = Random.base62(length)
        break if is_unique.call(current_slug)
      end
      current_slug
    end

  class << self
    private
    def sanitize_options(options = {})
      if options[:is_unique].nil?
        raise ArgumentError.new(rare_error_message(:is_unique))
      end

      options[:chances].tap do |chances|
        unless chances.nil?
          raise ArgumentError.new(rare_error_message(:chances, chances)) if chances < 1
        end
      end

      [options[:length] || 6, options[:chances] || 100, options[:is_unique]]
    end

    def rare_error_message(option, value = nil)
      case option
      when :is_unique
        'You must provide a block to determine uniqueness'
      when :chances
        "You must allow at least one chance (chances: #{value})"
      end
    end
  end
end
