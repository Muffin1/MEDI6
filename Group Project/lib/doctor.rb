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

def update_doctor_data(new_doctor, id)

    csv_contents = CSV.read("../csv/doctor.csv")
    file = File.open("../csv/doctor.csv", "w+")
    return_updated_row = nil

    return_updated_row=nil
    csv_contents.each do |row|
      CSV::Writer.generate(file) do |csv|

        if not(row[0] == id)
          csv << row
        else

          if(new_doctor.id_number == nil)
            new_doctor.id_number =row[1]
          end

          if(new_doctor.first_name == nil)
            new_doctor.first_name =row[2]
          end
          if(new_doctor.last_name == nil)
            new_doctor.last_name =row[3]
          end
          if(new_doctor.address == nil)
            new_doctor.address =row[4]
          end
          if(new_doctor.date_of_birth == nil)
            new_doctor.date_of_birth =row[5]
          end
          if(new_doctor.phone_number == nil)
            new_doctor.phone_number =row[6]
          end
          if(new_doctor.email == nil)
            new_doctor.email =row[7]
          end
          if(new_doctor.specialization == nil)
            new_doctor.specialization =row[8]
          end
          if(new_doctor.password == nil)
            new_doctor.password =row[9]
          end
          return_updated_row  = [row[0] ,new_doctor.id_number, new_doctor.first_name, new_doctor.last_name, new_doctor.address, new_doctor.date_of_birth, new_doctor.phone_number, new_doctor.email, new_doctor.specialization, new_doctor.password]
          csv << [row[0] ,new_doctor.id_number, new_doctor.first_name, new_doctor.last_name, new_doctor.address, new_doctor.date_of_birth, new_doctor.phone_number, new_doctor.email, new_doctor.specialization, new_doctor.password]

        end


      end
    end
    file.close
    return_updated_row
    end


    def display_doctor_data(aID)
      filename = "../csv/doctor.csv"
      record = search_by_id(aID, filename)

      puts "----------------------------"
      puts "Doctor details :\n"
      if not(record==nil)
        puts "\n"
        if not(record[1] == nil)
          puts "ID number : " + record[1]
        end
        if not(record[2] == nil)
          puts "First name : " + record[2]
        end
        if not(record[3] == nil)
          puts "Last name : " + record[3]
        end
        if not(record[4] == nil)
          puts "Address : "+ record[4]
        end
        if not(record[5] == nil)
          puts "Date of birth : "+ record[5]
        end
        if not(record[6] == nil)
          puts "Phone number : "+ record[6]
        end
        if not(record[7] == nil)
          puts "Email : "+ record[7]
        end
        if not(record[8] == nil)
          puts "Speciality : " + record[8]
        end
        if not(record[9] == nil)
          puts "Password : " + record[9]
        end
        puts "\n"

      else puts "Error! Record not found!"

      end
    end

    def display_doctor_options()
      puts 'Options:/n-------------------'
      puts '1)Please enter "m" to modify your details.'
      puts "2)Please enter 'p' to add a patient' s diagnosis."
    end

    def select_options(option, doctor_id)
      if (option=="m") or (option=="M") then
        modify_selection = display_modify_options()

        if (modify_selection =="1" or modify_selection =="2" or modify_selection =="3" or modify_selection =="4" or modify_selection =="5" or
            modify_selection =="6" or modify_selection =="7" or modify_selection =="8" or modify_selection =="9")

          modify_selections(modify_selection,doctor_id)
        end

      elsif (option=="p") or (modify_data=="P") then
        add_exam_result_interface()
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


    def modify_selections (modify_selection,system_id)
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

      #Call update_doctor_data to update the doctor record with the new values
      update_doctor_data(doctor, system_id)

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

    def add_exam_result(patient_system_id, doctor_system_id, exam_results)

      csv_contents = CSV.read("../csv/patient.csv")
      file = File.open("../csv/patient.csv", "w+")
      inserted = false

      csv_contents.each do |row|

        if (row[0]==patient_system_id.to_s && row[1]== 'nil')

          inserted=true
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


      if(inserted==false)
        csv_contents = CSV.read("../csv/patient.csv")
        file = File.open("../csv/patient.csv", "w+")


        csv_contents.each do |row|
          if (row[0]==patient_system_id.to_s && row[1]== doctor_system_id.to_s)
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

    end

    def add_exam_result_interface()
      puts "Insert Patient system id :"
      patient_id = gets.chomp

      puts "Insert Doctor system id :"
      doctor_id = gets.chomp

      puts "Insert your diagnosis :"
      diagnosis = gets.chomp

      add_exam_result(patient_id,doctor_id,diagnosis)
    end
  end

