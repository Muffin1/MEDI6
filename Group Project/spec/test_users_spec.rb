require 'rspec'
require 'csv'
require '../spec/users.rb'

describe Users do
  it "should open a new file and write the given info in it" do
    add=Users.new
    add.addUser(1,'sandra','alkiviadous', 1)
  end
end