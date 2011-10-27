#user_account_spec.rb
require 'rspec'
require '../lib/user_account.rb'
require 'csv'
describe Login do
let(:subject){mock('login')}

  filename = "../csv/user.csv"

  it "should validate a receptionist user"   do
    id = "5011"
    password = "rec8898"
    subject.stub!(:id).and_return(id)
    subject.stub_chain(:MD5,:hexdigest).with(password).and_return("hexdigest_password")
    encrypted_password = subject.MD5.hexdigest(password)
    subject.stub!(:password).and_return(encrypted_password)
    subject.stub!(:validate).and_return('r')
    subject.validate(filename,id,encrypted_password).should =="r"
  end

  it "should validate a doctor user"   do
    id = "5031"
    password = "rec8412"
    subject.stub!(:id).and_return(id)
    subject.stub_chain(:MD5,:hexdigest).with(password).and_return("hexdigest_password")
    encrypted_password = subject.MD5.hexdigest(password)
    subject.stub!(:password).and_return(encrypted_password)
    subject.stub!(:validate).and_return('d')
    subject.validate(filename,id,encrypted_password).should =="d"
  end

  it "should validate a admin user"   do
    id = "5000"
    password = "password"
    subject.stub!(:id).and_return(id)
    subject.stub!(:password).and_return(password)
    subject.stub!(:validate).and_return('a')
    subject.validate.should =="a"
  end


end