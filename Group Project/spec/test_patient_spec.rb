require 'rspec'
require 'csv'
require '../lib/patient_method.rb'

describe Patient do
  it "should add the info of a Patient" do
    add=Patient.new
    add.addPatient("1","1","pouloukos","kolokasis","Cucumber street", "1/1/1900","434543534","kolokasi@hotmail.com","3432")
  end
end