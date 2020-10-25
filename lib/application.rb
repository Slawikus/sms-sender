require 'sms_splitter'
require 'sms_carrier'

class Application
  MESSAGE_TO_SEND = 'Alice was beginning to get very tired of sitting by her '\
      'sister on the bank, and of having nothing to do: once or twice she'\
      ' had peeped into the book her sister was reading, but it had no '\
      'pictures or conversations in it, “and what is the use of a book,”'\
      ' thought Alice “without pictures or conversations?”So she was '\
      'considering in her own mind (as well as she could, for the hot day'\
      ' made her feel very sleepy and stupid), whether the pleasure of'\
      ' making a daisy-chain would be worth the trouble of getting up and'\
      ' picking the daisies, when suddenly a White Rabbit with pink eyes'\
      ' ran close by her.'.freeze

  def run
    SmsSplitter.call(MESSAGE_TO_SEND).each do |message|
      SmsCarrier.deliver_message(message)
      Kernel.puts(message)
    end
    0
  end
end
