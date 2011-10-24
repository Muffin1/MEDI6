require "rspec"
require '../lib/admin.rb'
require "../lib/doctor.rb"
require "../lib/receptionist.rb"

describe "Administrator" do

  admin = Admin.new
  let(:doctor){mock('Doctor')}
  let(:receptionist){mock('Receptionist')}
  let(:stdin){mock('stdin')}

  context "the admin should be able to register new doctors or receptionists in the system" do
    it "defining add_doctor method and assign privileges" do
      id = doctor.stub!(:id_generator).and_return(1)        #stub: create a fake method which return 1
      doctor.stub!(:add_doctor).with(id,2, "John", "James", "27 Cherry Street", "12345678910", "pathologist",  "34m43")
      doctor.stub!(:set_privileges).with(id, "5000", "d")
      doctor.add_doctor(id,2, "John", "James", "27 Cherry Street", "12345678910", "pathologist",  "34m43")
      doctor.set_privileges(id, "5000", "d")
    end

    it "defining add_receptionist method and assign privileges" do
      id = receptionist.stub!(:id_generator).and_return(1)
      receptionist.stub!(:add_receptionist).with(id, "Marina", "Jacobson", "22 Mambo Street", "0123456789", "34m43")
      receptionist.stub!(:set_privileges).with(id, "5000", "r")
      receptionist.add_receptionist(id, "Marina", "Jacobson", "22 Mambo Street", "0123456789", "34m43")
      receptionist.set_privileges(id, "5000", "r")
    end
  end

  it "checking receptionist insertion" do
    admin.add_receptionist("104144", "Yiannis", "Jacobson", "22 Mambo Street", "01234119", "34m43")
    csv_contents = CSV.read("../csv/receptionist.csv")

    found_it=nil
    csv_contents.each do |row|
      if(row[1] == "104144")
        found_it= row[1]
      end
    end
    found_it.should =="104144"
  end


   it "checking doctor insertion" do
    admin.add_doctor("2323","John", "James", "27 Cherry Street", "01/01/1953", "12345678910", "anyname@yahoo.com", "pathologist",  "34m43")
    csv_contents = CSV.read("../csv/doctor.csv")

    found_it=nil
    csv_contents.each do |row|
      if(row[1] == "2323")
        found_it= row[1]
      end
    end
    found_it.should =="2323"
  end

  it "should choose which user to add" do
    admin.select_user_to_add(1).should == "Adding a doctor.."
    admin.select_user_to_add(2).should == "Adding a receptionist.."

  end

  it "should get the user details for doctor" do

    stdin.stub!(:gets).and_return("AI555200")
    id = stdin.gets
    stdin.stub!(:gets).and_return("Baidy")
    first_name = stdin.gets
    stdin.stub!(:gets).and_return("Diaw")
    last_name = stdin.gets
    stdin.stub!(:gets).and_return("70, Oxford Street")
    address = stdin.gets
    stdin.stub!(:gets).and_return("01/01/1953")
    date_of_birth = stdin.gets
    stdin.stub!(:gets).and_return("1234567890")
    phone_number = stdin.gets
    stdin.stub!(:gets).and_return("anyname@yahoo.com")
    email = stdin.gets
    stdin.stub!(:gets).and_return("Surgeon")
    specialization = stdin.gets
    stdin.stub!(:gets).and_return("bolton")
    password = stdin.gets

    doctor = admin.add_doctor(id, first_name, last_name, address, date_of_birth, phone_number, email, specialization, password)

    doctor.id_number.should == "AI555200"
    doctor.first_name.should == "Baidy"
    doctor.last_name.should == "Diaw"
    doctor.address.should == "70, Oxford Street"
    doctor.date_of_birth.should  == "01/01/1953"
    doctor.phone_number.should == "1234567890"
    doctor.email.should == "anyname@yahoo.com"
    doctor.specialization.should == "Surgeon"
    doctor.password.should == "bolton"

  end


end