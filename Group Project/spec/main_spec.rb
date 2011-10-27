require "rspec"
require '../lib/main.rb'
require '../lib/user_account.rb'
require "csv"

describe Main do
  let(:stdin){mock('stdin')}
  let(:stdout){StringIO.new}
  filename = "../csv/user.csv"

  subject { Main.new() }

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
        log_in = Login.new
        stdin.stub!(:gets).and_return("5000")
        id = stdin.gets
        stdin.stub!(:gets).and_return("admin")
        password = stdin.gets

        privilege = log_in.validate(filename, id, password)

        privilege.should_not == nil

      end

    end
  end
end