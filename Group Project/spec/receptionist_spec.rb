require "rspec"
require '../lib/receptionist.rb'
require '../lib/person.rb'

describe "Receptionist" do

  let (:receptionist){ Receptionist.new }
  patient_file = "../csv/patient.csv"

 # person = mock('Person')
 # it "should check if firstname has a value" do
 #   first_name.stub!(:first_name).and_return("alex")
 #   subject.add(first_name)
 #
 #   subject.should == "alex"
 # end

  it "Receptionist should have a first name" do
    receptionist.first_name = "Farhad"
    receptionist_fname = receptionist.first_name

    receptionist_fname.should == "Farhad"
  end

  it "Receptionist should have a last name" do
    receptionist.last_name = "Ghavam"
    receptionistlname = receptionist.last_name

    receptionistlname.should == "Ghavam"
  end
  #
  #it "Receptionist should have a id" do
  #
  #   receptionist.id_number = "1"
  #   receptionistid = receptionist.id_number
  #
  #   receptionistid.should == "1"
  #end
  #
  # it "Receptionist should have an username" do
  #   receptionist.userName = "farh"
  #   receptionistuserName = receptionist.userName
  #
  #   receptionistuserName.should == "farh"
  #end
  #
  #it "Receptionist should have a password" do
  #   receptionist.password = "pass"
  #   receptionistpassword = receptionist.password
  #
  #   receptionistpassword.should == "pass"
  #end
  #
  it "Receptionist should have an address" do
    receptionist.address = "Manchester"
    receptionist_address = receptionist.address

    receptionist_address.should == "Manchester"
  end

  it "Receptionist should have a phone" do
    receptionist.phone_number = "123456789"
    phone_number = receptionist.phone_number

    receptionist.phone_number.should == "123456789"
  end

  it "Receptionist should add a patient" do
    receptionist.add_patient("sandra","dsss","address", "dateOfBirth", "phoneNumber", "email", "idNumber")
  end

  it "Receptionist should be able to search for a patient by id" do
    result = receptionist.search_by_id( "5058",patient_file)
    result.should_not == nil
  end



end