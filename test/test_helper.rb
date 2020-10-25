require 'simplecov'

SimpleCov.minimum_coverage 100
SimpleCov.start do
  add_filter '/test/'
end

$LOAD_PATH << File.expand_path('../lib', __dir__)

require 'minitest/autorun'
require 'minitest/pride' if $stdout.tty?
require 'minitest/rspec_mocks'
require 'pry'
require 'logger'
require 'app_logger'

AppLogger.logger = Logger.new($stdout)
AppLogger.logger.level = Logger::WARN

MiniTest::Test.include Minitest::RSpecMocks
