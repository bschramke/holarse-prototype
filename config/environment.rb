# Load the rails application
require File.expand_path('../application', __FILE__)

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

Holarse::Application.config.mumbleurl = "mumble://www.holarse-linuxgaming.de/Lobby?title=Wurzel&version=1.2.0"
Holarse::Application.config.netfile = "/proc/net/tcp6"
Holarse::Application.config.mumbleport = 64738

Holarse::Application.config.webchaturl = "http://webchat.oftc.net/?nick=HolarseWebnutzer&channels=%23holarse-gaming&uio=d4"

# Initialize the rails application
Holarse::Application.initialize!
