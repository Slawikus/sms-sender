require_relative 'test_helper'
require 'application_factory'

describe ApplicationFactory do
  let(:application) { double('application') }

  before do
    allow(Application).to receive(:new).and_return(application)
  end

  describe '::create_application' do
    it 'creates an instance of the application' do
      expect(Application).to receive(:new)

      ApplicationFactory.create_application
    end

    it 'returns an instance of the application' do
      assert_equal application, ApplicationFactory.create_application
    end
  end
end
