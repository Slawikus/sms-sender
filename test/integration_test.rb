require_relative 'test_helper'

describe 'IntegrationTest' do
  it 'does not throw an error' do
    assert load 'bin/start'
  end
end
