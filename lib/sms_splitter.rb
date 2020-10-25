require 'suffixer'

class SmsSplitter
  MAX_SMS_LENGTH = 160

  def initialize(message)
    @message = message
  end

  def call
    return [message] if message_fits_into_one_sms?

    (2..).each do |total_parts|
      message_copy = message.dup
      Suffixer.new(total_parts)
              .map { |suffix| extract_message.call(suffix, message_copy) }
              .tap { |splits| return splits if message_copy.empty? }
    end
  end

  def self.call(message)
    new(message).call
  end

  private

  attr_reader :message

  def message_fits_into_one_sms?
    message.length <= MAX_SMS_LENGTH
  end

  def extract_message
    lambda do |suffix, message_copy|
      message_length_to_extract = MAX_SMS_LENGTH - suffix.length - 1
      message_copy.slice!(0..message_length_to_extract) + suffix
    end
  end
end
