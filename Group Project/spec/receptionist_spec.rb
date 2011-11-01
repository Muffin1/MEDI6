require "rspec"
require '../lib/receptionist.rb'
require '../lib/person.rb'

describe "Receptionist" do

  let (:receptionist){ Receptionist.new }
  patient_file = "../csv/patient.csv"

  it "Receptionist should have a first name" do
    receptionist.first_name = "Farhad"
    receptionist_fname = receptionist.first_name
    receptionist_fname.should == "Farhad"
  end

  it "Receptionist should have a last name" do
    receptionist.last_name = "Ghavam"
    receptionist_last_name = receptionist.last_name
    receptionist_last_name.should == "Ghavam"
  end

  it "Receptionist should have an address" do
    receptionist.address = "Manchester"
    receptionist_address = receptionist.address
    receptionist_address.should == "Manchester"
  end

  it "Receptionist should have a phone" do
    receptionist.phone_number = "123456789"
    phone_number = receptionist.phone_number
    receptionist.phone_number.should == "123456789"
  end

  it "should register a new patient to the system" do
    receptionist = mock("Receptionist")
    receptionist.stub!(:add_patient)
    receptionist.add_patient("jerry","cheng","12 oxford street", "14/12/1985", "3251353", "email", "654321")

    file = mock('file')
    File.stub!(:open).with("filename", "privilege").and_yield(file)
    File.stub!(:write).with("jerry","cheng","12 oxford street", "14/12/1985", "3251353", "email", "654321").and_return("jerry,cheng,12 oxford street,14/12/1985,3251353, email,654321")
    File.write("jerry","cheng","12 oxford street", "14/12/1985", "3251353", "email", "654321")== "jerry,cheng,12 oxford street,14/12/1985,3251353, email,654321"
  end

  it "checking patient insertion" do
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



  #describe "methods of class receptionist" do
  #
  #  it "should update receptionist data" do
  #    recep1 = Receptionist.new
  #    recep1.id_number = nil
  #    recep1.first_name = "baidy"
  #    recep1.last_name=  nil
  #    recep1.address = "rochdale road"
  #    recep1.date_of_birth = "3123/123/123"
  #    recep1.phone_number= "078376766"
  #    recep1.email = nil
  #    recep1.password=nil
  #
  #    record = ["5014",recep1.id_number, recep1.first_name, recep1.last_name,recep1.address,recep1.date_of_birth, recep1.phone_number,recep1.email,recep1.password]
  #
  #    recep1.update_receptionist_data(recep1,"5014")
  #
  #  end
  #end


  describe "methods of class receptionist" do
    file = File.open("../csv/receptionist.csv", "a+")
    CSV::Writer.generate(file) do |csv|
      csv << ["2000","2000", "Sandra", "Alkivias", "my address you know", "can't tell'", "2222212222", "sandra@hotmail.com", "dentist",MD5.hexdigest("sandra")]
    end
    file.close

    file = File.open("../csv/user.csv", "a+")
    CSV::Writer.generate(file) do |csv|
     csv << ["1000",MD5.hexdigest("sandra"), "d"]
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



      doctor.update_doctor_data(doctor1,"1000").should ==  ["1000",doctor1.id_number, doctor1.first_name, doctor1.last_name,doctor1.address,doctor1.date_of_birth, doctor1.phone_number,doctor1.email,doctor1.specialization,MD5.hexdigest("sandra")]

    end
  end

  it "receptionist.select_option should get the option of the receptionist and act accordingly" do

    receptionist.stub!(:option).and_return("n")
    receptionist.stub!(:modify_receptionist_info)
    receptionist.stub!(:add_patient)
    receptionist.stub!(:edit_patient)
    if (receptionist.option=="m")
      receptionist.modify_receptionist_info
    elsif (receptionist.option=="n")
      receptionist.edit_patient
    elsif (receptionist.option=="e")
      receptionist.add_patient
    end
  end
end