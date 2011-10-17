require 'rspec'
require 'csv'
require '../lib/admin_methods.rb'

describe Admin do
  it "should open a new file and write the given info in it" do
    add=Admin.new
    add.addUser(1,'sandra','alkiviadous', 1)
  end
end