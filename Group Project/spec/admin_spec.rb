require "rspec"
require '../lib/admin.rb'
require "../lib/doctor.rb"
require "../lib/receptionist.rb"

describe "Administrator" do

  admin = Admin.new
  let(:doctor){mock('Doctor')}
  let(:receptionist){mock('Receptionist')}

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
    admin.add_doctor("2323","John", "James", "27 Cherry Street", "12345678910", "pathologist",  "34m43")
    csv_contents = CSV.read("../csv/doctor.csv")

    found_it=nil
    csv_contents.each do |row|
      if(row[1] == "2323")
        found_it= row[1]
      end
    end
    found_it.should =="2323"
  end

end