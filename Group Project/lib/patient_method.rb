require 'csv'

class Patient
def addPatient(patientID, doctorId, name, surname, address, dateOfBirth, phoneNumber, email, idNumber)
  file = CSV.open("../csv/patient.csv", "w")
  file << [patientID, doctorId, name, surname, address, dateOfBirth, phoneNumber, email, idNumber]
end

end