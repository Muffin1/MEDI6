require "rspec"
require "../lib/patient"

describe "Patient" do

  describe "methods of class patient" do
    let(:patient){mock('Patient')}

    it "should register a new patient to the system" do
      patient.stub!(:add_patient)
      patient.add_patient("1235", "12", "costas", "ioannou", "2 marlboro street", "date_of_birth", "15475213", "email", "1245125")

      file = mock('file')
      File.stub!(:open).with("filename", "privilege").and_yield(file)
      File.stub!(:write).with("1235", "12", "costas", "ioannou", "2 marlboro street", "date_of_birth", "15475213", "email", "1245125").and_return("1235,12,costas,ioannou,2 marlboro street,date_of_birth,15475213,email,1245125")
      File.write("1235", "12", "costas", "ioannou", "2 marlboro street", "date_of_birth", "15475213", "email", "1245125") == "1235,12,costas,ioannou,2 marlboro street,date_of_birth,15475213,email,1245125"
    end
  end

end