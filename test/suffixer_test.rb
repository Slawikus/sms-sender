require_relative 'test_helper'
require 'suffixer'

describe Suffixer do
  describe '#new' do
    it 'raises an error when only 1 part is requested' do
      assert_raises(ArgumentError) do
        Suffixer.new(1)
      end
    end

    it 'raises an error when too many parts are requested' do
      assert_raises(ArgumentError) do
        Suffixer.new(1_000_000_000_000)
      end
    end
  end

  describe '#each' do
    it 'returns suffixes for any number of given parts' do
      total_parts = 3
      suffixer = Suffixer.new(total_parts).to_enum

      expected = [' - Part 1 of 3', ' - Part 2 of 3', ' - Part 3 of 3']

      total_parts.times do |part|
        assert_equal expected[part], suffixer.next
      end
    end
  end
end
