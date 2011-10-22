require 'person.rb'


class Patient < Person

  def add_patient(patient_id, doctor_id, first_name, last_name, address, date_of_birth, phone_number, email, id_number)
  file = File.open("../csv/patient.csv", "a+")

    CSV::Writer.generate(file) do |csv|
    csv << [patient_id, doctor_id, first_name, last_name, address, date_of_birth, phone_number, email, id_number]
    end
  file.close
  end


end
