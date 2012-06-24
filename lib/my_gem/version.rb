
module MyGem
  def self.version
    @version ||= File.read(version_file).chomp
  end

  def self.version_file
    File.expand_path('../../../version.txt', __FILE__)
  end
end
