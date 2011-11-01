require "rspec"
require '../lib/receptionist.rb'
require '../lib/person.rb'

describe "Receptionist" do
  let(:receptionist){Receptionist.new}
  let(:stdin){mock('STDIN')}
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

    describe "methods of class receptionist" do
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

      it "should update receptionist data" do
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
    end

    it "receptionist.select_option should get the option of the receptionist and act accordingly" do

      recep = mock("Receptionist")
      recep.stub!(:option).and_return("a")
      recep.stub!(:modify_receptionist_info)
      recep.stub!(:add_patient)
      recep.stub!(:edit_patient)
      if (recep.option=="m")
        recep.modify_receptionist_info
      elsif (recep.option=="a")
        recep.edit_patient
      elsif (recep.option=="e")
        recep.add_patient
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

    describe "methods of class receptionist" do
      it "should get the UI input" do
        receptionist.display_modify_options().should_not == nil
      end

      it "should display user data" do
        CSV_row = ["5002","4325","baidy","diawr","32, oxford road","03/09/2005","0798534355","diae@yahoo.com","paswor1"]
        puts "----------------------------"
        puts "Receptionist details :\n"
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
            puts "Password : " + CSV_row[8]
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
          puts "Changing Password.. Please type the new value :"
          CSV_row[7] = changed_value
        end
        puts "updated  record: "
        puts CSV_row
      end

    end
  end
end