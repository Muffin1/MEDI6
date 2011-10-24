require "rspec"
require '../lib/admin.rb'
require "../lib/doctor.rb"
require "../lib/receptionist.rb"

describe "Administrator" do

  admin = Admin.new
  let(:doctor){mock('Doctor')}

  context "the admin should be able to register new doctors in the system" do
    it "defining add_doctor method and assign privileges" do

      id = doctor.stub!(:id_generator).and_return(1)
      doctor.stub!(:add_doctor).with(id,2, "John", "James", "27 Cherry Street", "12345678910", "pathologist",  "34m43")
      doctor.stub!(:set_privileges).with(id, "5000", "d")
      doctor.add_doctor(id,2, "John", "James", "27 Cherry Street", "12345678910", "pathologist",  "34m43")
      doctor.set_privileges(id, "5000", "d")
    end
  end


end