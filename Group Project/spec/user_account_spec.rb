#user_account_spec.rb
require 'rspec'
require '../lib/user_account.rb'
require '../lib/admin.rb'
require '../lib/doctor.rb'
require '../lib/receptionist.rb'

describe LogIn do

  subject {LogIn.new(Doctor.new("borel","borel1",1002),Receptionist.new,Admin.new)}

  it "should validate the user details"   do
    subject.validate("borel","borel1",1002).should be_an_instance_of(Doctor)
  end

end