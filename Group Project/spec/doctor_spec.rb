require "rspec"
require 'doctor.rb'

describe "Doctor" do

  it "Doctor should have a first name" do
    doctor1 = Doctor.new
    doctor1.firstName = "Farhad"
    doctorfname = doctor1.firstName

    doctorfname.should == "Farhad"
  end

  it "Doctor should have a last name" do
    doctor1 = Doctor.new
    doctor1.lastName = "Ghavam"
    doctorlname = doctor1.lastName

    doctorlname.should == "Ghavam"
    end

  it "Doctor should have a id" do
    doctor1 = Doctor.new
    doctor1.id = "1"
    doctorid = doctor1.id

    doctorid.should == "1"
  end

  it "Doctor should have an username" do
    doctor1 = Doctor.new
    doctor1.userName = "farh"
    doctoruserName = doctor1.userName

    doctoruserName.should == "farh"
  end

  it "Doctor should have a password" do
    doctor1 = Doctor.new
    doctor1.password = "pass"
    doctorpassword = doctor1.password

    doctorpassword.should == "pass"
  end

  it "Doctor should have an address" do
    doctor1 = Doctor.new
    doctor1.address = "Manchester"
    doctoraddress = doctor1.address

    doctoraddress.should == "Manchester"
  end

  it "Doctor should have a phone" do
    doctor1 = Doctor.new
    doctor1.phoneNumber = "123456789"
    doctorphoneNumber = doctor1.phoneNumber

    doctorphoneNumber.should == "123456789"
  end

it "Doctor should have a speciality" do
    doctor1 = Doctor.new
    doctor1.speciality = "Heart Surgeon"
    doctorspeciality = doctor1.speciality

    doctorspeciality.should == "Heart Surgeon"
end



end