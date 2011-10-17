require 'person.rb'

class Doctor < Person
  attr_accessor :speciality
<<<<<<< HEAD

  def initialize()
=======
  def initialize()

>>>>>>> 67eb16a729747ab37767d9e5c56e203330a864e3
  end

  def addDoctor(id, name, surname, address, phoneNumber, specialization, idNumber, password)
    file = CSV.open("../csv/doctor.csv", "w")
    file << [id, name, surname, address, phoneNumber, specialization, idNumber, password]
  end

end