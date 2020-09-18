require 'sinatra/base'
require 'sinatra'
require 'rake'

require ::File.expand_path('../app',  __FILE__)

set :app_file, __FILE__

configure do
	enable :sessions
	set :session_secret, SecureRandom.hex(64)
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

run Sinatra::Application
