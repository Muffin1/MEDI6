require "rspec"
require "../lib/doctor.rb"

describe "Doctor" do

  doctor = Doctor.new
  let(:doctor){mock('Doctor')}
  context "attributes of class doctor" do
    it "Doctor should have a speciality" do
      doctor.specialization = "pathologist"
      doctor.specialization.should == "pathologist"
    end
  end

  describe "methods of class doctor" do


    it "should register a new doctor to the system" do
      doctor.stub!(:add_doctor)
      doctor.add_doctor(1,2, "John", "James", "27 Cherry Street", "dateofbirth", "12345678910", "doctor@emal.com", "pathologist",  "34m43")

      file = mock('file')
      File.stub!(:open).with("filename", "privilege").and_yield(file)
      File.stub!(:write).with(1,2, "John", "James", "27 Cherry Street", "dateofbirth", "12345678910", "doctor@emal.com", "pathologist",  "34m43").and_return("1,2,John,James,27Cherry Street,dateofbirth,12345678910,doctor@emal.com,pathologist,34m43")
      File.write(1,2, "John", "James", "27 Cherry Street", "dateofbirth", "12345678910", "doctor@emal.com", "pathologist",  "34m43") == "1,2,John,James,27Cherry Street,dateofbirth,12345678910,doctor@emal.com,pathologist,34m43"
    end
  end


end