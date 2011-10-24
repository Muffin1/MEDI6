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

 end
end


