require "rspec"
require '../lib/receptionist.rb'
require '../lib/person.rb'

describe "Receptionist" do
  #it "Receptionist should have a first name" do
  #   receptionist1 = Receptionist.new
  #   receptionist1.firstName = "Farhad"
  #   receptionistfname = receptionist1.firstName
  #
  #   receptionistfname.should == "Farhad"
  # end
  #
  # it "Receptionist should have a last name" do
  #   receptionist1 = Receptionist.new
  #   receptionist1.lastName = "Ghavam"
  #   receptionistlname = receptionist1.lastName
  #
  #   receptionistlname.should == "Ghavam"
  #   end
  #
  # it "Receptionist should have a id" do
  #   receptionist1 = Receptionist.new
  #   receptionist1.id = "1"
  #   receptionistid = receptionist1.id
  #
  #   receptionistid.should == "1"
  # end
  #
  # it "Receptionist should have an username" do
  #   receptionist1 = Receptionist.new
  #   receptionist1.userName = "farh"
  #   receptionistuserName = receptionist1.userName
  #
  #   receptionistuserName.should == "farh"
  # end
  #
  # it "Receptionist should have a password" do
  #   receptionist1 = Receptionist.new
  #   receptionist1.password = "pass"
  #   receptionistpassword = receptionist1.password
  #
  #   receptionistpassword.should == "pass"
  # end
  #
  # it "Receptionist should have an address" do
  #   receptionist1 = Receptionist.new
  #   receptionist1.address = "Manchester"
  #   receptionistaddress = receptionist1.address
  #
  #   receptionistaddress.should == "Manchester"
  # end
  #
  # it "Receptionist should have a phone" do
  #   receptionist1 = Receptionist.new
  #   receptionist1.phoneNumber = "123456789"
  #   receptionistphoneNumber = receptionist1.phoneNumber
  #
  #   receptionistphoneNumber.should == "123456789"
  # end


     it "Receptionist should add a patient" do
     receptionist = Receptionist.new
     receptionist.addPatient("brasidas","dsfds","address", "dateOfBirth", "phoneNumber", "email", "idNumber")
     receptionist.searchByName("brasidas").should == ["nil,nil,brasidas,dsfds,address,dateOfBirth,phoneNumber,email,idNumber"]
   end

end