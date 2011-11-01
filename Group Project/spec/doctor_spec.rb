require "rspec"
require "../lib/doctor.rb"
require "csv"
require "md5"

describe "Doctor" do
  let(:stdin){mock('stdin')}

  doctor = Doctor.new
  let(:doctor){mock('Doctor')}
    let(:stdin){mock('STDIN')}

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
    file = File.open("../csv/doctor.csv", "w+")
    CSV::Writer.generate(file) do |csv|
      csv << ["1001","2000", "Sandra", "Alkivias", "my address you know", "can't tell'", "2222212222", "sandra@hotmail.com", "dentist",MD5.hexdigest("sandra")]
    end
    file.close

    file = File.open("../csv/user.csv", "w+")
    CSV::Writer.generate(file) do |csv|
     csv << ["1001",MD5.hexdigest("sandra"), "d"]
    end
    file.close

    it "should update doctor data" do
      doctor1 = Doctor.new
      doctor1.id_number = "2000"
      doctor1.first_name = "Sandra"
      doctor1.last_name=  "Alkivias"
      doctor1.address = "rochdale road"
      doctor1.date_of_birth = "3123/123/123"
      doctor1.phone_number= "078376766"
      doctor1.email = "sandra@hotmail.com"
      doctor1.specialization = "dentist"
      doctor1.password="sandra"

      doctor.update_doctor_data(doctor1,"1001").should ==  ["1001",doctor1.id_number, doctor1.first_name, doctor1.last_name,doctor1.address,doctor1.date_of_birth, doctor1.phone_number,doctor1.email,doctor1.specialization,MD5.hexdigest("sandra")]

    end
  end

    describe "methods of class doctor" do
    it "should get the UI input" do
        doctor.display_modify_options().should_not == nil
    end

    it "should display user data" do
     CSV_row = ["5002","4325","baidy","diawr","32, oxford road","03/09/2005","0798534355","diae@yahoo.com","therrpist","paswor1"]
       puts "----------------------------"
    puts "Doctor details :\n"
    if not(CSV_row==nil)
      puts "\n"
      if not(CSV_row[1] == nil)
        puts "ID number : " + CSV_row[1]
      end
      if not(CSV_row[2] == nil)
        puts "First name : " + CSV_row[2]
      end
      if not(CSV_row[3] == nil)
        puts "Last name : " + CSV_row[3]
      end
      if not(CSV_row[4] == nil)
        puts "Address : "+ CSV_row[4]
      end
      if not(CSV_row[5] == nil)
        puts "Date of birth : "+ CSV_row[5]
      end
      if not(CSV_row[6] == nil)
        puts "Phone number : "+ CSV_row[6]
      end
      if not(CSV_row[7] == nil)
        puts "Email : "+ CSV_row[7]
      end
      if not(CSV_row[8] == nil)
        puts "Speciality : " + CSV_row[8]
      end
      if not(CSV_row[9] == nil)
        puts "Password : " + CSV_row[9]
      end
      puts "\n"

    else puts "Error! Record not found!"
    end
      #------------------------------------------------------
      #modify details
      stdin.stub!(:gets).and_return("2")
        input = stdin.gets
      stdin.stub!(:gets).and_return("farhard")
        changed_value = stdin.gets
       if (input == "1")
      puts "Changing ID number.. Please type the new value :"
      CSV_row[0] = changed_value
    elsif (input == "2")
      puts "Changing First name.. Please type the new value :"
      CSV_row[1] = changed_value
    elsif (input == "3")
      puts "Changing Last name.. Please type the new value :"
      CSV_row[2] = changed_value
    elsif (input == "4")
      puts "Changing Address.. Please type the new value :"
      CSV_row[3] = changed_value
    elsif (input == "5")
      puts "Changing Date of birth.. Please type the new value :"
     CSV_row[4] = changed_value
    elsif (input == "6")
      puts "Changing Phone number.. Please type the new value :"
      CSV_row[5] = changed_value
    elsif (input == "7")
      puts "Changing Email.. Please type the new value :"
      CSV_row[6] = changed_value
    elsif (input == "8")
      puts "Changing Speciality.. Please type the new value :"
     CSV_row[7] = changed_value
    elsif (input == "9")
      puts "Changing Password.. Please type the new value :"
         CSV_row[8] = changed_value
    end
      puts "updated  record: "
      puts CSV_row
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
      csv << ["1002","2000", "Sandra", "Alkivias", "my address you know", "can't tell'", "2222212222", "sandra@hotmail.com", "dentist",MD5.hexdigest("sandra")]
    end
    file.close

    file = File.open("../csv/user.csv", "a+")
    CSV::Writer.generate(file) do |csv|
     csv << ["1002",MD5.hexdigest("sandra"), "d"]
    end
    file.close

    file = File.open("../csv/patient.csv", "a+")
    CSV::Writer.generate(file) do |csv|
      csv << ["500", "nil", "Bill", "Gates", "Microsoft", "10/10/1950", "$$$$$$$$$", "Bill@gmail.com", "1212123"]
    end
    file.close

    doctor.add_exam_result(500,1002,"aponeurosis")

    csv_contents = CSV.read("../csv/patient.csv")

    found_it=nil
    csv_contents.each do |row|
      if(row[0] == "500" and row[1] == "1002")
        found_it= row
      end
    end
    found_it.should ==["500", "1002", "Bill", "Gates", "Microsoft", "10/10/1950", "$$$$$$$$$", "Bill@gmail.com", "1212123","aponeurosis"]
  end

  it "doctor mock adds exam results to patient interface" do
    doctor.stub!(:add_exam_result_interface)
    #patient gives his system id number to doctor
    stdin.stub!(:gets).and_return("500")
    patient_system_id = stdin.gets
    #doctor gives his system id number
    stdin.stub!(:gets).and_return("1000")
    doctor_system_id = stdin.gets
    #doctor diagnosis
    stdin.stub!(:gets).and_return("aponeurosis")
    diagnosis = stdin.gets
    doctor.add_exam_result(patient_system_id,doctor_system_id,diagnosis)
  end

end