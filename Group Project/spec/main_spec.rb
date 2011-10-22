require "rspec"
require "main.rb"

describe Main do
  let(:stdin){mock('stdin', :gets => "54")}
  let(:stdout){StringIO.new}

  subject { Main.new(stdin, stdout) }

  context "ask user information" do
    it "should ask the user for ID" do
      subject.should_receive(:ask_user_for_id)
      subject.get_user_id_password
    end

    it "should ask the user for password" do
      subject.should_receive(:ask_user_for_password)
      subject.get_user_id_password
    end

    context "asking for id" do
      it "should get data from the standard input stream" do
        stdin.should_receive(:gets)
        subject.ask_user_for_id
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