require "rspec"
require '../lib/receptionist.rb'
require '../lib/person.rb'

describe "Receptionist" do

  let (:receptionist){ Receptionist.new }
  patient_file = "../csv/patient.csv"

  it "Receptionist should have a first name" do
    receptionist.firstName = "Farhad"
    receptionistfname = receptionist.firstName

    receptionistfname.should == "Farhad"
  end

  it "Receptionist should have a last name" do
    receptionist.lastName = "Ghavam"
    receptionistlname = receptionist.lastName

    receptionistlname.should == "Ghavam"
  end

  #it "Receptionist should have a id" do
  #
  #   receptionist.id = "1"
  #   receptionistid = receptionist1.id
  #
  #   receptionistid.should == "1"
  #end
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

  it "Receptionist should have an address" do
    receptionist.address = "Manchester"
    receptionistaddress = receptionist.address

    receptionistaddress.should == "Manchester"
  end

  it "Receptionist should have a phone" do
    receptionist.phoneNumber = "123456789"
    receptionistphoneNumber = receptionist.phoneNumber

    receptionistphoneNumber.should == "123456789"
  end

  it "Receptionist should add a patient" do
    receptionist.addPatient("sandra","dsss","address", "dateOfBirth", "phoneNumber", "email", "idNumber")
  end



end