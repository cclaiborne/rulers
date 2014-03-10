# rulers/lib/rulers.rb
require "rulers/version"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"
require "rulers/controller"

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      elsif env['PATH_INFO'] == '/'
        return [200, {'Content-Type' => 'text/html'}, ["index page"]]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, {'Content-Type' => 'text/html'}, [text]]
    end
  end

  # class Controller
  #   def initialize(env)
  #     @env = env
  #   end

  #   def env
  #     @env
  #   end
  # end
end

