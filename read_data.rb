require 'json'

class ReadData
  def read_data(file)
    if File.exist?(file)
      file_check = File.open(file)
      file_data = file_check.read
      file_check.close
      ruby_data = JSON.parse(file_data)
    else
      return []
    end
  end
end

# read_file = ReadData.new
# puts read_file.read_data("people.json")