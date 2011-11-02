require 'person.rb'


class Patient < Person
  attr_accessor :doctor_id

  def add_patient(patient_id, doctor_id, first_name, last_name, address, date_of_birth, phone_number, email, id_number)
  file = File.open("../csv/patient.csv", "a+")

    set_instance_variables(patient_id, doctor_id, first_name, last_name, address, date_of_birth, phone_number, email, id_number)
    CSV::Writer.generate(file) do |csv|
    csv << [patient_id, doctor_id, first_name, last_name, address, date_of_birth, phone_number, email, id_number]
    end
  file.close
  end

    def set_instance_variables(patient_id, doctor_id, first_name, last_name, address, date_of_birth, phone_number, email, id_number)
    @system_id = patient_id
    @doctor_id = doctor_id
    @first_name = first_name
    @last_name = last_name
    @address = address
    @date_of_birth = date_of_birth
    @phone_number = phone_number
    @email = email
    @id_number = id_number


  end


end
