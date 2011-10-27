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

  def update_doctor_data(doctor)
 csv_contents = CSV.read("../csv/doctor.csv")
 old_data = Array.new
 csv_contents.each do |row|
      if(row[1] == doctor.id_number)
       old_data = [row[1],row[2],row[3],row[4],row[5],row[6],row[7],row[8],row[9]]
      end
    end
 # file = File.open("../csv/doctor.csv", "a+")

  new_data = [doctor.id_number, doctor.first_name, doctor.last_name,doctor.address,doctor.date_of_birth, doctor.phone_number,doctor.email,doctor.specialization, doctor.password]
  counter = 0;
   new_data.each do |data|
     counter += 1
     if not(data == nil)  then
       new_data[counter] =  old_data[counter]
     end
   end

     return old_data
  end

end