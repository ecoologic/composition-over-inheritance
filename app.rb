require 'date'

# I'm not interested in loading active support at this point
class Date
  def self.current
    today
  end
end

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
  module Discounts
    module Actions
    end
  end
end

# Resources
require './app/resources/products/model.rb'
require './app/resources/products/actions/update.rb'

require './app/resources/discounts/model.rb'
require './app/resources/discounts/actions/create.rb'
