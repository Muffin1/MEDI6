require "rspec"

describe "Doctor" do

  it "should do something" do
    doctor1 = new.Doctor
    doctorfname = doctor1.fname

    doctorfname.should == "Farhad"
  end
end