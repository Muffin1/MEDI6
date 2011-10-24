require 'person.rb'
require 'doctor.rb'
require 'receptionist.rb'


class Admin < Person
  attr_accessor :userName, :password, :id

  def initialize()

  end

  def add_doctor(idNumber,firstName, lastName, address, phoneNumber, specialization,  password)
    doctor = Doctor.new()

    a_id = doctor.id_generator()

    doctor.add_doctor(a_id, idNumber, firstName, lastName, address, phoneNumber, specialization,  password)
    doctor.set_privileges(aID,password,"d")
  end

  def delete_doctor(doctor)

  end

  def add_receptionist(idNumber, firstName, lastName, address, phoneNumber, password)
    receptionist = Receptionist.new()

    a_id = receptionist.id_generator()

    receptionist.add_reception(a_id,idNumber, firstName, lastName, address, phoneNumber, password)
    receptionist.set_privileges(a_id, password,"r")
  end

  def deleteReceptionist(receptionist)

  end

end