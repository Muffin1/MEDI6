require 'rspec'
require 'csv'
require '../lib/doctor_methods.rb'

describe Doctor do
  it "should add the info of a doctor" do
    add=Doctor.new
    add.addDoctor(1,"onisiforos", "onoufriou", "Cherry street", "0707070707","psychiatrist","6666666","pasrd")
  end
end