require "rspec"
require "../lib/patient"

describe "Patient" do


  it "should insert a new patient in patient.csv" do
    patient = Patient.new
    patient_system_id = patient.id_generator()
    patient.add_patient(patient_system_id.to_s,"nil", "Kwstas", "Prekas", "Ellas 98", "10/10/1950", "234567788", "KPrekas@gmail.com", "3242434223")

  end

end