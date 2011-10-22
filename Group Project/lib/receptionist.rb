require 'person.rb'
require 'patient.rb'
require 'csv'

class Receptionist < Person

  def add_patient(first_name, last_name, address, date_of_birth, phone_number, email, id_number)

    patient = Patient.new

    a_id = patient.id_generator()

    patient.add_patient(a_id, "nil", first_name, last_name, address, date_of_birth, phone_number, email, id_number)
  end

  def add_reception(receptionist_id,id_number, first_name, last_name, address, phone_number, password)

    file = File.open("../csv/receptionist.csv", "a+")

    CSV::Writer.generate(file) do |csv|
    csv << [receptionist_id,id_number, first_name, last_name, address, phone_number, password]
    end

  file.close
end

end
