class Rolodex

	#class method example

	# def self.create
	# 	rolodex = Rolodex.new
	# 	contact = Contact.new(1001, "dummy", 100, "dummy.com")
	# 	rolodex
	# end

	def initialize
		@contacts = []
		@id = 1000
	end

	def new_contact (name, age, email)
		@id += 1 #not useful to return this
		contact = Contact.new(@id, name, age, email)
		@contacts << Contact.new(@id, name, age, email)
		contact #should return the contact that was just created
		#or @contacts[-1] (returns last value in array)
	end

	def contact_object(id) #remember id is not the array index

		@contacts.each do |c| #for each array element (e.g.: contact1, contact2 ...)
			return c if c.id == id #explicit return (stops search after finding.) returns the whole empty array if emptys
		end

	end

	def list_contacts
		puts "Contacts currently stored"
		puts "id \tname \tage \temail"
		@contacts.each do |c|
			puts "#{c.id} \t#{c.name} \t#{c.age} \t#{c.email}"
		end
	end

	def modify_contact
		list_contacts

		id = acquire_id

		puts "\nWhat do you want to change?"
		contact_attribute = gets.chomp

		case contact_attribute

		when "name"
			puts "\nNew name?"
			contact_object(id).name = gets.chomp

		when "age"
			puts "\nNew age?"
			contact_object(id).age = gets.chomp.to_i

		when "email"
			puts "\nNew email?"
			contact_object(id).email = gets.chomp
		end

		list_contacts
	end

	def acquire_id
		puts "\nEnter id of contact to be modified or deleted"
		id = gets.chomp.to_i
	end

	def contact_index(id)
			counter = 0
			@contacts.each do |c| #for each array element (e.g.: contact1, contact2 ...)

				if c.id == id
					return counter
				end
				counter += 1
			end

			counter
	end

	def acquire_contact

		puts "Name?"
		name = gets.chomp
		puts "Age?"
		age = gets.chomp.to_i
		puts "Email?"
		email = gets.chomp

		new_contact(name,age,email)

	end

	def delete_contact
		list_contacts
		id = acquire_id
		contact_object(id)

		@contacts.delete_at(contact_index(id))
		@contacts.compact
		list_contacts

	end

end

class Contact

	attr_accessor :name, :age, :email
	attr_reader :id

	#symbol name gets turned into an instance name

	def initialize (id, name, age, email)
		@id = id # not really necessasry since will be assigned by Rolodex
		@name = name
		@age = age
		@email = email
	end

end


rolo = Rolodex.new
david = rolo.new_contact("dave", 40, "dvd.yip@")
rolo.acquire_contact
rolo.acquire_contact
rolo.acquire_contact
rolo.list_contacts
#rolo.modify_contact
rolo.delete_contact

	# #reader
	# def name
	# 	@name
	# end

	# #writer
	# def name(new_name)
	# 	@name = new_name
	# end

	#more classes are needed - i.e.: the runner


