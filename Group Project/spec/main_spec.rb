require "rspec"
require "main.rb"

describe Main do
  let(:stdin){mock('stdin')}
  let(:stdout){StringIO.new}

  subject { Main.new(stdin, stdout) }

  context "ask user information" do

     context "asking for id" do
      it "should get data from the standard input stream" do
        stdin.stub!(:gets).and_return("my id")
        subject.ask_user_for_id
        puts stdout.string
      end
    end

    context "asking for password" do
      it "should get data from the standard input stream" do
        stdin.stub!(:gets).and_return("maypassword")
        subject.ask_user_for_password
        puts stdout.string
      end
    end


  end


  it "should get ID and password" do

    #
    #main.get_user_id_password
    #
    #main.id.should == 5000
    #main.password.should == "apassword"

  end

  it "should print according " do


  end

  it "should get according " do


  end

end