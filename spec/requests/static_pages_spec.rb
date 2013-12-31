require 'spec_helper'

describe "StaticPages" do

	# let(:base_title) { "Rails Tutorial Sample App"}

	describe "Home page" do
		before { visit root_path }
		subject { page }

		# it "should have the h1 'Sample App'" do
		# 	expect(page).to have_content('Sample App')
		# end
		it { should have_content( 'Sample App' ) }  # equivalent

		# it "should have the base title" do
		# 	expect(page).to have_title(base_title)
		# end
		it { should have_title(full_title('')) }  # equivalent

		# it "should not have a custom page title" do 
		# 	expect(page).not_to have_title('| Home')
		# end
		it { should_not have_title( '| Home' ) }  # equivalent
	end

	describe "Help page" do
		before { visit help_path }
		subject { page }
		
		# it "should have the h1 'Help'" do
		# 	visit help_path
		# 	expect(page).to have_content('Help')
		# end
		it { should have_content('Help') }

		# it "should have the right title" do
		# 	visit help_path
		# 	expect(page).to have_title("#{base_title} | Help")
		# end
		it { should have_title(full_title('Help')) }
	end

	describe "About page" do
		before { visit about_path }
		subject { page }

		# it "should have the h1 'About Us'" do
		# 	visit about_path
		# 	expect(page).to have_content('About Us')
		# end
		it { should have_content('About Us') }

		# it "should have the right title" do
		# 	visit about_path
		# 	expect(page).to have_title("#{base_title} | About")
		# end
		it { should have_title(full_title('About')) }
	end

	describe "Contact page" do
		before { visit contact_path }
		subject { page }
		# it "should have the content 'Contact'" do
		# 	visit contact_path
		# 	expect(page).to have_content('Contact')
		# end
		it { should have_content('Contact') }

		# it "should have the right title" do
		# 	visit contact_path
		# 	expect(page).to have_title("#{base_title} | Contact")
		# end
		it { should have_title(full_title('Contact')) }
	end
end

