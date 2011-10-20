require 'person.rb'
require 'patient.rb'
require 'csv'

class Receptionist < Person

  def addPatient(firstName, lastName, address, dateOfBirth, phoneNumber, email, idNumber)

    patient = Patient.new
    patient.addPatient("nil", "nil", firstName, lastName, address, dateOfBirth, phoneNumber, email, idNumber)
  end

  def addReception(receptionistId,idNumber, firstName, lastName, address, phoneNumber, password)

    file = File.open("../csv/receptionist.csv", "a+")

    CSV::Writer.generate(file) do |csv|
    csv << [receptionistId,idNumber, firstName, lastName, address, phoneNumber, password]
    end

  file.close
end

end
