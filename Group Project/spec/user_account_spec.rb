#user_account_spec.rb
require 'rspec'
require '../lib/user_account.rb'
require 'csv'
describe LogIn do
  subject {LogIn.new()}

  filename = "../csv/user.csv"

  it "should validate a receptionist user"   do
    id = "5011"
    password = "rec8898"
    #user = mock('User')
    subject.stub!(:id).and_return(id)
    subject.stub!(:password).and_return(password)
    subject.validate(filename,id,password).should =="r"
  end

  it "should validate a doctor user"   do
    id = "5031"
    password = "rec8412"
    subject.stub!(:id).and_return(id)
    subject.stub!(:password).and_return(password)
    subject.validate(filename,id,password).should =="d"
  end

  it "should validate a admin user"   do
    id = "5000"
    password = "ydgtwyy"
    subject.stub!(:id).and_return(id)
    subject.stub!(:password).and_return(password)
    subject.validate(filename,id,password).should =="a"
  end

  it "should load the menu according to the privilege"   do
    subject.user_login(subject.validate(filename, "5000","ydgtwyy")).should =='Welcome admin'
    subject.user_login(subject.validate(filename, "5031","rec8412")).should =='Welcome doctor'
    subject.user_login(subject.validate(filename, "5011","rec8898")).should =='Welcome receptionist'
  end


end