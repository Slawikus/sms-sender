require_relative 'test_helper'

describe 'IntegrationTest' do
  it 'successfully returns' do
    assert load 'bin/start'
  end
end
