#user_account_spec.rb
require 'rspec'
require '../lib/user_account.rb'
require '../lib/admin.rb'
require '../lib/doctor.rb'
require '../lib/receptionist.rb'

describe LogIn do

  doctor = Doctor.new()
  doctor.userName = "baidy"
  doctor.password = "baidy1"
  doctor.id = "1"


  subject {LogIn.new(doctor,Receptionist.new,Admin.new)}

  it "should validate the user details"   do
    subject.validate("baidy","baidy1","1").should be_an_instance_of(Doctor)
  end

end