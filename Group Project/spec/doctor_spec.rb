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