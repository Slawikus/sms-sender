require_relative 'test_helper'
require 'sms_splitter'

describe SmsSplitter do
  describe '::call' do
    it 'returns original message if it is not longer than 160 characters' do
      message = 'a' * 160

      assert_equal [message], SmsSplitter.call(message)
    end

    it 'returns two messages if message is 161 characters long' do
      message = 'a' * 161

      expected = ["#{'a' * 146} - Part 1 of 2", "#{'a' * 15} - Part 2 of 2"]

      assert_equal expected, SmsSplitter.call(message)
    end

    it 'returns three messages' do
      message = 'a' * 293

      expected = [
        "#{'a' * 146} - Part 1 of 3",
        "#{'a' * 146} - Part 2 of 3",
        "#{'a' * 1} - Part 3 of 3"
      ]

      assert_equal expected, SmsSplitter.call(message)
    end

    it 'returns many messages for large message' do
      message = 'a' * 10_000

      result = SmsSplitter.call(message)

      assert_equal "#{'a' * 145} - Part 1 of 70", result.first
      assert_equal "#{'a' * 55} - Part 70 of 70", result.last
    end
  end
end
