#user_account_spec.rb
require 'rspec'
require '../lib/user_account.rb'
require 'csv'


describe Login do
  it "should validate the user login details"   do
    user = mock('User')
    user.stub!(:id).and_return("1")
    user.stub!(:password).and_return("baidy1")
    subject = Login.new

    subject.validate("../csv/user.csv","5000","baidy").should =="a"
  end

end