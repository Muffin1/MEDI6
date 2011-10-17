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

  it "Admin should have a inserDoctor method" do
    admin = Admin.new
    doctor = Doctor.new
    doctor.firstName = "Alex"
    doctor.lastName  = "Zorzovilis"
    doctor.id = "01"
    doctor.userName= "Alex"
    doctor.password = "Alex"
    admin.password = "pass"
    adminPassword = admin.password

    adminPassword.should == "pass"
  end

end