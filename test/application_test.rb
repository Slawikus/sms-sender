require_relative 'test_helper'
require 'application'

describe Application do
  let(:application) { Application.new }
  let(:message_1) { 'message1' }
  let(:message_2) { 'message2' }
  let(:splitted_messages) { [message_1, message_2] }

  before do
    allow(SmsSplitter).to receive(:call).and_return(splitted_messages)
    allow(SmsCarrier).to receive(:deliver_message)
  end

  describe '#run' do
    it 'calls SMS Splitter with the given message' do
      expect(SmsSplitter).to receive(:call).with(Application::MESSAGE_TO_SEND)

      application.run
    end

    it 'delivers splitted messages over SMS Carrier' do
      expect(SmsCarrier).to receive(:deliver_message).with(message_1)
      expect(SmsCarrier).to receive(:deliver_message).with(message_2)

      application.run
    end

    it 'prints out splitted messages' do
      expect(Kernel).to receive(:puts).with(message_1)
      expect(Kernel).to receive(:puts).with(message_2)

      application.run
    end

    it 'returns zero' do
      assert_equal 0, application.run
    end
  end
end
