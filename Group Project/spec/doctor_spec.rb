require "rspec"
require "../lib/doctor.rb"
require "csv"

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

  describe "methods of class doctor" do

    it "should update doctor data" do
      doctor1 = Doctor.new

      doctor1.id_number = "xcvbynui"
      doctor1.first_name = "onis"
      doctor1.last_name=  "Ghavam"
      doctor1.address = "Oxford Str"
      doctor1.date_of_birth = "18/10/1980"
      doctor1.phone_number= "6984573957"
      doctor1.email = "diawbaidy.com"
      doctor1.specialization = "Dental"
      doctor1.password="baiay222"

      new_data = ["5008",doctor1.id_number, doctor1.first_name, doctor1.last_name,doctor1.address,doctor1.date_of_birth, doctor1.phone_number,doctor1.email,doctor1.specialization,doctor1.password]

      doctor.update_doctor_data(doctor1)[2].should ==new_data

    end
  end


end