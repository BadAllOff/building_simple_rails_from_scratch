# rulers/lib/rulers.rb
require "rulers/version"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"

module Rulers
  class Application
    def call(env)

      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      elsif env['PATH_INFO'] == '/'
        klass, act = [Object.const_get("HomeController"), 'index']
        controller = klass.new(env)
      else
        klass, act = get_controller_and_action(env)
        controller = klass.new(env)
      end

      begin
        text = controller.send(act)
        [200, {'Content-Type' => 'text/html'}, [text]]
      rescue
        [404, {'Content-Type' => 'text/html'},
         ["404 man! Something went wrong..."]]
      end
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end
    def env
      @env
    end
  end
end