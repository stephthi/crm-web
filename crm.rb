# require_relative 'contact'
# require 'sinatra'

require 'data_mapper'
require 'sinatra'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

# DataMapper will figure this out to mean 'contacts' table
class Contact
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :notes, String

  # attr_accessor :notes, :first_name, :last_name, :email
  # attr_reader :id
  # @@contacts = []
  # @@id = 1000

  # def initialize(first_name, last_name, email, notes)
  #   @first_name = first_name
  #   @last_name = last_name
  #   @email = email
  #   @notes = notes
  #   @id = @@id
  #   @@id +=1
  # end

end

DataMapper.finalize
DataMapper.auto_upgrade!

# Everything below is Sinatra
  # get '/' do
  #   @crm_app_name = "My CRM"
  #   erb :index
  # end

  # get '/contacts' do
  #   @contacts = Contact.all
  #   erb :contacts
  # end

  # get '/contacts/new' do
  #   erb :new_contact
  # end

  # post '/contacts' do
  #   @contact = Contact.create(params)
  #   if contact.saved?
  #     redirect to ('/contacts')
  #   else
  #     "Handle Error"
  #   end
  # end

  ###############
get '/' do
	@crm_app_name = "My CRM"
	erb :index
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/new' do
	erb :new_contact
end

post '/contacts' do
  contact = Contact.create(
    :first_name => params[:first_name],
    :last_name => params[:last_name],
    :email => params[:email],
    :notes => params[:notes]
  )
  redirect to('/contacts')
end

get "/contacts/1000" do
  @contact = Contact.find(1000)
  erb :show_contact
end

get "/contacts/:id" do
  @contact = Contact.get(params[:id].to_i)
  if @contact
  	erb :show_contact
	else
    raise Sinatra::NotFound
  end
end

get "/contacts/:id/edit" do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put "/contacts/:id" do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    @contact.update(:first_name => params[:first_name],
      :last_name => params[:last_name],
      :email => params[:email],
      :notes => params[:notes])

    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

delete "/contacts/:id" do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    @contact.destroy
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id' do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end