require 'doctor.rb'
require 'receptionist.rb'


class Admin
  attr_accessor :userName, :password, :id

  def initialize

  end

  def insertDoctor(doctor)
    doctor = Doctor.new()
  end

  def deleteDoctor(doctor)

  end

  def insertReceptionist(receptionist)
    receptionist = Receptionist.new()
  end

  def deleteReceptionist(receptionist)

  end

end