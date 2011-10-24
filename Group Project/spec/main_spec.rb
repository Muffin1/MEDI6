require "rspec"
require '../lib/main.rb'
require '../lib/user_account.rb'
require "csv"

describe Main do
  let(:stdin){mock('stdin')}
  let(:stdout){StringIO.new}
  filename = "../csv/user.csv"

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
        stdin.stub!(:gets).and_return("mypassword")
        subject.ask_user_for_password
        puts stdout.string
      end
    end

    context "perform user login" do
      it "should perform login " do
        log_in = LogIn.new
        stdin.stub!(:gets).and_return("my id")
        id = subject.ask_user_for_id
        stdin.stub!(:gets).and_return("mypassword")
        password = subject.ask_user_for_password

        privilege = log_in.validate(filename, id, password)
        if not(false) then
          log_in.user_login(privilege).should_not == nil
        end

      end

    end
  end
end