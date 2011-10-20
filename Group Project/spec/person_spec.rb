require "rspec"
require 'person.rb'

describe "Person" do

  it "Person should have a first name" do
     person1 = Person.new
     person1.firstName = "aPersonFirstName"
     personfname = person1.firstName

     personfname.should == "aPersonFirstName"
   end

   it "Person should have a last name" do
     person1 = Person.new
     person1.lastName = "aPersonLastName"
     personlname = person1.lastName

     personlname.should == "aPersonLastName"
     end

   it "Person should have a id" do
     person1 = Person.new
     person1.id = "1"
     personid = person1.id

     personid.should == "1"
   end

   it "Person should have an username" do
     person1 = Person.new
     person1.userName = "aUserName"
     personuserName = person1.userName

     personuserName.should == "aUserName"
   end

   it "Person should have a password" do
     person1 = Person.new
     person1.password = "pass"
     personpassword = person1.password

     personpassword.should == "pass"
   end

   it "Person should have an address" do
     person1 = Person.new
     person1.address = "Manchester"
     personaddress = person1.address

     personaddress.should == "Manchester"
   end

   it "Person should have a phone" do
     person1 = Person.new
     person1.phoneNumber = "123456789"
     personphoneNumber = person1.phoneNumber

     personphoneNumber.should == "123456789"
   end

   it "generated_id  should have default value" do
     person1 = Person.new()
     person1.id.should == person1.idGenerator()
   end

end