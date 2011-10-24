require "rspec"
require "../lib/doctor"

describe "Doctor" do

  doctor = Doctor.new

  context "attributes of class doctor" do
    it "Doctor should have a speciality" do
      doctor.speciality = "pathologist"
      doctor.speciality.should == "pathologist"
    end
  end

  describe "methods of class doctor" do
    doctor = mock ("Doctor")

    it "should register a new doctor to the system" do
      doctor.stub!(:add_doctor)
      doctor.add_doctor(1,2, "John", "James", "27 Cherry Street", "12345678910", "pathologist",  "34m43")

      file = mock('file')
      File.stub!(:open).with("filename", "privilege").and_yield(file)
      File.stub!(:write).with(1,2, "John", "James", "27 Cherry Street", "12345678910", "pathologist",  "34m43").and_return("1,2,John,James,27Cherry Street,12345678910,pathologist,34m43")
      File.write(1,2, "John", "James", "27 Cherry Street", "12345678910", "pathologist",  "34m43") == "1,2,John,James,27Cherry Street,12345678910,pathologist,34m43"
    end
  end

end