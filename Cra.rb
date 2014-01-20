require_relative 'Contact.rb'
require_relative 'Rolodex.rb'

class CRA

#instance methods vs class methods
#however this object doesn't need to store data
#so you can use a class method (self)
#class methods are accessible without needing an instance of class CRA

	def self.print_main_menu
    puts "\n** Contact list **"
	  puts "[1] Add a new contact"
	  puts "[2] Modify an existing contact"
	  puts "[3] Delete a contact"
	  puts "[4] Display all the contacts"
	  puts "[5] Search contacts"
	  puts "[6] Exit"
	  puts "Enter a number: "
	end

	def self.main_menu #this is no longer an instance method and cannot be called by instances of clas CRA

    @current_rolo = Rolodex.new

    user_choice = 0

    while user_choice != 6
    print_main_menu
	  user_choice = gets.to_i
	  go_run(user_choice)
    end
    puts "\nReturning to command line."
	end

  def self.go_run(user_choice)

  	case user_choice

  	when 1
  		@current_rolo.acquire_contact

  	when 2
      @current_rolo.modify_contact

  	when 3
      @current_rolo.delete_contact

  	when 4
  		@current_rolo.list_contacts

  	when 5
  		@current_rolo.search_contacts

  	end

  end

end

puts "\e[H\e[2J"
CRA.main_menu