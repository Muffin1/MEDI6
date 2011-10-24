require "rspec"
require '../lib/receptionist.rb'
require '../lib/person.rb'

describe "Receptionist" do

  let (:receptionist){ Receptionist.new }
  patient_file = "../csv/patient.csv"

  it "Receptionist should have a first name" do
    receptionist.first_name = "Farhad"
    receptionist_fname = receptionist.first_name
    receptionist_fname.should == "Farhad"
  end

  it "Receptionist should have a last name" do
    receptionist.last_name = "Ghavam"
    receptionist_last_name = receptionist.last_name
    receptionist_last_name.should == "Ghavam"
  end

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

end