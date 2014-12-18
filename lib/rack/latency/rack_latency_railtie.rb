require 'pry'
module Rack
  module Latency
    class RackLatencyRailtie < Rails::Railtie
      initializer "rack_latency_railtie.configure_rails_initialization" do |app|
        # only run rack-latency if we are running a server.
        app.middleware.use Rack::Latency::Reporter if Rails.const_defined? 'Server'
      end
    end
  end
end
