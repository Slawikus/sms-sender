require_relative 'test_helper'
require 'sms_carrier'

describe SmsCarrier do
  describe '::deliver_message' do
    it 'raises an error when message is empty' do
      message = ''

      assert_raises(SmsCarrier::EmptyMessageError) do
        SmsCarrier.deliver_message(message)
      end
    end

    it 'raises an error when message is longer than 160 characters' do
      message = 'a' * 161

      assert_raises(SmsCarrier::TooLongMessageError) do
        SmsCarrier.deliver_message(message)
      end
    end

    it 'returns true if message is sent' do
      message = 'Normal message'

      assert SmsCarrier.deliver_message(message)
    end
  end
end
