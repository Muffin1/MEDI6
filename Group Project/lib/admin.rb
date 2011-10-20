require 'person.rb'
require 'doctor.rb'
require 'receptionist.rb'


class Admin < Person
  attr_accessor :userName, :password, :id

  def initialize()

  end

  def addDoctor(idNumber,firstName, lastName, address, phoneNumber, specialization,  password)
    doctor = Doctor.new()
    doctor.addDoctor("nil", idNumber, firstName, lastName, address, phoneNumber, specialization,  password)

  end

  def deleteDoctor(doctor)

  end

  def insertReceptionist(receptionist)
    receptionist = Receptionist.new()
  end

  def deleteReceptionist(receptionist)

  end

end