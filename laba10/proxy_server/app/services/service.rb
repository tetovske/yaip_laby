# frozen_string_literal: true

# Parent class for all services
class Service
  class << self
    def call(*args, &block)
      new.call(*args, &block)
    end
  end
end
