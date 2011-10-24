require 'person.rb'


class Doctor < Person
  attr_accessor :specialization


  def add_doctor(doctor_id,id_number, first_name, last_name, address, date_of_birth, phone_number, email, specialization,  password)

    set_instance_variables(id_number, first_name, last_name, address, date_of_birth, phone_number, email, specialization,  password)

    file = File.open("../csv/doctor.csv", "a+")

    CSV::Writer.generate(file) do |csv|
      csv << [doctor_id,id_number, first_name, last_name, address, date_of_birth, phone_number, email, specialization, password]
    end


    file.close
  end

  def set_instance_variables(id_number, first_name, last_name, address, date_of_birth, phone_number, email, specialization,  password)
    @first_name = first_name
    @last_name = last_name
    @address = address
    @date_of_birth = date_of_birth
    @phone_number = phone_number
    @email = email
    @id_number = id_number
    @specialization = specialization
    @password = password

  end

end