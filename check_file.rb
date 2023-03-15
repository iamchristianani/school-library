class CheckFile
  def check_file(file, mode)
    return File.open(file, mode) if File.exist?(file)

    File.new(file, mode)
  end
end
