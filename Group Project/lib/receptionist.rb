require 'person.rb'
require 'patient.rb'
require 'csv'
require 'user_account.rb'

class Receptionist < Person

  def add_patient(first_name, last_name, address, date_of_birth, phone_number, email, id_number)

    patient = Patient.new

    a_id = patient.id_generator()

    patient.add_patient(a_id, "nil", first_name, last_name, address, date_of_birth, phone_number, email, id_number)
    return patient
  end

  def add_receptionist(receptionist_id,id_number, first_name, last_name, address, date_of_birth, phone_number, email, password)

    set_instance_variables(receptionist_id,id_number, first_name, last_name, address, date_of_birth, phone_number, email, password)

    file = File.open("../csv/receptionist.csv", "a+")

    CSV::Writer.generate(file) do |csv|
      csv << [receptionist_id,id_number, first_name, last_name, address, date_of_birth, phone_number, email, password]
    end

    file.close
  end

  def set_instance_variables(receptionist_id,id_number, first_name, last_name, address, date_of_birth, phone_number, email,  password)
    @system_id = receptionist_id
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


  def update_patient_data(patient, id)
    csv_contents = CSV.read("../csv/patient.csv")
    file = File.open("../csv/patient.csv", "w+")

    return_updated_row=nil

    csv_contents.each do |row|
      CSV::Writer.generate(file) do |csv|

        if not(row[0] == id.to_s)
          csv << row
        else

          if(patient.first_name.nil?)
            patient.first_name =row[2]
          end
          if(patient.last_name.nil?)
            patient.last_name =row[3]
          end
          if(patient.address.nil?)
            patient.address =row[4]
          end
          if(patient.date_of_birth.nil?)
            patient.date_of_birth =row[5]
          end
          if(patient.phone_number.nil?)
            patient.phone_number =row[6]
          end
          if(patient.email.nil?)
            patient.email =row[7]
          end
          if(patient.id_number.nil?)
            patient.id_number =row[8]
          end


          return_updated_row  = [row[0] ,row[1], patient.first_name, patient.last_name, patient.address, patient.date_of_birth,patient.phone_number,patient.email,patient.id_number]
          csv << [row[0] ,row[1], patient.first_name, patient.last_name, patient.address, patient.date_of_birth,patient.phone_number,patient.email,patient.id_number]
        end
      end
    end
    file.close
    return_updated_row
  end

  def display_modify_options()
    puts"\n"
    puts"Please select the following keys to modify your data :"
    puts "-------------------------------------------------------\n"
    puts "Press (1) to change your ID number.. "
    puts "Press (2) to change your First name.. "
    puts "Press (3) to change your Last name.. "
    puts "Press (4) to change your Address.. "
    puts "Press (5) to change your Date of birth.. "
    puts "Press (6) to change your Phone number.. "
    puts "Press (7) to change your Email.. "
    puts "Press (8) to change your Password.. "
    puts "Press any other key to exit..\n"
    puts "\n"
    print "Your option:> "
    modify_selection = gets.chomp()
    clear_screen
    return modify_selection

  end

  def display_edit_patient_options()
    puts"\n"
    puts"Please select the following keys to modify patient' s data :"
    puts "-----------------------------------------------------------\n"

    puts "Press (1) to change patient' s First name.. "
    puts "Press (2) to change patient' s Last name.. "
    puts "Press (3) to change patient' s Address.. "
    puts "Press (4) to change patient' s Date of birth.. "
    puts "Press (5) to change patient' s Phone number.. "
    puts "Press (6) to change patient' s Email.. "
    puts "Press (7) to change patient' s ID number.. "
    puts "Press any other key to exit..\n"
    puts "\n"
    print "Your option:> "
    modify_selection = gets.chomp()
    clear_screen
    return modify_selection

  end

  def display_receptionist_options()

    puts "\n"
    puts "Receptionist options:"
    puts"------------------------------------------------------------------------"
    puts "1)Enter (m) to modify your details..  "
    puts "2)Enter (a) to add a new patient to the system.. "
    puts "3)Enter (e) to edit information of an existing patient in the system.."
    puts "4)Enter any key to logout..                      "
    puts"------------------------------------------------------------------------"

  end

  def display_receptionist_data(aID, update)
    filename = "../csv/receptionist.csv"
    record = search_by_id(aID, filename)


    if(update=="false")
      puts "\nYour details :\n"
      puts"--------------------------------------------------"
    else
      puts "\nYour updated details :\n"
      puts"--------------------------------------------------"
    end
    if not(record==nil)
      puts "\n"
      if not(record[1].nil?)
        puts "ID number     : " + record[1]
      end

      if not(record[2].nil?)
        puts "\nFirst name    : " + record[2]
      end
      if not(record[3].nil?)
        puts "\nLast name     : " + record[3]
      end
      if not(record[4].nil?)
        puts "\nAddress       : "+ record[4]
      end
      if not(record[5].nil?)
        puts "\nDate of birth : "+ record[5]
      end
      if not(record[6].nil?)
        puts "\nPhone number  : "+ record[6]
      end
      if not(record[7].nil?)
        puts "\nEmail         : "+ record[7]
      end

      puts "\n"
      system('pause')

      clear_screen()

    else puts "\nError! Record not found!"
    end
  end

  def display_patient_data(aID, update)
    filename = "../csv/patient.csv"
    record = search_by_id(aID, filename)

    if(update=="false")
      puts "\nPatient details :\n"
      puts"--------------------------------------------------"
    else
      puts "\nUpdated patient details :\n"
      puts"--------------------------------------------------"
    end
    if not(record==nil)
      puts "\n"

      puts "System id number  : "+ aID.to_s

      if not(record[8].nil?)
        puts "Id number         : "+ record[8]
      end
      if not(record[2].nil?)
        puts "First name        : " + record[2]
      end
      if not(record[3].nil?)
        puts "Last name         : " + record[3]
      end
      if not(record[4].nil?)
        puts "Address           : "+ record[4]
      end
      if not(record[5].nil?)
        puts "Date of birth     : "+ record[5]
      end
      if not(record[6].nil?)
        puts "Phone number      : "+ record[6]
      end
      if not(record[7].nil?)
        puts "Email             : "+ record[7]
      end


      puts "\n"
      system('pause')

      clear_screen()

    else puts "Error! Record not found!"
    end
  end

  def select_options (option,receptionist_id)

    result = true
    if (option=="m") or (option=="M") then
      modify_selection = display_modify_options()

      if (modify_selection =="1" or modify_selection =="2" or modify_selection =="3" or modify_selection =="4" or modify_selection =="5" or
          modify_selection =="6" or modify_selection =="7" or modify_selection =="8")

        modify_selections(modify_selection,receptionist_id)
        clear_screen()
        display_receptionist_data(receptionist_id,"true")
      else
        result= false
      end

    elsif (option=="a") or (option=="A") then
      clear_screen()
      puts "Insert patient' s information below:"
      puts "---------------------------------"
      puts "\n"
      print "First name :> "
      first_name = gets.chomp
      puts "\n"
      print "Last name :> "
      last_name = gets.chomp
      puts "\n"
      print "Address :> "
      address = gets.chomp
      puts "\n"
      print "Date of birth :> "
      date_of_birth = gets.chomp
      puts "\n"
      print "Telephone number :> "
      phone_number = gets.chomp
      puts "\n"
      print "Email :> "
      email = gets.chomp
      puts "\n"
      print "Id number :"
      id_number = gets.chomp
      puts "\n"
      patient = add_patient(first_name, last_name, address, date_of_birth, phone_number, email, id_number)
      clear_screen()
      display_patient_data(patient.system_id,"false")

    elsif (option=="e") or (option=="E") then
      clear_screen()
      puts "Edit patient' s information below:"
      puts "---------------------------------"
      puts "\n"

      print "Insert patient' s id number :> "
      patient_id = gets.chomp

      display_patient_data(patient_id,"false")

      edit_selection = display_edit_patient_options()

      if (edit_selection =="1" or edit_selection =="2" or edit_selection =="3" or edit_selection =="4" or edit_selection =="5" or
          edit_selection =="6" or edit_selection =="7" )

        edit_patient(edit_selection,patient_id)
        clear_screen()
        display_patient_data(patient_id,"true")
      end

    end

    return result
  end

  def modify_selections (modify_selection,system_id)
    puts "\n"
    more_changes = true
    receptionist = Receptionist.new

    if (modify_selection == "1")
      print "Changing ID number.. \n-------------------------\n\nPlease type the new value :> "
      receptionist.id_number = gets.chomp
    elsif (modify_selection == "2")
      print "Changing First name.. \n-------------------------\n\nPlease type the new value :> "
      receptionist.first_name = gets.chomp
    elsif (modify_selection == "3")
      print "Changing Last name.. \n-------------------------\n\nPlease type the new value :> "
      receptionist.last_name = gets.chomp
    elsif (modify_selection == "4")
      print "Changing Address.. \n-------------------------\n\nPlease type the new value :> "
      receptionist.address = gets.chomp
    elsif (modify_selection == "5")
      print "Changing Date of birth.. \n-------------------------\n\nPlease type the new value :> "
      receptionist.date_of_birth = gets.chomp
    elsif (modify_selection == "6")
      print "Changing Phone number.. \n-------------------------\n\nPlease type the new value :> "
      receptionist.phone_number = gets.chomp
    elsif (modify_selection == "7")
      print "Changing Email.. \n-------------------------\n\nPlease type the new value :> "
      receptionist.email = gets.chomp
    elsif (modify_selection == "8")
      print "Changing Password.. \n-------------------------\n\nPlease type the new value :> "
      receptionist.password = gets.chomp
    else more_changes=false
    end

    #Call update_receptionist_data to update the doctor record with the new values
    update_receptionist_data(receptionist, system_id)

    if (more_changes)
      puts"\n"
      print "Do you want to make other changes? (Y/N) :> "
      selection = gets.chomp()
      clear_screen()
      if selection == "y" or selection == "Y"
        modify_selection = display_modify_options()
        modify_selections(modify_selection, system_id)
      end

    end
  end

  def edit_patient (modify_selection,system_id)
    puts "\n"
    more_changes = true
    patient = Patient.new

    if (modify_selection == "1")
      print "Changing patient' s first name..\n-------------------------\n\nPlease type the new value :> "
      patient.first_name = gets.chomp
    elsif (modify_selection == "2")
      print "Changing  patient' s last name..\n-------------------------\n\nPlease type the new value :> "
      patient.last_name = gets.chomp
    elsif (modify_selection == "3")
      print "Changing patient' s address..\n-------------------------\n\nPlease type the new value :> "
      patient.address = gets.chomp
    elsif (modify_selection == "4")
      print "Changing patient' s date of birth..\n-------------------------\n\nPlease type the new value :> "
      patient.date_of_birth = gets.chomp
    elsif (modify_selection == "5")
      print "Changing patient' s phone number..\n-------------------------\n\nPlease type the new value :> "
      patient.phone_number = gets.chomp
    elsif (modify_selection == "6")
      print "Changing patient' s email..\n-------------------------\n\nPlease type the new value :> "
      patient.email = gets.chomp
    elsif (modify_selection == "7")
      print "Changing patient' s id number..\n-------------------------\n\nPlease type the new value :> "
      patient.id_number = gets.chomp
    else more_changes=false
    end

    update_patient_data(patient, system_id)

    if (more_changes)
      puts"\n"
      print "Do you want to make other changes? (Y/N):> "
      selection = gets.chomp()
      clear_screen()
      if selection == "y" or selection == "Y"
        edit_selection = display_edit_patient_options()
        edit_patient(modify_selection, system_id)
      end

    end
  end

end
