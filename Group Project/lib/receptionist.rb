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


  def update_receptionist_data(new_receptionist, id)
    csv_contents = CSV.read("../csv/receptionist.csv")
    file = File.open("../csv/receptionist.csv", "w+")

    csv_contents.each do |row|
      CSV::Writer.generate(file) do |csv|

        if not(row[0] == id)
          csv << row
        else

          if(new_receptionist.id_number == nil)
            new_receptionist.id_number =row[1]
          end
          if(new_receptionist.first_name == nil)
            new_receptionist.first_name =row[2]
          end
          if(new_receptionist.last_name == nil)
            new_receptionist.last_name =row[3]
          end
          if(new_receptionist.address == nil)
            new_receptionist.address =row[4]
          end
          if(new_receptionist.date_of_birth == nil)
            new_receptionist.date_of_birth =row[5]
          end
          if(new_receptionist.phone_number == nil)
            new_receptionist.phone_number =row[6]
          end
          if(new_receptionist.email == nil)
            new_receptionist.email =row[7]
          end
          if(new_receptionist.password == nil)
            new_receptionist.password = new_receptionist.change_password(row[0],row[8])
          end
          csv << [row[0] ,new_receptionist.id_number, new_receptionist.first_name, new_receptionist.last_name, new_receptionist.address, new_receptionist.date_of_birth, new_receptionist.phone_number, new_receptionist.email, new_receptionist.password]
        end
      end
    end
    file.close

  end

  def display_receptionist_options()
    puts 'Options:/n-------------------'
    puts '1)Please enter "m" to modify your details.'
    puts "2)Please enter 'a' to add a new patient to the system."
    puts "3)Please enter 'e' to edit information of an existing patient in the system."

  end

  def select_options (option,receptionist_id)
    if (option=="m") or (option=="M") then


    elsif (option=="a") or (modify_data=="A") then
        puts "Patient' s first name :"
        first_name = gets.chomp

        puts "Patient' s last name :"
        last_name = gets.chomp

        puts "Patient' s address :"
        address = gets.chomp

        puts "Patient' s date of birth :"
        date_of_birth = gets.chomp

        puts "Patient' s telephone number :"
        phone_number = gets.chomp

        puts "Patient' s email :"
        email = gets.chomp

        puts "Patient' s id number :"
        id_number = gets.chomp

        add_patient(first_name, last_name, address, date_of_birth, phone_number, email, id_number)
    elsif (option=="e") or (modify_data=="E") then
    end
  end
end
