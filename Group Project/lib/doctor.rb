require 'person.rb'

class Doctor < Person
  attr_accessor :speciality
  attr_accessor :user_name
  attr_accessor :password
  def initialize(user_name,password,id)
      @user_name = user_name
    @password =password
    @id = id
  end

  def addDoctor(id, name, surname, address, phoneNumber, specialization, idNumber, password)
    file = CSV.open("../csv/doctor.csv", "w")
    file << [id, name, surname, address, phoneNumber, specialization, idNumber, password]
  end


  # To change this template use File | Settings | File Templates.
end