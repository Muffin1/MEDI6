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

  def update_doctor_data(doctor, id)

    csv_contents = CSV.read("../csv/doctor.csv")
    old_data = Array.new
    csv_contents.each do |row|
      if(row[0] == id)
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
    puts 'Please enter "m" to modify your details'
  end

  def modify_details(modify_data, doctor_id)
    if (modify_data=="m") or (modify_data=="M") then
      modify_selection = display_modify_options()

      if (modify_selection =="1" or modify_selection =="2" or modify_selection =="3" or modify_selection =="4" or modify_selection =="5" or
          modify_selection =="6" or modify_selection =="7" or modify_selection =="8" or modify_selection =="9")

        modify_selections(modify_selection,doctor_id)
      end

    end
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
    puts "Press (8) to change your Speciality.. "
    puts "Press (9) to change your Password.. "
    puts "Press any other key to exit.."

    modify_selection = gets.chomp()
    return modify_selection

  end

  def modify_selections (modify_selection,doctor_id)
    puts "\n"
    more_changes = true
    doctor = Doctor.new

    if (modify_selection == "1")
      puts "Changing ID number.. Please type the new value :"
      doctor.id_number = gets.chomp
    elsif (modify_selection == "2")
      puts "Changing First name.. Please type the new value :"
      doctor.first_name = gets.chomp
    elsif (modify_selection == "3")
      puts "Changing Last name.. Please type the new value :"
      doctor.last_name = gets.chomp
    elsif (modify_selection == "4")
      puts "Changing Address.. Please type the new value :"
      doctor.address = gets.chomp
    elsif (modify_selection == "5")
      puts "Changing Date of birth.. Please type the new value :"
      doctor.date_of_birth = gets.chomp
    elsif (modify_selection == "6")
      puts "Changing Phone number.. Please type the new value :"
      doctor.phone_number = gets.chomp
    elsif (modify_selection == "7")
      puts "Changing Email.. Please type the new value :"
      doctor.email = gets.chomp
    elsif (modify_selection == "8")
      puts "Changing Speciality.. Please type the new value :"
      doctor.specialization = gets.chomp
    elsif (modify_selection == "9")
      puts "Changing Password.. Please type the new value :"
      doctor.password = gets.chomp
    else more_changes=false
    end

    #TODO Here we should call the method to update the record
    update_doctor_data(doctor, id_number)

    if (more_changes)
      puts"\n"
      puts "Do you want to make other changes? (Y/N) "
      selection = gets.chomp()
      if selection == "y" or selection == "Y"
        modify_selection = display_modify_options()
        modify_selections(modify_selection, doctor_id)
      end
    end
  end

end