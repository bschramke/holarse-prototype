module Holarse
  module Mumble

    @@proc_net_tcp = "/proc/net/tcp6"
    @@mumble_port = 64738

    def self.count
      File.readlines(@@proc_net_tcp)[1..-1].select { |line|
	splitline = line.split
	splitline[1].split(":")[1].to_i(16) == @@mumble_port && splitline[3] == "01"
      }.count
    end
  end
end
