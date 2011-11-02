require "rspec"
require "md5"
require '../lib/admin.rb'
require "../lib/doctor.rb"
require "../lib/receptionist.rb"

describe "Administrator" do

  context "the admin should be able to register new doctors or receptionists in the system" do

    let(:stdin){mock('stdin')}


    it "checking receptionist insertion" do
      admin = Admin.new
      admin.add_receptionist("104144", "Yiannis", "Jacobson", "22 Mambo Street", "03/2/1985", "01234119","aemail@yahoo.com", "rec")
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
      admin = Admin.new
      admin.add_doctor("2323","John", "James", "27 Cherry Street", "01/01/1953", "12345678910", "anyname@yahoo.com", "pathologist",  "admin")
      csv_contents = CSV.read("../csv/doctor.csv")

      found_it=nil
      csv_contents.each do |row|
        if(row[1] == "2323")
          found_it= row[1]
        end
      end
      found_it.should =="2323"
    end

    it "should get the user details for doctor" do
      admin = Admin.new
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
      stdin.stub!(:gets).and_return(MD5.hexdigest("bolton"))
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
      doctor.password.should == MD5.hexdigest(password)

    end

    it "should get the user details for receptionist" do
      admin = Admin.new
      stdin.stub!(:gets).and_return("AI555200")
      id = stdin.gets
      stdin.stub!(:gets).and_return("aReceptionist")
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
      stdin.stub!(:gets).and_return(MD5.hexdigest("bolton"))
      password = stdin.gets

      receptionist = admin.add_receptionist(id, first_name, last_name, address, date_of_birth, phone_number, email, password)

      receptionist.id_number.should == "AI555200"
      receptionist.first_name.should == "aReceptionist"
      receptionist.last_name.should == "Diaw"
      receptionist.address.should == "70, Oxford Street"
      receptionist.date_of_birth.should  == "01/01/1953"
      receptionist.phone_number.should == "1234567890"
      receptionist.email.should == "anyname@yahoo.com"
      receptionist.password.should == MD5.hexdigest(password)

    end

  end
end