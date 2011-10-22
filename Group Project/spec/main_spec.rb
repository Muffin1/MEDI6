require "rspec"
require "main.rb"

describe "Main class" do

  it "should get ID and password" do

    main = Main.new()

    main.getUserIDPassword

    main.id.should == 5000
    main.password.should == "apassword"

  end

  it "should print according to the user" do

    #To change this template use File | Settings | File Templates.
    true.should == false
  end

end