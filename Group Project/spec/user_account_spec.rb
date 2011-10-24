#user_account_spec.rb
require 'rspec'
require '../lib/user_account.rb'
#require '../lib/admin.rb'
#require '../lib/doctor.rb'
#require '../lib/receptionist.rb'

describe LogIn do

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
  end

  it "should return a receptionist instance"   do
    subject.validate("jerry","jerry1","02").should be_an_instance_of(Receptionist)
  end

  it "should return an admin instance"   do
    subject.validate("alex","alex1","03").should be_an_instance_of(Admin)
  end


end