require "rspec"
require "../lib/person.rb"
require 'csv'
require 'md5'

describe "Person" do
  patient_file = "../csv/patient.csv"

  person = Person.new


  context "initializing 2 most important attributes" do
   it "person should have a first name" do

     person.first_name = "John"
     person_fname = person.first_name
     person_fname.should == "John"
   end

   it "person should have an id number" do

     person.id_number = "886677"
     person_fname = person.id_number
     person_fname.should == "886677"
   end
   end



   it "person.set_privileges should get (unique id number, password, privileges) and add a new user to the login list" do


       person.set_privileges(4000, "doctor_who", "d")

       csv_contents = CSV.read("../csv/user.csv")

       found_it=nil
       csv_contents.each do |row|
        if(row[0] == "4000")
          found_it= row[0]
        end
       end
        found_it.should =="4000"
   end

    it "person.search_by_id should find a row in a file given user's' system id" do

      row = person.search_by_id(5000,"../csv/user.csv")
      row[0].should == '5000'
   end

     it "person.id_generator should generate unique id number > 0" do
      person.id_generator.should > 0

   end



  it "person.change_password should create a new user.scv file and add the new password of thew user" do
      new_password = person.change_password(5000, "admin")
      new_password.should == MD5.hexdigest("admin")
   end

   end


