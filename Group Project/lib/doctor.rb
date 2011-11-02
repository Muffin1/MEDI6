require 'person.rb'
require 'user_account.rb'

class Doctor < Person
  attr_accessor :specialization

  def add_doctor(doctor_id,id_number, first_name, last_name, address, date_of_birth, phone_number, email, specialization,  password)

    set_instance_variables(doctor_id,id_number, first_name, last_name, address, date_of_birth, phone_number, email, specialization,  password)

    file = File.open("../csv/doctor.csv", "a+")

    CSV::Writer.generate(file) do |csv|
      csv << [doctor_id,id_number, first_name, last_name, address, date_of_birth, phone_number, email, specialization, password]
    end

    file.close
  end

  def set_instance_variables(doctor_id,id_number, first_name, last_name, address, date_of_birth, phone_number, email, specialization,  password)
    @system_id= doctor_id
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

  def update_doctor_data(new_doctor, id)

    csv_contents = CSV.read("../csv/doctor.csv")
    file = File.open("../csv/doctor.csv", "w+")
    return_updated_row = nil

    csv_contents.each do |row|
      CSV::Writer.generate(file) do |csv|

        if not(row[0] == id)
          csv << row
        else

          if(new_doctor.id_number.nil?)
            new_doctor.id_number =row[1]
          end

          if(new_doctor.first_name.nil?)
            new_doctor.first_name =row[2]
          end
          if(new_doctor.last_name.nil?)
            new_doctor.last_name =row[3]
          end
          if(new_doctor.address.nil?)
            new_doctor.address =row[4]
          end
          if(new_doctor.date_of_birth.nil?)
            new_doctor.date_of_birth =row[5]
          end
          if(new_doctor.phone_number.nil?)
            new_doctor.phone_number =row[6]
          end
          if(new_doctor.email.nil?)
            new_doctor.email =row[7]
          end
          if(new_doctor.specialization.nil?)
            new_doctor.specialization =row[8]
          end
          if(new_doctor.password.nil?)
            new_doctor.password =row[9]
          else
            new_doctor.password = new_doctor.change_password(row[0],new_doctor.password)
          end

          return_updated_row  = [row[0] ,new_doctor.id_number, new_doctor.first_name, new_doctor.last_name, new_doctor.address, new_doctor.date_of_birth, new_doctor.phone_number, new_doctor.email, new_doctor.specialization, new_doctor.password]
          csv << [row[0] ,new_doctor.id_number, new_doctor.first_name, new_doctor.last_name, new_doctor.address, new_doctor.date_of_birth, new_doctor.phone_number, new_doctor.email, new_doctor.specialization, new_doctor.password]

        end

      end
    end
    file.close
    return_updated_row
  end

  def display_doctor_data(aID,update)
    filename = "../csv/doctor.csv"
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
      if not(record[8].nil?)
        puts "\nSpeciality    : " + record[8]
      end
      puts "\n"
      system('pause')

      clear_screen()

    else puts "\nError! Record not found!"
    end
  end

  def display_doctor_options()
    puts "\n"
    puts "Doctor options:"
    puts"--------------------------------------------------"
    puts "1)Enter (m) to modify your details..  "
    puts "2)Enter (p) to add a patient' s diagnosis.. "
    puts "3)Enter any key to logout..                      "
    puts"--------------------------------------------------"


  end

  def select_options(option, doctor_id)
    clear_screen()
    result = true
    if (option=="m") or (option=="M") then
      modify_selection = display_modify_options()

      if (modify_selection =="1" or modify_selection =="2" or modify_selection =="3" or modify_selection =="4" or modify_selection =="5" or
          modify_selection =="6" or modify_selection =="7" or modify_selection =="8" or modify_selection =="9")

        modify_selections(modify_selection,doctor_id)
        clear_screen()
        display_doctor_data(doctor_id,"true")
      else
        result = false
      end

    elsif (option=="p") or (option=="P") then
      add_exam_result_interface(doctor_id)

    end
    return result
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
    puts "Press (8) to change your Speciality.. "
    puts "Press (9) to change your Password.. "
    puts "Press any other key to exit..\n"
    puts "\n"
    print "Your option:> "
    modify_selection = gets.chomp()
    clear_screen
    return modify_selection

  end

  def modify_selections (modify_selection,system_id)
    puts "\n"
    more_changes = true
    doctor = Doctor.new

    if (modify_selection == "1")
      print "Changing ID number.. \n-------------------------\n\nPlease type the new value :> "
      doctor.id_number = gets.chomp
    elsif (modify_selection == "2")
      print "Changing First name.. \n-------------------------\n\nPlease type the new value :> "
      doctor.first_name = gets.chomp
    elsif (modify_selection == "3")
      print "Changing Last name.. \n-------------------------\n\nPlease type the new value :> "
      doctor.last_name = gets.chomp
    elsif (modify_selection == "4")
      print "Changing Address.. \n-------------------------\n\nPlease type the new value :> "
      doctor.address = gets.chomp
    elsif (modify_selection == "5")
      print "Changing Date of birth.. \n-------------------------\n\nPlease type the new value :> "
      doctor.date_of_birth = gets.chomp
    elsif (modify_selection == "6")
      print "Changing Phone number.. \n-------------------------\n\nPlease type the new value :> "
      doctor.phone_number = gets.chomp
    elsif (modify_selection == "7")
      print "Changing Email.. \n-------------------------\n\nPlease type the new value :> "
      doctor.email = gets.chomp
    elsif (modify_selection == "8")
      print "Changing Speciality.. \n-------------------------\n\nPlease type the new value :> "
      doctor.specialization = gets.chomp
    elsif (modify_selection == "9")
      print "Changing Password.. \n-------------------------\n\nPlease type the new value :> "
      doctor.password = gets.chomp
    else more_changes=false
    end

    #Call update_doctor_data to update the doctor record with the new values
    update_doctor_data(doctor, system_id)

    if (more_changes)
      puts"\n"
      print "Do you want to make other changes? (Y/N) :>"
      selection = gets.chomp()
      clear_screen()
      if selection == "y" or selection == "Y"
        modify_selection = display_modify_options()
        modify_selections(modify_selection, system_id)
      end
    end
  end

  def add_exam_result(patient_system_id, doctor_system_id, exam_results)

    csv_contents = CSV.read("../csv/patient.csv")
    file = File.open("../csv/patient.csv", "w+")
    inserted = "false"

    csv_contents.each do |row|

      if (row[0]==patient_system_id.to_s && row[1]== 'nil')

        inserted="true"
        CSV::Writer.generate(file) do |csv|
          csv <<  [patient_system_id,doctor_system_id,row[2], row[3], row[4], row[5], row[6], row[7], row[8],exam_results]
        end
      else
        CSV::Writer.generate(file) do |csv|
          csv << row
        end
      end
    end
    file.close


    if(inserted=="false")
      csv_contents = CSV.read("../csv/patient.csv")
      file = File.open("../csv/patient.csv", "w+")


      csv_contents.each do |row|
        if (row[0]==patient_system_id.to_s && row[1]== doctor_system_id.to_s)
          inserted="true"

          CSV::Writer.generate(file) do |csv|
            csv <<  [patient_system_id,doctor_system_id,row[2], row[3], row[4], row[5], row[6], row[7], row[8],exam_results]
          end
        else
          CSV::Writer.generate(file) do |csv|
            csv << row
          end
        end
      end
      file.close
    end

    if(inserted=="false")
      puts "Error:Invalid data input!"
      puts "-------------------------"
      puts "Possible causes:"
      puts "\n"
      puts "1)Patient is not registered to the system."
      puts "2)Incorrect patient system id."
      puts("\n")
      system('pause')
    else
      puts "----------------------------------------"
      puts "Diagnosis for patient with system id: " +patient_system_id
      puts "\n"
      puts "Diagnosis results : "+exam_results
      puts("\n")
      system('pause')
      end
  end

  def add_exam_result_interface(doctor_id)
    puts "Insert exam results to patient record:"
    puts"---------------------------------------"
    puts"\n"
    print "Insert Patient system id :>"
    patient_id = gets.chomp
    puts"\n"

    print "Insert your diagnosis :>"
    diagnosis = gets.chomp
    puts"\n"
    add_exam_result(patient_id,doctor_id,diagnosis)
  end
end

