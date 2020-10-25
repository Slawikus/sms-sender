class SmsCarrier
  EmptyMessageError = Class.new(StandardError)
  TooLongMessageError = Class.new(StandardError)

  class << self
    def deliver_message(message)
      raise EmptyMessageError if message.empty?
      raise TooLongMessageError if message_too_long?(message)

      true
    end

    private

    def message_too_long?(message)
      message.length > 160
    end
  end
end
