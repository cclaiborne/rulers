module Rulers
  class Application
    def get_controller_and_action(env)
      _, cont, action, after = env["PATH_INFO"].split('/', 4)
      cont = cont.capitalize #produces "People"
      cont += "Controller" #produces "PeopleController"
      [Object.const_get(cont), action]
    end
  end
end
