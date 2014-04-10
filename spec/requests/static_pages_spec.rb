require 'spec_helper'

describe "StaticPages" do

 subject {page}

  describe "Home page" do
     before{visit  root_path}
   
      it { should have_selector("h1", text: 'Third App') }
      it { should have_selector("title", text: 'Home Page') }
    end
    describe "Help page" do
       beofore {visit  help_path}

     it { should have_selector("h1", text: 'Help Page') }
     it { should have_selector("title", text: 'Help Page') }
    end
    
    describe "About Us page" do
       beofore {visit  help_path}
    
      it{ should have_selector("h1", text: 'About Us') }
      it { should have_selector("title", text: 'About Us') }
    end
    
    describe "Contact page" do
    it { should have_selector("h1", text: 'Contact Us') }
    it { should have_selector("title", text: 'Contact Page') }
   end
it 'should have the correct links' do
  visit root_path
  click_link "About"
  page should have_selector 'title', text: 'About Us')
  click_link "Help"
  page should have_selector 'title', text: 'Help')
  click_link "Contact"
  page should have_selector 'title', text: 'Contact')
  click_link "Home"
  click_link "Sign up now!"
  page should have_selector 'title', text: 'Sign up')
 
end
