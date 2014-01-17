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

	def find_contact(id) #remember id is not the array index

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

		puts "\nEnter id of contact to be changed"
		id = gets.chomp.to_i

		puts "\nWhat do you want to change?"
		contact_attribute = gets.chomp

		case contact_attribute

		when "name"
			puts "\nNew name?"
			find_contact(id).name = gets.chomp

		when "age"
			puts "\nNew age?"
			find_contact(id).age = gets.chomp.to_i

		when "email"
			puts "\nNew email?"
			find_contact(id).email = gets.chomp
		end

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

david = rolo.new_contact("David", 30, "dvd.yip@gmail.com")
jen = rolo.new_contact("Jen", 35, "jenifle@hotmail.com")
cait = rolo.new_contact("Cait", 25, "cait@cait.com")

rolo.modify_contact












	# #reader
	# def name
	# 	@name
	# end

	# #writer
	# def name(new_name)
	# 	@name = new_name
	# end

	#more classes are needed - i.e.: the runner


