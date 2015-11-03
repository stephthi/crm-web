require 'sinatra'

get '/' do
	@crm_app_name = "My CRM"
	erb :index
end

get '/contacts' do
	"Contacts"
end

get '/contacts/new' do
	"Add a new contact"
end
