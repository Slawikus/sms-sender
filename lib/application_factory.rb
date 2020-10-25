require 'application'

class ApplicationFactory
  class << self
    def create_application
      Application.new
    end
  end
end
