require "rspec"
require "../lib/doctor.rb"
require "csv"
require "md5"

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

    file = File.open("../csv/doctor.csv", "a+")
    CSV::Writer.generate(file) do |csv|
      csv << ["1000","2000", "Sandra", "Alkivias", "my address you know", "can't tell'", "2222212222", "sandra@hotmail.com", "dentist",MD5.hexdigest("sandra")]
    end
    file.close

      doctor1.id_number = "2000"
      doctor1.first_name = "Sandra"
      doctor1.last_name=  "Alkivias"
      doctor1.address = "Oxford Str"
      doctor1.date_of_birth = "18/10/1980"
      doctor1.phone_number= "6984573957"
      doctor1.email = "sandra@hotmail.com"
      doctor1.specialization = "Dental"
      doctor1.password="sandra"

      new_data = ["1000",doctor1.id_number, doctor1.first_name, doctor1.last_name,doctor1.address,doctor1.date_of_birth, doctor1.phone_number,doctor1.email,doctor1.specialization,doctor1.password]

      doctor.update_doctor_data(doctor1, 1000)[2].should ==new_data

    end
  end


  it "add exam results to patient" do
    doctor.stub!(:add_exam_result).with("patient_id", "doctor_id","exam result").and_return("patient_id, doctor_id,exam result")
    file = mock('file')
    File.stub!(:open).with("patient.csv").and_yield(file)
    File.stub!(:write).with("patient_id", "doctor_id","exam result").and_return("patient_id, doctor_id,exam result")
    File.write("patient_id", "doctor_id","exam result") == "patient_id, doctor_id,exam result"

  end

   it "doctor adds exam results to patient" do
    file = File.open("../csv/doctor.csv", "a+")
    CSV::Writer.generate(file) do |csv|
      csv << ["1000","2000", "Sandra", "Alkivias", "my address you know", "can't tell'", "2222212222", "sandra@hotmail.com", "dentist",MD5.hexdigest("sandra")]
    end
    file.close

    file = File.open("../csv/patient.csv", "a+")
    CSV::Writer.generate(file) do |csv|
    csv << ["500", "nil", "Bill", "Gates", "Microsoft", "10/10/1950", "$$$$$$$$$", "Bill@gmail.com", "1212123"]
    end
    file.close

    doctor.add_exam_result(500,1000,"aponeurosis")

    csv_contents = CSV.read("../csv/patient.csv")

    found_it=nil
    csv_contents.each do |row|
      if(row[0] == "500")
        found_it= row[0]
      end
    end
    found_it.should =="500"
   end


end