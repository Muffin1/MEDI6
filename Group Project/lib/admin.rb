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
    doctor.setPrivileges("nil",password,"d")
  end

  def deleteDoctor(doctor)

  end

  def addReceptionist(idNumber, firstName, lastName, address, phoneNumber, password)
    receptionist = Receptionist.new()
    receptionist.addReception("nil",idNumber, firstName, lastName, address, phoneNumber, password)
    receptionist.setPrivileges("nil", password,"r")
  end

  def deleteReceptionist(receptionist)

  end

end