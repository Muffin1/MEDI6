require "rspec"
require '../lib/receptionist.rb'
require '../lib/patient.rb'

describe "Receptionist" do

  patient_file = "../csv/patient.csv"

  it "Receptionist should have a first name" do
    receptionist = Receptionist.new
    receptionist.first_name = "Farhad"
    receptionist_fname = receptionist.first_name
    receptionist_fname.should == "Farhad"
  end

  it "Receptionist should have a last name" do
    receptionist = Receptionist.new
    receptionist.last_name = "Ghavam"
    receptionist_last_name = receptionist.last_name
    receptionist_last_name.should == "Ghavam"
  end

  it "Receptionist should have an address" do
    receptionist = Receptionist.new
    receptionist.address = "Manchester"
    receptionist_address = receptionist.address
    receptionist_address.should == "Manchester"
  end

  it "Receptionist should have a phone" do
    receptionist = Receptionist.new
    receptionist.phone_number = "123456789"
    phone_number = receptionist.phone_number
    phone_number.should == "123456789"
  end

  it "checking patient insertion" do
    receptionist = Receptionist.new
    receptionist.add_patient("onis","muffin","12 oxford street", "14/12/1987", "3251353", "email", "458733")
    csv_contents = CSV.read("../csv/patient.csv")

    found_it=nil
    csv_contents.each do |row|
      if(row[8] == "458733")
        found_it= row[8]
      end
    end
    found_it.should =="458733"
  end


  describe "methods of class receptionist" do
    receptionist = Receptionist.new
    file = File.open("../csv/receptionist.csv", "w+")
    CSV::Writer.generate(file) do |csv|
      csv << ["1001","2000", "Alex", "Zorzovilis", "Greece", "Age", "1231", "Alex@gmail.com", MD5.hexdigest("alex")]
    end
    file.close

    file = File.open("../csv/user.csv", "w+")
    CSV::Writer.generate(file) do |csv|
      csv << ["1001",MD5.hexdigest("alex"), "d"]
    end
    file.close

    receptionist1= Receptionist.new
    receptionist1.id_number = "2351"
    receptionist1.first_name = "Onis"
    receptionist1.last_name=  "Zorzovilis"
    receptionist1.address = "Iran"
    receptionist1.date_of_birth = "12/12/1980"
    receptionist1.phone_number= "078376766"
    receptionist1.email = "alex@gmail.com"
    receptionist1.password="1234"

    receptionist.update_receptionist_data(receptionist1,"1001").should ==  ["1001",receptionist1.id_number, receptionist1.first_name, receptionist1.last_name,receptionist1.address,receptionist1.date_of_birth, receptionist1.phone_number,receptionist1.email,MD5.hexdigest("1234")]

  end

  it "update_patient_data should change the existing information about a patient" do

    receptionist = Receptionist.new
    patient = Patient.new
    patient.add_patient(2121, "nil","Onisiforos","Onoufriou","12 oxford street", "14/12/1987", "0789060666", "onis@email.com", "12341234")

    patient.first_name = nil
    patient.last_name = nil
    patient.address = nil
    patient.date_of_birth = nil
    patient.phone_number = nil
    patient.email = "onisiforos20@gmail.com"
    patient.id_number =  nil

    receptionist.update_patient_data(patient, 2121)

    csv_contents = CSV.read("../csv/patient.csv")

    found_it=nil
    csv_contents.each do |row|
      if(row[0] == "2121")
        found_it= row
      end
    end
    found_it.should ==["2121", "nil","Onisiforos","Onoufriou","12 oxford street", "14/12/1987", "0789060666", "onisiforos20@gmail.com", "12341234"]
  end

end