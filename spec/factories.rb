FactoryGirl.define do 
	factory :user do
		name 		"Mach1010"
		email 		"me@mail.com"
		password 	"foobar"
		password_confirmation "foobar"
	end
end