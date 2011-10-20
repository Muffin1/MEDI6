require 'person.rb'
require 'patient.rb'
require 'csv'

class Receptionist < Person

  def addPatient(firstName, lastName, address, dateOfBirth, phoneNumber, email, idNumber)

    patient = Patient.new
    patient.addPatient("nil", "nil", firstName, lastName, address, dateOfBirth, phoneNumber, email, idNumber)
  end
end
