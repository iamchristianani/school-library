require './check_file'
require 'json'

class Save
  def save_file(arr, filename)
    new_file = CheckFile.new
    json = JSON.generate(data_to_save)
    store_file = new_file.check_file(filename, "w")
    store_file.write(arr)
    store_file.close
  end
end
