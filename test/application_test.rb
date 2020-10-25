require_relative 'test_helper'
require 'application'

describe Application do
  let(:application) { Application.new }

  describe '#run' do
    it 'returns the text message' do
      assert_equal 'Running the app', application.run
    end
  end
end
