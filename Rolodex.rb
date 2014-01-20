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
		puts "\nContacts currently stored"
		puts "id \tname \t\tage \temail"
		@contacts.each do |c|
			puts "#{c.id} \t#{c.name} \t\t#{c.age} \t#{c.email}"
		end
	end

	def modify_contact
		list_contacts

		id = acquire_id
		puts "\n** CHANGE CONTACT **"
		puts "\nWhat do you want to change? (name / age / email)"
		contact_attribute = gets.chomp

		case contact_attribute

		when "name"
			puts "\nNew name? Currently #{contact_object(id).name}"
			contact_object(id).name = gets.chomp

		when "age"
			puts "\nNew age?"
			contact_object(id).age = gets.chomp.to_i

		when "email"
			puts "\nNew email? Currently #{contact_object(id).email}"
			contact_object(id).email = gets.chomp
		end

		puts "\n** Contact changed - RESULT **"
		list_contacts
	end

	def acquire_id
		puts "\nEnter contact id:"
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

		puts "New contact created."

	end

	def delete_contact
		puts "\n** DELETE CONTACT **"
		list_contacts

		id = acquire_id
		contact_object(id)

		@contacts.delete_at(contact_index(id))
		@contacts.compact

		puts "\n** Contact deleted - RESULT **"
		list_contacts

	end

	def search_contacts

		result_ary = []


		puts "Search term?"
		term = gets.chomp

		@contacts.each do |c|
			if (c.name.scan(term).empty? == false || c.email.scan(term).empty? == false || c.age.to_s.scan(term).empty? == false)
				result_ary << c
			end
		end

		puts "For search term '#{term}' the following records were found:"
		puts "id \tname \t\tage \temail"

		result_ary.each do |r|
		puts "#{r.id} \t#{r.name} \t\t#{r.age} \t#{r.email}"

		end
	end
end

	# #reader
	# def name
	# 	@name
	# end

	# #writer
	# def name(new_name)
	# 	@name = new_name
	# end

	#more classes are needed - i.e.: the runner


