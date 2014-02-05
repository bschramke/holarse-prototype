module Holarse
  module Mumble

    def self.count
      File.readlines(Holarse::Application.config.netfile)[1..-1].select { |line|
	splitline = line.split
	splitline[1].split(":")[1].to_i(16) == Holarse::Application.config.mumbleport && splitline[3] == "01"
      }.count
    end
  end
end
