# Mocks
module Server
  def self.respond(status, body)
    puts "Server.respond(#{status.inspect}, #{body.inspect})"
  end
end

module Notifier
  def self.call(caller, *args)
    puts("Notifier.call(#{caller.inspect}, #{args.inspect})")
  end
end

# Predefined for inline use
module Resources
  module Products
    module Actions
    end
  end
end

# Models
require './app/resources/products/model.rb'

# Controller Actions
require './app/resources/products/actions/update.rb'