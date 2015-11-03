require_relative 'contact'
require 'sinatra'

get '/' do
	@crm_app_name = "My CRM"
	erb :index
end

get '/contacts' do
	Contact.create("Steph", "Nguyen", "steph@bitmakers.com", "Front-End")
  Contact.create("Lauren", "Herdman", "lauren@bitmakers.com", "Back-End")
  Contact.create("Zain", "Wania", "zain@bitmakers.com", "Full-Stack")

  erb :contacts
end

get '/contacts/new' do
	erb :new_contact
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end