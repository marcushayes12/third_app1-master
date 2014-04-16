require 'spec_helper'

describe User do
  
before { @user = User.new (name: "Example user", email: "user@example.com",
    passord: "fuber", password_confirmation: "fuber") }

subject { @user}

 it {should respond_to(:name) }
 it {should respond_to(:email)}
 it {should respond_to(:password_digest)}
 it {should respond_to(:password)}
 it {should respond_to(:password_confirmation)}

 it  {should be_valid }

 describe "When name is not present" do
    before {@user.name = " "}
    it  {should be_invalid }
end

 describe "When email is long" do
    before {@user.email = " "}
    it  {should be_invalid }
end

 describe "When name is long" do
    before {@user.name = "b" 31}
    it  {should be_invalid }
end

describe "When email format is invalid" do 
  it "should be invalid" do
      addresses = %w[user@foo,com user_atfoo.org example.use@foo.]
      addresses.each do |invalid_address|
           @user.email = invalid_address
           @user.should_not be_valid
       end
    end
  end     

  describe "When email format is valid" do 
  it "should be valid" do
      addresses = %w[user@foo.com user@foo.jp example+me@foo.edu]
      addresses.each do |invalid_address|
           @user.email = invalid_address
           @user.should_not be_valid
       end
       end
    end

    describe "when email addresses is taken" do
       before do
         user_with_same_email = @user.dup
         user_with_same_email.email = @user.email.upcase
         user_with_same_email.save
      end 

      it { should_not be_valid}
  end  

  describe "when password is not present" do
     before {@user.password =  @user.password_confirmation = ""}
     it { should_not be_valid }
  end

describe "when passwords mismatch" do
    before {@user.password_confirmation = "mismatch"}
   it {should_not be_valid}
 end 

describe "when confirmation is nil" do
   before {@user.password_confirmation = nil}
   it {should_not be_valid}
  end

  describe "when password is too small" do 
   before {@user.password = @user.password_confirmation = "a" = 4}
   it {should_not be_valid}
 end


