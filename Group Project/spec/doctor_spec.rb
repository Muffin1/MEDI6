require "rspec"
require "../lib/doctor.rb"
require "../lib/patient.rb"
require "csv"
require "md5"

describe "Doctor" do

  context "initialization of doctor attribute" do
    it "Doctor should be able to set a first name" do
      doctor =  Doctor.new
      doctor.first_name = "George"
      doctor.first_name.should == "George"
    end

    it "Doctor should be able to set a speciality" do
      doctor =  Doctor.new
      doctor.specialization = "pathologist"
      doctor.specialization.should == "pathologist"
    end
  end

  it "method set_instance_variables should initialize the attributes of class doctor" do

    doctor = Doctor.new

    doctor.set_instance_variables("5002","2004", "Antony", "Mark", "America 24", "13/8/1980", "23456789", "MAntony@gmail.com", "pathologist",  "Mark80")

    doctor.system_id.should == "5002"
    doctor.id_number.should  =="2004"
    doctor.first_name.should  =="Antony"
    doctor.last_name.should  =="Mark"
    doctor.address.should  =="America 24"
    doctor.date_of_birth.should  ==  "13/8/1980"
    doctor.phone_number.should   ==  "23456789"
    doctor.email.should  == "MAntony@gmail.com"
    doctor.specialization.should  == "pathologist"
    doctor.password.should  ==  "Mark80"

  end


  describe "methods of class doctor that need a csv record to work" do
    doctor = Doctor.new
    doctor_system_id = doctor.id_generator()
    it "add_doctor should add a doctor in the doctor csv file" do
      doctor = Doctor.new

      doctor.add_doctor(doctor_system_id,"2005", "Sandra", "Alkivias", "24 Cherry street", "12/10/1978'", "2222212222", "sandra@hotmail.com", "dentist",MD5.hexdigest("sandra"))

      csv_contents = CSV.read("../csv/doctor.csv")
      found_it=nil
      csv_contents.each do |row|
        if(row[0] == doctor_system_id.to_s and row[1] == "2005")

          found_it = row
        end
      end
      found_it.should ==[doctor_system_id.to_s,"2005", "Sandra", "Alkivias", "24 Cherry street", "12/10/1978'", "2222212222", "sandra@hotmail.com", "dentist",MD5.hexdigest("sandra")]

    end

    it "update_doctor_data should update an existing doctor' s information in the doctor csv file" do
      update_doctor = Doctor.new
      update_doctor.id_number = "2000"
      update_doctor.first_name = "Sandra"
      update_doctor.last_name=  "Alkivias"
      update_doctor.address = "Rochdale road"
      update_doctor.date_of_birth = "31/10/1990"
      update_doctor.phone_number= "078376766"
      update_doctor.email = "sandra@hotmail.com"
      update_doctor.specialization = "dentist"
      update_doctor.password ="sandra"

      doctor.update_doctor_data(update_doctor,doctor_system_id.to_s)

      csv_contents = CSV.read("../csv/doctor.csv")
      found_it=nil
      csv_contents.each do |row|
        if(row[0] == doctor_system_id.to_s and row[1] == "2000")

          found_it = row
        end
      end


      found_it.should == [doctor_system_id.to_s,update_doctor.id_number.to_s, update_doctor.first_name, update_doctor.last_name,update_doctor.address,update_doctor.date_of_birth, update_doctor.phone_number,update_doctor.email,update_doctor.specialization,MD5.hexdigest("sandra")]

    end


    it "doctor adds exam results to patient" do
      #in order to check the association of a patient and a doctor we create a new patient
      patient = Patient.new
      patient_system_id = patient.id_generator()
      patient.add_patient(patient_system_id.to_s,"nil", "Bill", "Gates", "Microsoft 98", "10/10/1950", "234567788", "Bill@gmail.com", "1212123")

      #we stub those already implemented interface methods in order to check the function add_exam_result
      doctor.stub!(:display_error_handling_information)
      doctor.stub!(:display_diagnosis_information)

      doctor.add_exam_result(patient_system_id,doctor_system_id,"adding a bridge")

      csv_contents = CSV.read("../csv/patient.csv")
      found_it=nil
      csv_contents.each do |row|
        if(row[0] == patient_system_id.to_s and row[1] == doctor_system_id.to_s)
          found_it= row
        end
      end
      found_it.should ==[patient_system_id.to_s, doctor_system_id.to_s, "Bill", "Gates", "Microsoft 98", "10/10/1950", "234567788", "Bill@gmail.com", "1212123","adding a bridge"]
    end


    it "get_all_unassociated_patients should return the all the patients that are registered in the system
        but never have visited any doctor" do
      #in order to check create a new patient
      patient = Patient.new
      patient_system_id = patient.id_generator()
      patient.add_patient(patient_system_id.to_s,"nil", "Bill", "Gates", "Microsoft 98", "10/10/1950", "234567788", "Bill@gmail.com", "1212123")

     patients = doctor.get_all_unassociated_patients()
        patients.each do |row|
          row[1].should == "nil"
        end
    end

    it "get_all_associated_patients should return the all the patients that are registered in the system
        and have visited any doctor attlist once" do

     patients = doctor.get_all_associated_patients(doctor_system_id)
        patients.each do |row|
          row[1].should_not == "nil"
        end
    end
  end


end