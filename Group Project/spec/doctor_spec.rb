require "rspec"
require 'doctor.rb'

describe "Doctor" do

  doctor = Doctor.new
  context "attributes of class doctor" do
    it "Doctor should have a speciality" do
      doctor.speciality = "pathologist"
      doctor.speciality.should == "pathologist"
    end
  end


end