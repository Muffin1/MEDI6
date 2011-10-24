require 'person.rb'
require 'doctor.rb'
require 'receptionist.rb'


class Admin < Person
  attr_accessor :userName, :password, :id

  def initialize()

  end

  def addDoctor(idNumber,firstName, lastName, address, phoneNumber, specialization,  password)
    doctor = Doctor.new()

    aID = doctor.idGenerator()

    doctor.addDoctor(aID, idNumber, firstName, lastName, address, phoneNumber, specialization,  password)
    doctor.setPrivileges(aID,password,"d")
  end

  def deleteDoctor(doctor)

  end

  def addReceptionist(idNumber, firstName, lastName, address, phoneNumber, password)
    receptionist = Receptionist.new()

    aID = receptionist.idGenerator()

    receptionist.addReception(aID,idNumber, firstName, lastName, address, phoneNumber, password)
    receptionist.setPrivileges(aID, password,"r")
  end

  def deleteReceptionist(receptionist)

  end

end