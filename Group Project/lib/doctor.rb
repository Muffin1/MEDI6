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
     file = File.open("../csv/doctor.csv", "w+")

     csv_contents.each do |row|
       CSV::Writer.generate(file) do |csv|
          if not(row[1] == doctor.id_number)
             csv << row
          else
             csv << [row[0],doctor.id_number, doctor.first_name, doctor.last_name, doctor.address, doctor.date_of_birth, doctor.phone_number, doctor.email, doctor.specialization, doctor.password]
          end
       end
     end
  end

  def display_doctor_data(aID)
    filename = "../csv/doctor.csv"
    record = search_by_id(aID, filename)
    puts "----------------------------"
    puts "Doctor details :\n"
    if not(record==nil)
      puts "\n"
      puts "ID number : " + record[1]
      puts "First name : " + record[2]
      puts "Last name : " + record[3]
      puts "Address : "+ record[4]
      puts "Date of birth : "+ record[5]
      puts "Phone number : "+ record[6]
      puts "Email : "+ record[7]
      puts "Speciality : " + record[8]
      puts "Password : " + record[9]
      puts "\n"
    else puts "Error! Record not found!"
    end

  end

  def display_doctor_options()
    return 'Please enter "m" to modify your details'

  end

  #comment

end