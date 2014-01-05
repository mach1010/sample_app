require 'spec_helper'

describe User do
# setup
	before do
		@user = User.new(name: 'Example User', email: "user@example.com")
	end

	subject { @user }

# verify existence of name and email (not strictly necessary)
	it { should respond_to(:name) }
	# same thing below: 
	it "should respond to name" do
		expect(@user).to respond_to(:name)
	end
	it { should respond_to(:email) }

	it { should be_valid }

# validate name and email presence
	describe "when name is not present" do
		before { @user.name = '' }
		it { should_not be_valid }
	end

	describe "when email is not present" do
		before { @user.email = '' }
		it { should_not be_valid }
	end

# validate name max length
	describe "when name is too long" do
		before { @user.name = "a" * 51 }
		it { should_not be_valid }
	end

# validate email format
	describe "when email format is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@bas.cn]
			addresses.each do |valid_address|
				@user.email = valid_address
				expect(@user).to be_valid
			end
		end
	end
# validate email uniqueness
	describe "when email is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end

		it { should_not be_valid }
	end
end
