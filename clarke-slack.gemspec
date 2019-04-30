$:.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'clarke/slack/version'

# TODO : Add the rubbot dependencie

Gem::Specification.new do |s|
  s.name        = 'clarke-slack'
  s.version     = Clarke::Slack::VERSION
  s.summary     = 'Clarke-slack is a plugin for clarke to interact with Slack.'
  s.description = 'Slack plugin for Clarke.'

  s.license     = 'MIT'

  s.authors     = ['Applidium', 'Celia Corsin']
  s.email       = 'contact+clarke-slack@fabernovel.com'
  s.homepage    = 'https://github.com/applidium/clarke-slack/'

  s.files       = Dir['CHANGELOG.md', 'CONTRIBUTORS', 'README.md', 'LICENSE', 'lib/**/*']
  s.require_paths = ['lib']

  s.add_dependency 'http'

  s.add_development_dependency 'rack'
  s.add_development_dependency 'test-unit',       '~> 3.0', '>= 3.0.0'
end
