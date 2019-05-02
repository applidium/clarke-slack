require 'clarke'
require 'http'

# Version
require 'clarke/slack/version'

# Models
require 'clarke/slack/events/base'
require 'clarke/slack/events/text_message'
require 'clarke/slack/events/text_command'
require 'clarke/slack/events/button'

# Ressources
require 'clarke/slack/config'
require 'clarke/slack/parser'

require 'clarke/slack/action'
require 'clarke/slack/user'
