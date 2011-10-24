require 'person.rb'
require 'patient.rb'
require 'csv'

class Receptionist < Person

  def add_patient(first_name, last_name, address, date_of_birth, phone_number, email, id_number)

    patient = Patient.new

    a_id = patient.id_generator()

    patient.add_patient(a_id, "nil", first_name, last_name, address, date_of_birth, phone_number, email, id_number)
  end

  def add_receptionist(receptionist_id,id_number, first_name, last_name, address, date_of_birth, phone_number, email, password)

    set_instance_variables(id_number, first_name, last_name, address, date_of_birth, phone_number, email, password)

    file = File.open("../csv/receptionist.csv", "a+")

    CSV::Writer.generate(file) do |csv|
    csv << [receptionist_id,id_number, first_name, last_name, address, date_of_birth, phone_number, email, password]
    end

  file.close
  end

def set_instance_variables(id_number, first_name, last_name, address, date_of_birth, phone_number, email,  password)
  @first_name = first_name
  @last_name = last_name
  @address = address
  @date_of_birth = date_of_birth
  @phone_number = phone_number
  @email = email
  @id_number = id_number
  @password = password

end

end
