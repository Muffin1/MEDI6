#user_account_spec.rb
require 'rspec'
require '../lib/user_account.rb'
#require '../lib/admin.rb'
#require '../lib/doctor.rb'
#require '../lib/receptionist.rb'

describe LogIn do
  it "should validate the user details"   do
    doctor = mock('Doctor')
    doctor.stub!(:id).and_return("baidy")
    doctor.stub!(:password).and_return("baidy1")

    receptionist = mock('Receptionist')
    receptionist.stub!(:id).and_return("jery")
    receptionist.stub!(:password).and_return("jery1")

    admin = mock('Admin')
    admin.stub!(:id).and_return("alex")
    admin.stub!(:password).and_return("al1")

    subject = LogIn.new(doctor,receptionist,admin)
    subject.validate("baidy","baidy1").should =="doctor"
    subject.validate("jery","jery1").should =="receptionist"
    subject.validate("alex","al1").should =="admin"
  end

end