require "rspec"
require 'admin.rb'

describe "Administrator" do

  it "Admin should have an username" do
    admin = Admin.new
    admin.username = "adminuser"
    adminUserName = admin.username

    adminUserName.should == "adminuser"
  end

  it "Admin should have a password" do
    admin = Admin.new
    admin.password = "pass"
    adminPassword = admin.password

    adminPassword.should == "pass"
  end

    it "Admin should have an id" do
    admin = Admin.new
    admin.id = "2"
    adminID = admin.id

    adminID.should == "2"
  end

  it "Admin should have a insertDoctor method" do
    admin = Admin.new
    admin.userName = "adminuser"
    admin.password = "adminpass"
    doctor = Doctor.new
    doctor.firstName = "alex"
    doctor.lastName  = "zorzovilis"
    doctor.id = "01"
    doctor.userName= "drUser"
    doctor.password = "drpass"

    adminPassword = admin.password

    adminPassword.should == "adminpass"
  end

end