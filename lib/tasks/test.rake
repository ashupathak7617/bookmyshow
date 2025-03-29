namespace :custom do 
	desc "print personal info of user"
	task  :print do #, [:name, :age , :gender ] do |t, args|
		# args.with_defaults(name: "atul", age:"27", gender: "male")
		# puts "hiii #{args.name + " your age is "+ args.age + "and gender is " + args.gender }  "
		# Rails.env = "production"
		
	   Movie.all

		
	end
end