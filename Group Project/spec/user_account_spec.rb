#user_account_spec.rb
require 'rspec'
require '../lib/user_account.rb'

require 'csv'

 # doctor = Doctor.new()
 # doctor.userName = "baidy"
  #doctor.password = "baidy1"
  #doctor.id = "01"

  #receptionist = Receptionist.new()
  #receptionist.userName = "jerry"
  #receptionist.password = "jerry1"
  #receptionist.id = "02"

  #admin = Admin.new()
  #admin.userName = "alex"
  #admin.password = "alex1"
  #admin.id = "03"

  it "should return a doctor instance"   do
     doctor =   mock('Doctor')

  doctor.stub!(:userName).and_return("baidy")


  subject {LogIn.new(doctor,receptionist,admin)}

    subject.validate("baidy","baidy1","01").should be_an_instance_of(Doctor)

describe Login do
  it "should validate the user login details"   do
    user = mock('User')
    user.stub!(:id).and_return("1")
    user.stub!(:password).and_return("baidy1")
    subject = Login.new

    subject.validate("../csv/user.csv","5000","baidy").should =="a"

  end
  end

end