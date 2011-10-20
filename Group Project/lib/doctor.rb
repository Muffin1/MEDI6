require 'person.rb'

class Doctor < Person
  attr_accessor :speciality

  def initialize()

  end

  def addDoctor(id, name, surname, address, phoneNumber, specialization, idNumber, password)
    file = CSV.open("../csv/doctor.csv", "w")
    file << [id, name, surname, address, phoneNumber, specialization, idNumber, password]
  end

end