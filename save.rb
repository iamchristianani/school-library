require './check_file'
require 'json'

class Save
  def save_file(arr, filename)
    new_file = CheckFile.new
    json = JSON.generate(arr)
    store_file = new_file.check_file(filename, 'w')
    store_file.write(json)
    store_file.close
  end
end
