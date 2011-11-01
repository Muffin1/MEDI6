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

    return_updated_row=nil

    csv_contents.each do |row|
      CSV::Writer.generate(file) do |csv|

        if not(row[0] == id)
          csv << row
        else

          if(new_receptionist.id_number.nil?)
            new_receptionist.id_number =row[1]
          end
          if(new_receptionist.first_name.nil?)
            new_receptionist.first_name =row[2]
          end
          if(new_receptionist.last_name.nil?)
            new_receptionist.last_name =row[3]
          end
          if(new_receptionist.address.nil?)
            new_receptionist.address =row[4]
          end
          if(new_receptionist.date_of_birth.nil?)
            new_receptionist.date_of_birth =row[5]
          end
          if(new_receptionist.phone_number.nil?)
            new_receptionist.phone_number =row[6]
          end
          if(new_receptionist.email.nil?)
            new_receptionist.email =row[7]
          end
          if (new_receptionist.password.nil?)
            new_receptionist.password = row[8]
          else
            new_receptionist.password = new_receptionist.change_password(row[0],new_receptionist.password)
          end
          return_updated_row  = [row[0] ,new_receptionist.id_number, new_receptionist.first_name, new_receptionist.last_name, new_receptionist.address, new_receptionist.date_of_birth, new_receptionist.phone_number, new_receptionist.email, new_receptionist.password]
          csv << [row[0] ,new_receptionist.id_number, new_receptionist.first_name, new_receptionist.last_name, new_receptionist.address, new_receptionist.date_of_birth, new_receptionist.phone_number, new_receptionist.email, new_receptionist.password]
        end
      end
    end
    file.close
    return_updated_row
  end

  def display_modify_options()
    puts"\n"
    puts"Please select the following keys to modify your data :"
    puts "Press (1) to change your ID number.. "
    puts "Press (2) to change your First name.. "
    puts "Press (3) to change your Last name.. "
    puts "Press (4) to change your Address.. "
    puts "Press (5) to change your Date of birth.. "
    puts "Press (6) to change your Phone number.. "
    puts "Press (7) to change your Email.. "
    puts "Press (8) to change your Password.. "
    puts "Press any other key to exit.."

    modify_selection = gets.chomp()
    return modify_selection

  end

  def display_receptionist_options()
    puts 'Options:/n-------------------'
    puts '1)Please enter "m" to modify your details.'
    puts "2)Please enter 'a' to add a new patient to the system."
    puts "3)Please enter 'e' to edit information of an existing patient in the system."

  end

 def display_receptionist_data(aID)
    filename = "../csv/receptionist.csv"
    record = search_by_id(aID, filename)

    puts "----------------------------"
    puts "Receptionist details :\n"
    if not(record==nil)
      puts "\n"
      if not(record[1].nil?)
        puts "ID number : " + record[1]
      end

      if not(record[2].nil?)
        puts "First name : " + record[2]
      end
      if not(record[3].nil?)
        puts "Last name : " + record[3]
      end
      if not(record[4].nil?)
        puts "Address : "+ record[4]
      end
      if not(record[5].nil?)
        puts "Date of birth : "+ record[5]
      end
      if not(record[6].nil?)
        puts "Phone number : "+ record[6]
      end
      if not(record[7].nil?)
        puts "Email : "+ record[7]
      end
      if not(record[8].nil?)
        puts "Password : " + record[8]
      end
      puts "\n"

    else puts "Error! Record not found!"
    end
  end

  def select_options (option,receptionist_id)
    if (option=="m") or (option=="M") then
      modify_selection = display_modify_options()

      if (modify_selection =="1" or modify_selection =="2" or modify_selection =="3" or modify_selection =="4" or modify_selection =="5" or
          modify_selection =="6" or modify_selection =="7" or modify_selection =="8")

        modify_selections(modify_selection,receptionist_id)
      end

    elsif (option=="a") or (option=="A") then
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
    elsif (option=="e") or (option=="E") then
    end
  end

  def modify_selections (modify_selection,system_id)
    puts "\n"
    more_changes = true
    receptionist = Receptionist.new

    if (modify_selection == "1")
      puts "Changing ID number.. Please type the new value :"
      receptionist.id_number = gets.chomp
    elsif (modify_selection == "2")
      puts "Changing First name.. Please type the new value :"
      receptionist.first_name = gets.chomp
    elsif (modify_selection == "3")
      puts "Changing Last name.. Please type the new value :"
      receptionist.last_name = gets.chomp
    elsif (modify_selection == "4")
      puts "Changing Address.. Please type the new value :"
      receptionist.address = gets.chomp
    elsif (modify_selection == "5")
      puts "Changing Date of birth.. Please type the new value :"
      receptionist.date_of_birth = gets.chomp
    elsif (modify_selection == "6")
      puts "Changing Phone number.. Please type the new value :"
      receptionist.phone_number = gets.chomp
    elsif (modify_selection == "7")
      puts "Changing Email.. Please type the new value :"
      receptionist.email = gets.chomp
    elsif (modify_selection == "8")
      puts "Changing Password.. Please type the new value :"
      receptionist.password = gets.chomp
    else more_changes=false
    end

    #Call update_receptionist_data to update the doctor record with the new values
    update_receptionist_data(receptionist, system_id)

    if (more_changes)
      puts"\n"
      puts "Do you want to make other changes? (Y/N) "
      selection = gets.chomp()
      if selection == "y" or selection == "Y"
        modify_selection = display_modify_options()
        modify_selections(modify_selection, system_id)
      end
    end
  end

end
