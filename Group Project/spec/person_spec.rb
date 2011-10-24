require "rspec"
require "person.rb"
require 'csv'

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


 end



