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

it "should register a new patient to the system" do
      receptionist = mock("Receptionist")
      receptionist.stub!(:add_patient)
      receptionist.add_patient("jerry","cheng","12 oxford street", "14/12/1985", "3251353", "email", "654321")

      file = mock('file')
      File.stub!(:open).with("filename", "privilege").and_yield(file)
      File.stub!(:write).with("jerry","cheng","12 oxford street", "14/12/1985", "3251353", "email", "654321").and_return("jerry,cheng,12 oxford street,14/12/1985,3251353, email,654321")
      File.write("jerry","cheng","12 oxford street", "14/12/1985", "3251353", "email", "654321")== "jerry,cheng,12 oxford street,14/12/1985,3251353, email,654321"
    end

end