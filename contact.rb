class Contact
	attr_accessor :first_name, :last_name, :email, :notes
  attr_reader :id
  @@contacts = []
  @@id = 1000
  def initialize(first_name, last_name, email, notes)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes
    @id = @@id
    @@id +=1
  end


  def self.create(first_name, last_name, email, notes)
    new_contact = new(first_name, last_name, email, notes)
    @@contacts << new_contact
  end

  def delete
    @@contacts.delete_if { |contact| contact.id == self.id }
  end

  def self.all
    @@contacts
  end


  def full_name
    "#{first_name} #{last_name}"
  end


  def self.find(contact_id)
    @@contacts.find { |contact| contact.id == contact_id }
  end


  # def self.delete(id)
  #   self.all.each do |contact|
  #     if id.to_i == contact.id
  #       @@contacts.delete_at(@@contacts.index(contact))
  #     end
  #   end
  # end


  def self.display_element(element)
    case element
    when "first_name"
      @@contacts.each do |contact|
        puts "#{contact.id}: #{contact.first_name}"
      end
    when "last_name"
      @@contacts.each do |contact|
        puts "#{contact.id}: #{contact.last_name}"
      end
    when "email"
      @@contacts.each do |contact|
        puts "#{contact.id}: #{contact.email}"
      end
    when "notes"
      @@contacts.each do |contact|
        puts "#{contact.id}: #{contact.notes}"
      end
    end
  end
end


