require "rspec"
require "../lib/doctor.rb"
require "csv"

describe "Doctor" do

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

    it "should update doctor data" do
      doctor1 = Doctor.new
      doctor1.id_number = nil
      doctor1.first_name = "baidy"
      doctor1.last_name=  nil
      doctor1.address = "rochdale road"
      doctor1.date_of_birth = "3123/123/123"
      doctor1.phone_number= "078376766"
      doctor1.email = nil
      doctor1.specialization = "mamadou"
      doctor1.password="password"

      new_data = ["5005",doctor1.id_number, doctor1.first_name, doctor1.last_name,doctor1.address,doctor1.date_of_birth, doctor1.phone_number,doctor1.email,doctor1.specialization,doctor1.password]

      doctor.update_doctor_data(doctor1,"5005")

    end
  end

    describe "methods of class doctor" do
    it "should get the UI input" do
        doctor.display_modify_options().should_not == nil
    end

    it "should display user data" do
     CSV = ["5002","4325","baidy","diawr","32, oxford road","03/09/2005","0798534355","diae@yahoo.com","therrpist","paswor1"]
       puts "----------------------------"
    puts "Doctor details :\n"
    if not(CSV==nil)
      puts "\n"
      if not(CSV[1] == nil)
        puts "ID number : " + CSV[1]
      end
      if not(CSV[2] == nil)
        puts "First name : " + CSV[2]
      end
      if not(CSV[3] == nil)
        puts "Last name : " + CSV[3]
      end
      if not(CSV[4] == nil)
        puts "Address : "+ CSV[4]
      end
      if not(CSV[5] == nil)
        puts "Date of birth : "+ CSV[5]
      end
      if not(CSV[6] == nil)
        puts "Phone number : "+ CSV[6]
      end
      if not(CSV[7] == nil)
        puts "Email : "+ CSV[7]
      end
      if not(CSV[8] == nil)
        puts "Speciality : " + CSV[8]
      end
      if not(CSV[9] == nil)
        puts "Password : " + CSV[9]
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
      CSV[0] = changed_value
    elsif (input == "2")
      puts "Changing First name.. Please type the new value :"
      CSV[1] = changed_value
    elsif (input == "3")
      puts "Changing Last name.. Please type the new value :"
      CSV[2] = changed_value
    elsif (input == "4")
      puts "Changing Address.. Please type the new value :"
      CSV[3] = changed_value
    elsif (input == "5")
      puts "Changing Date of birth.. Please type the new value :"
     CSV[4] = changed_value
    elsif (input == "6")
      puts "Changing Phone number.. Please type the new value :"
      CSV[5] = changed_value
    elsif (input == "7")
      puts "Changing Email.. Please type the new value :"
      CSV[6] = changed_value
    elsif (input == "8")
      puts "Changing Speciality.. Please type the new value :"
     CSV[7] = changed_value
    elsif (input == "9")
      puts "Changing Password.. Please type the new value :"
         CSV[8] = changed_value
    end
      puts "updated  record: "
      puts CSV
    end

    end
  it "add exam results to patient" do
    doctor.stub!(:add_exam_result).with("patient_id", "doctor_id","exam result").and_return("patient_id, doctor_id,exam result")
    file = mock('file')
    File.stub!(:open).with("patient.csv").and_yield(file)
    File.stub!(:write).with("patient_id", "doctor_id","exam result").and_return("patient_id, doctor_id,exam result")
    File.write("patient_id", "doctor_id","exam result") == "patient_id, doctor_id,exam result"

  end

end