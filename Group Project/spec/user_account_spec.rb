#user_account_spec.rb
require 'rspec'
require '../lib/user_account.rb'
require '../lib/admin.rb'
require 'csv'
describe Login do


  filename = "../csv/user.csv"

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

   it "should return the appropriate message"   do
     login = Login.new
     login.user_login("a").should == 'Welcome admin!' +"\n"+"=========================="
     login.user_login("d").should == 'Welcome doctor!' +"\n"+"=========================="
     login.user_login("r").should == 'Welcome receptionist!' +"\n"+"=========================="
     login.user_login("x").should == nil
   end
end