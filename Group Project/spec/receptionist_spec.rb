require "rspec"
require '../lib/receptionist.rb'
require '../lib/person.rb'

describe "Receptionist" do
  let(:receptionist){Receptionist.new}
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



  describe "methods of class receptionist" do

    it "should update receptionist data" do
      recep1 = Receptionist.new
      recep1.id_number = nil
      recep1.first_name = "baidy"
      recep1.last_name=  nil
      recep1.address = "rochdale road"
      recep1.date_of_birth = "3123/123/123"
      recep1.phone_number= "078376766"
      recep1.email = nil
      recep1.password=nil

      record = ["5014",recep1.id_number, recep1.first_name, recep1.last_name,recep1.address,recep1.date_of_birth, recep1.phone_number,recep1.email,recep1.password]

      receptionist.update_receptionist_data(recep1,"5014")

    end
  end

  it "receptionist.select_option should get the option of the receptionist and act accordingly" do

    receptionist.stub!(:option).and_return("a")
    receptionist.stub!(:modify_receptionist_info)
    receptionist.stub!(:add_patient)
    receptionist.stub!(:edit_patient)
    if (receptionist.option=="m")
      receptionist.modify_receptionist_info
    elsif (receptionist.option=="a")
      receptionist.edit_patient
    elsif (receptionist.option=="e")
      receptionist.add_patient
    end
  end

  it "mock update_patient_data" do
    patient = mock("Patient")
    patient.stub!(:patient_id).and_return("2000")
    receptionist.stub!(:search_by_id).with(patient.patient_id).and_return(mock("existing patient"))
    row = [7]
    patient_info = receptionist.search_by_id(patient.patient_id)
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

    #edit som of the data of an existing patient
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
    file = mock('file')
    File.stub!(:open).with("filename", "privilege").and_yield(file)
    File.stub!(:write).with(row[0],row[1],row[2], row[3], row[4], row[5], row[6]).and_return(row)
    File.write(row[0],row[1],row[2], row[3], row[4], row[5], row[6])== row
  end


end