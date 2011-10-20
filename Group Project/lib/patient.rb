require 'person.rb'
#require 'receptionist.rb'

class Patient < Person

  def addPatient(patientID, doctorId, firstName, lastName, address, dateOfBirth, phoneNumber, email, idNumber)
  file = File.open("../csv/patient.csv", "a+")

    CSV::Writer.generate(file) do |csv|
    csv << [patientID, doctorId, firstName, lastName, address, dateOfBirth, phoneNumber, email, idNumber]
    end
  file.close
  end


end
