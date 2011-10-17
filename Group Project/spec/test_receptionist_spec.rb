require 'rspec'
require 'csv'
require '../lib/receptionist_methods.rb'

describe Receptionist do
  it "should add the info of a Receptionist" do
    add=Receptionist.new
    add.addReceptionist(1,"baidy", "oeoe", "Cherry street 3", "0707070708","6666696","pasrd")
  end
end