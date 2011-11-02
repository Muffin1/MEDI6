require "rspec"
require '../lib/receptionist.rb'
require '../lib/patient.rb'

describe "Receptionist" do
  let(:stdin){mock('STDIN')}
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
    receptionist.phone_number.should == "123456789"
  end

  it "should register a new patient to the system" do
    receptionist = Receptionist.new
    receptionist.stub!(:add_patient)
    receptionist.add_patient("jerry","cheng","12 oxford street", "14/12/1985", "3251353", "email", "654321")

    file = mock('File')
    #file.stub!(:open).with("filename", "privilege").and_yield(file)
    file.stub!(:write).with("jerry","cheng","12 oxford street", "14/12/1985", "3251353", "email", "654321").and_return("jerry,cheng,12 oxford street,14/12/1985,3251353, email,654321")
    record = file.write("jerry","cheng","12 oxford street", "14/12/1985", "3251353", "email", "654321")
    record.should == "jerry,cheng,12 oxford street,14/12/1985,3251353, email,654321"
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

  it "mock update_patient_data" do
    receptionist = Receptionist.new
    patient = mock("Patient")
    patient.stub!(:patient_id).and_return("2000")
    receptionist.stub!(:search_by_id).with(patient.patient_id,patient_file).and_return(mock("existing patient"))
    patient_info = receptionist.search_by_id(patient.patient_id, patient_file)
    row = Array.new
    patient_info.stub!(:first_name).and_return("Kwstas")
    row[0] = patient_info.first_name
    patient_info.stub!(:last_name).and_return("Kwsta")
    row[1] = patient_info.last_name
    patient_info.stub!(:address).and_return("Thermopilwn 80")
    row[2] = patient_info.address
    patient_info.stub!(:date_of_birth).and_return("12/12/1990")
    row[3] = patient_info.date_of_birth
    patient_info.stub!(:phone_number).and_return("21212121212")
    row[4] = patient_info.phone_number
    patient_info.stub!(:email).and_return("KKwstas@gmail.com")
    row[5] = patient_info.email
    patient_info.stub!(:id_number).and_return("12132545")
    row[6] = patient_info.id_number

    #changing some data of patient record
    stdin = mock('stdin')

    stdin.stub!(:gets).and_return("nil")
    new_info = stdin.gets
    if(new_info!="nil")
      row[0] = new_info
    end
    stdin.stub!(:gets).and_return("nil")
    new_info = stdin.gets
    if(new_info!="nil")
      row[1] = new_info
    end
    stdin.stub!(:gets).and_return("Nelsonos 12")
    new_info = stdin.gets
    if(new_info!="nil")
      row[2] = new_info
    end
    stdin.stub!(:gets).and_return("nil")
    new_info = stdin.gets
    if(new_info!="nil")
      row[3] = new_info
    end
    stdin.stub!(:gets).and_return("nil")
    new_info = stdin.gets
    if(new_info!="nil")
      row[4] = new_info
    end
    stdin.stub!(:gets).and_return("new@email.com")
    new_info = stdin.gets
    if(new_info!="nil")
      row[5] = new_info
    end
    stdin.stub!(:gets).and_return("nil")
    new_info = stdin.gets
    if(new_info!="nil")
      row[6] = new_info
    end
    file = mock('File')
    file.stub!(:write).with(row[0],row[1],row[2], row[3], row[4], row[5], row[6]).and_return(row)
    record = file.write(row[0],row[1],row[2], row[3], row[4], row[5], row[6])
    record.should == row

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