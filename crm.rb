require_relative 'contact'
require 'sinatra'

get '/' do
	@crm_app_name = "My CRM"
	erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
	erb :new_contact
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:notes])
  redirect to('/contacts')
end

get "/contacts/1000" do
  @contact = Contact.find(1000)
  erb :show_contact
end

get "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
  	erb :show_contact
	else
    raise Sinatra::NotFound
  end
end

get "/contacts/:id/edit" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.notes = params[:notes]

    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

delete "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end