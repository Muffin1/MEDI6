require 'person.rb'


class Doctor < Person
<<<<<<< HEAD

def addDoctor(doctorId,idNumber, firstName, lastName, address, phoneNumber, specialization,  password)

    file = File.open("../csv/doctor.csv", "a+")

    CSV::Writer.generate(file) do |csv|
    csv << [doctorId,idNumber, firstName, lastName, address, phoneNumber, specialization, password]
    end
=======
  attr_accessor :speciality

  def initialize()

  end
>>>>>>> 3f164b2b7a61a03984c397856e7ba2c635f36852

  file.close
end

end