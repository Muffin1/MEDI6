require 'person.rb'


class Doctor < Person
  attr_accessor :speciality

  def initialize()

  end

def add_doctor(doctor_id,id_number, first_name, last_name, address, phone_number, specialization,  password)

    file = File.open("../csv/doctor.csv", "a+")

    CSV::Writer.generate(file) do |csv|
    csv << [doctor_id,id_number, first_name, last_name, address, phone_number, specialization, password]
    end


  file.close
end

end