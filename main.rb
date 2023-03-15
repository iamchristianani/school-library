require './menu'
require './app'

def main
  app = App.new
  menu = Menu.new(app)
  app.fetch_all_data
  menu.start
end

main
