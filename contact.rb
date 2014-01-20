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