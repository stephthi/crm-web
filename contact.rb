# # require 'data_mapper'
# # require 'sinatra'
# # DataMapper.setup(:default, 'sqlite:crm_development.db')

# # # DataMapper will figure this out to mean 'contacts' table
# # class Contact
# #   include DataMapper::Resource

# #   property :id, Serial
# #   property :first_name, String
# #   property :last_name, String
# #   property :email, String
# #   property :notes, Text
# # end

# # DataMapper.auto_upgrade!

# # # Everything below is Sinatra
# #   get '/' do
# #     @crm_app_name = "My CRM"
# #     erb :index
# #   end

# #   get '/contacts' do
# #     @contacts = Contact.all
# #     erb :contacts
# #   end

# #   get '/contacts/new' do
# #     erb :new_contact
# #   end

# #   post '/contacts' do
# #     @contact = Contact.create(params)
# #     if contact.saved?
# #       redirect to ('/contacts')
# #     else
# #       "Handle Error"
# #     end
# #   end



# class Contact
#   #attr_accessor :first_name, :last_name, :email, :notes
#   attr_accessor :notes, :first_name, :last_name, :email
#   attr_reader :id
#   @@contacts = []
#   @@id = 1000

#   def initialize(first_name, last_name, email, notes)
#     @first_name = first_name
#     @last_name = last_name
#     @email = email
#     @notes = notes
#     @id = @@id
#     @@id +=1
#   end


#   def self.create(first_name, last_name, email, notes)
#     new_contact = new(first_name, last_name, email, notes)
#     @@contacts << new_contact
#     new_contact
#   end

#   def delete
#     @@contacts.delete_if { |contact| contact.id == self.id }
#   end

#   def self.all
#     @@contacts
#   end


#   def full_name
#     "#{first_name} #{last_name}"
#   end

#   def self.delete_all
#     @@contacts = []
#   end

#   def self.find(contact_id)
#     @@contacts.find { |contact| contact.id == contact_id }
#   end

#   def self.search_by_attribute(attribute, value)
#     @@contacts.select{|contact| contact.send(attribute.to_sym) == value}
#   end


#   def update(field, new_value)
#     if field == "first_name"
#       @first_name = new_value
#     elsif field == "last_name"
#       @last_name = new_value
#     elsif field == "email"
#       @email = new_value
#     else
#       @notes = new_value
#     end

#   end

#   def self.display_element(element)
#     case element
#     when "first_name"
#       @@contacts.each do |contact|
#         puts "#{contact.id}: #{contact.first_name}"
#       end
#     when "last_name"
#       @@contacts.each do |contact|
#         puts "#{contact.id}: #{contact.last_name}"
#       end
#     when "email"
#       @@contacts.each do |contact|
#         puts "#{contact.id}: #{contact.email}"
#       end
#     when "notes"
#       @@contacts.each do |contact|
#         puts "#{contact.id}: #{contact.notes}"
#       end
#     end
#   end
# end



