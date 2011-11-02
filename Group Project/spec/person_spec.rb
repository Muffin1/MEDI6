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

    it "person.id_generator should return a unique id number" do

     person.stub!(:id_generator).and_return(5000)
     person.id_generator.should == 5000

     end


     it "person.set_privileges should get (unique id number, password, privileges) and add a new user to the login list" do

       person.stub!(:set_privileges).with(1, "5000", "d")
       person.set_privileges(1, "5000", "d")
       file = mock('file')
       File.stub!(:open).with("filename", "privilege").and_yield(file)
       File.stub!(:write).with(1, "5000", "d").and_return("1,5000,d")
       File.write(1,"5000","d") == "1,5000,d"

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
      person.stub!(:search_by_id).with(5000,"filename").and_return("user_row")
      person.search_by_id(5000,"filename").should ==  "user_row"
   end

    it "person.search_by_id should find a row in a file given user's' system id" do

      row = person.search_by_id(5000,"../csv/user.csv")
      row[0].should == '5000'
   end

     it "person.id_generator should generate unique id number > 0" do
      person.id_generator.should > 0

   end

     it "person.change_password should change the password of the user" do
      person.stub!(:change_password).with(5000, "new password").and_return("new password encrypted")
      new_encrypted_password = person.change_password(5000, "new password")
      file = mock('file')
      File.stub!(:open).with("user.csv").and_yield(file)
      File.stub!(:write).with(5000,new_encrypted_password, "privilege").and_return("5000,new password encrypted,privilege")
      File.write(5000,new_encrypted_password, "privilege") == "5000,new password encrypted,privilege"

     end

  it "person.change_password should create a new user.scv file and add the new password of thew user" do
      new_password = person.change_password(5000, "admin")
      new_password.should == MD5.hexdigest("admin")
   end

   end


