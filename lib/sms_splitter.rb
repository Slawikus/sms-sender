require 'suffixer'

class SmsSplitter
  def self.call(message)
    return [message] if message.length <= 160

    (2..).each do |total_parts|
      message_copy = message.dup

      splits = Suffixer.new(total_parts).map do |suffix|
        message_length_to_extract = 160 - suffix.length - 1
        message_copy.slice!(0..message_length_to_extract) + suffix
      end

      return splits if message_copy.empty?
    end
  end
end
