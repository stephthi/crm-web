class Contact
	attr_accessor :first_name, :last_name, :email, :notes
  attr_reader :id
  @@contacts = []
  @@id = 1
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

    puts "New contact added with ID #{new_contact.id}"
  end

  def self.all
    @@contacts
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.find(id)
    self.all.each do |contact|
      if id == contact.id
        return contact
      end
    end
  end

  def self.delete(id)
    self.all.each do |contact|
      if id.to_i == contact.id
        @@contacts.delete_at(@@contacts.index(contact))
      end
    end
  end

  def self.display_element(element)
    case element
    when "firstname"
      @@contacts.each do |contact|
        puts "#{contact.id}: #{contact.first_name}"
      end
    when "lastname"
      @@contacts.each do |contact|
        puts "#{contact.id}: #{contact.last_name}"
      end
    when "email"
      @@contacts.each do |contact|
        puts "#{contact.id}: #{contact.email}"
      end
    end
  end
end
