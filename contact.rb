class Contact
  #attr_accessor :first_name, :last_name, :email, :notes
  attr_accessor :notes, :first_name, :last_name, :email
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
    new_contact
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

  def self.delete_all
    @@contacts = []
  end

  def self.find(contact_id)
    @@contacts.find { |contact| contact.id == contact_id }
  end

  def self.search_by_attribute(attribute, value)
    @@contacts.select{|contact| contact.send(attribute.to_sym) == value}
  end


  def update(field, new_value)
    if field == "first_name"
      @first_name = new_value
    elsif field == "last_name"
      @last_name = new_value
    elsif field == "email"
      @email = new_value
    else
      @notes = new_value
    end

  end

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



