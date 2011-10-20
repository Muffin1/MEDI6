require 'person.rb'


class Doctor < Person
  attr_accessor :speciality

  def initialize()

  end

def addDoctor(doctorId,idNumber, firstName, lastName, address, phoneNumber, specialization,  password)

    file = File.open("../csv/doctor.csv", "a+")

    CSV::Writer.generate(file) do |csv|
    csv << [doctorId,idNumber, firstName, lastName, address, phoneNumber, specialization, password]
    end


  file.close
end

end