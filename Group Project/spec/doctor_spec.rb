require "rspec"
require "../lib/doctor.rb"
require "../lib/patient.rb"
require "csv"
require "md5"

describe "Doctor" do

  let(:person){mock('Person')}
  let(:stdin){mock('STDIN')}

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
  end





  #
  #
  #describe "methods of class doctor" do

  #
  #  it "should display user data" do
  #    CSV_row = ["5002","4325","baidy","diawr","32, oxford road","03/09/2005","0798534355","diae@yahoo.com","therrpist","paswor1"]
  #    puts "----------------------------"
  #    puts "Doctor details :\n"
  #    if not(CSV_row==nil)
  #      puts "\n"
  #      if not(CSV_row[1] == nil)
  #        puts "ID number : " + CSV_row[1]
  #      end
  #      if not(CSV_row[2] == nil)
  #        puts "First name : " + CSV_row[2]
  #      end
  #      if not(CSV_row[3] == nil)
  #        puts "Last name : " + CSV_row[3]
  #      end
  #      if not(CSV_row[4] == nil)
  #        puts "Address : "+ CSV_row[4]
  #      end
  #      if not(CSV_row[5] == nil)
  #        puts "Date of birth : "+ CSV_row[5]
  #      end
  #      if not(CSV_row[6] == nil)
  #        puts "Phone number : "+ CSV_row[6]
  #      end
  #      if not(CSV_row[7] == nil)
  #        puts "Email : "+ CSV_row[7]
  #      end
  #      if not(CSV_row[8] == nil)
  #        puts "Speciality : " + CSV_row[8]
  #      end
  #      if not(CSV_row[9] == nil)
  #        puts "Password : " + CSV_row[9]
  #      end
  #      puts "\n"
  #
  #    else puts "Error! Record not found!"
  #    end
  #    #------------------------------------------------------
  #    #modify details
  #    stdin.stub!(:gets).and_return("2")
  #    input = stdin.gets
  #    stdin.stub!(:gets).and_return("farhard")
  #    changed_value = stdin.gets
  #    if (input == "1")
  #      puts "Changing ID number.. Please type the new value :"
  #      CSV_row[0] = changed_value
  #    elsif (input == "2")
  #      puts "Changing First name.. Please type the new value :"
  #      CSV_row[1] = changed_value
  #    elsif (input == "3")
  #      puts "Changing Last name.. Please type the new value :"
  #      CSV_row[2] = changed_value
  #    elsif (input == "4")
  #      puts "Changing Address.. Please type the new value :"
  #      CSV_row[3] = changed_value
  #    elsif (input == "5")
  #      puts "Changing Date of birth.. Please type the new value :"
  #      CSV_row[4] = changed_value
  #    elsif (input == "6")
  #      puts "Changing Phone number.. Please type the new value :"
  #      CSV_row[5] = changed_value
  #    elsif (input == "7")
  #      puts "Changing Email.. Please type the new value :"
  #      CSV_row[6] = changed_value
  #    elsif (input == "8")
  #      puts "Changing Speciality.. Please type the new value :"
  #      CSV_row[7] = changed_value
  #    elsif (input == "9")
  #      puts "Changing Password.. Please type the new value :"
  #      CSV_row[8] = changed_value
  #    end
  #    puts "updated  record: "
  #    puts CSV_row
  #  end
  #
  #end
  #
  #it "add exam results to patient" do
  #  doctor.stub!(:add_exam_result).with("patient_id", "doctor_id","exam result").and_return("patient_id, doctor_id,exam result")
  #  file = mock('file')
  #  File.stub!(:open).with("patient.csv").and_yield(file)
  #  File.stub!(:write).with("patient_id", "doctor_id","exam result").and_return("patient_id, doctor_id,exam result")
  #  File.write("patient_id", "doctor_id","exam result") == "patient_id, doctor_id,exam result"
  #
  #end
  #
  #it "doctor adds exam results to patient" do
  #
  #  file = File.open("../csv/doctor.csv", "a+")
  #  CSV::Writer.generate(file) do |csv|
  #    csv << ["1002","2000", "Sandra", "Alkivias", "my address you know", "can't tell'", "2222212222", "sandra@hotmail.com", "dentist",MD5.hexdigest("sandra")]
  #  end
  #  file.close
  #
  #  file = File.open("../csv/user.csv", "a+")
  #  CSV::Writer.generate(file) do |csv|
  #    csv << ["1002",MD5.hexdigest("sandra"), "d"]
  #  end
  #  file.close
  #
  #  file = File.open("../csv/patient.csv", "a+")
  #  CSV::Writer.generate(file) do |csv|
  #    csv << ["500", "nil", "Bill", "Gates", "Microsoft", "10/10/1950", "$$$$$$$$$", "Bill@gmail.com", "1212123"]
  #  end
  #  file.close
  #
  #  doctor.add_exam_result(500,1002,"aponeurosis")
  #
  #  csv_contents = CSV.read("../csv/patient.csv")
  #
  #  found_it=nil
  #  csv_contents.each do |row|
  #    if(row[0] == "500" and row[1] == "1002")
  #      found_it= row
  #    end
  #  end
  #  found_it.should ==["500", "1002", "Bill", "Gates", "Microsoft", "10/10/1950", "$$$$$$$$$", "Bill@gmail.com", "1212123","aponeurosis"]
  #end
  #
  #it "doctor mock adds exam results to patient interface" do
  #  doctor.stub!(:add_exam_result_interface)
  #  #patient gives his system id number to doctor
  #  stdin.stub!(:gets).and_return("500")
  #  patient_system_id = stdin.gets
  #  #doctor gives his system id number
  #  stdin.stub!(:gets).and_return("1000")
  #  doctor_system_id = stdin.gets
  #  #doctor diagnosis
  #  stdin.stub!(:gets).and_return("aponeurosis")
  #  diagnosis = stdin.gets
  #  doctor.add_exam_result(patient_system_id,doctor_system_id,diagnosis)
  #end
  #
  #it "should show the patients associated with a doctor" do
  #
  #  file = File.open("../csv/doctor.csv", "a+")
  #  CSV::Writer.generate(file) do |csv|
  #    csv << ["1005","2011", "Alex", "Zorz", "aAddress", "age'", "2222212222", "alex@hotmail.com", "surgeon",MD5.hexdigest("alex")]
  #  end
  #  file.close
  #
  #  file = File.open("../csv/user.csv", "a+")
  #  CSV::Writer.generate(file) do |csv|
  #    csv << ["1005",MD5.hexdigest("alex"), "d"]
  #  end
  #  file.close
  #
  #  file = File.open("../csv/patient.csv", "a+")
  #  CSV::Writer.generate(file) do |csv|
  #    csv << ["505", "1005", "Peter", "Rob", "Company", "18/1/1975", "data", "Peter@gmail.com", "132454657"]
  #  end
  #  file.close
  #
  #  doctor.add_exam_result(505,1005,"liver surgery")
  #
  #  csv_contents = CSV.read("../csv/patient.csv")
  #
  #  patient_found=nil
  #  csv_contents.each do |row|
  #    if(row[0] == "505" and row[1] == "1005")
  #      patient_found= row
  #    end
  #  end
  #  patient_found.should ==["505", "1005", "Peter", "Rob", "Company", "18/1/1975", "data", "Peter@gmail.com", "132454657","liver surgery"]
  #end
  #
  #it "should show the all the patients without a doctor" do
  #  file = File.open("../csv/patient.csv", "a+")
  #  CSV::Writer.generate(file) do |csv|
  #    csv << ["506", "nil", "John", "Smith", "Job", "31/3/1980", "other info", "smith@gmail.com", "5455"]
  #  end
  #  file.close
  #
  #csv_contents = CSV.read("../csv/patient.csv")
  #
  #  patient_without_doctor="nil"
  #  csv_contents.each do |row|
  #    if(not(row[0].nil?) and row[1] == "nil")
  #      patient_without_doctor = row
  #    end
  #  end
  #  patient_without_doctor.should_not == "nil"
  #
  #end

end