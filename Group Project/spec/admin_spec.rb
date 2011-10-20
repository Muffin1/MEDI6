require "rspec"
require '../lib/admin.rb'
require "../lib/doctor.rb"
require "../lib/receptionist.rb"
describe "Administrator" do

  #it "Admin should have an username" do
  #  admin = Admin.new
  #  admin.username = "adminuser"
  #  adminUserName = admin.username
  #
  #  adminUserName.should == "adminuser"
  #end
  #
  #it "Admin should have a password" do
  #  admin = Admin.new
  #  admin.password = "pass"
  #  adminPassword = admin.password
  #
  #  adminPassword.should == "pass"
  #end
  #
  #  it "Admin should have an id" do
  #  admin = Admin.new
  #  admin.id = "2"
  #  adminID = admin.id
  #
  #  adminID.should == "2"
  #end

  #it "Admin should be able to add a new doctor by using the addDoctor method and assign privileges" do
  #
  #  admin = Admin.new
  #  admin.addDoctor("554655464","Theodor", "Jenkins", "Normandy 5", "233233232333", "pathologist",  "p8898")
  #  admin.searchByName("../csv/doctor.csv","Theodor").should ==["nil,554655464,Theodor,Jenkins,Normandy 5,233233232333,pathologist,p8898"]
  #end

    it "Admin should be able to add a new receptionist by using the addReceptionist method and assign privileges" do

    admin = Admin.new
    admin.addReceptionist("554655464","Anna", "Jacobs", "Normandy 3", "2332332333","rec8898")
    #admin.searchByName("../csv/receptionist.csv","Anna").should ==["nil,554655464,Anna,Jacobs,Normandy 3,2332332333,rec8898"]
  end
end