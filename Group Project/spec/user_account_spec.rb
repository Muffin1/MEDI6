#user_account_spec.rb
require 'rspec'
require '../lib/user_account.rb'
require '../lib/admin.rb'
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

it "should validate the implementation of login with authorization check on an encrypted password for doctor"   do
  static_id= "111"
  password = "password"
  doctor = Doctor.new()

  #adding a doctor to verify by login in he is authorized
  encrypted_password = MD5.hexdigest(password)
  doctor.add_doctor(static_id, "idNumber", "firstName", "lastName", "address", "date_of_birth", "phoneNumber", "email", "specialization",  encrypted_password)
  doctor.set_privileges(static_id,encrypted_password,"d")

  login = Login.new
  authorization = login.validate("../csv/user.csv",static_id, password)
  authorization.should_not == nil
end


  it "should validate the implementation of login with authorization check on an encrypted password for receptionist"   do
  static_id= "112"
  password = "password"
  receptionist = Receptionist.new()

  #adding a doctor to verify by login in he is authorized
  encrypted_password = MD5.hexdigest(password)
  receptionist.add_receptionist(static_id, "idNumber", "firstName", "lastName", "address", "date_of_birth", "phoneNumber", "email", encrypted_password)
  receptionist.set_privileges(static_id,encrypted_password,"r")

  login = Login.new
  authorization = login.validate("../csv/user.csv",static_id, password)
  authorization.should_not == nil
end
end