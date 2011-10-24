require "rspec"
require "../lib/main.rb"
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
        stdin.stub!(:gets).and_return("maypassword")
        subject.ask_user_for_password
        puts stdout.string
      end
    end

    context "perform user login" do
      it "should perform login " do
        log_in = LogIn.new
        subject.perform_user_login(log_in.user_login(log_in.validate(filename, "5000","ydgtwyy")).should =='Welcome admin')

      end

    end
  end
end