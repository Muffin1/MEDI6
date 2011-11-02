require 'person.rb'
require 'doctor.rb'
require 'receptionist.rb'
require 'md5'
require 'user_account.rb'


class Admin < Person
  attr_accessor :id, :password

  def initialize()
    if(search_by_id(5000,"../csv/user.csv")==nil)
      set_privileges(5000,MD5.hexdigest("admin"),"a")
    end
  end

  def add_doctor(idNumber,firstName, lastName, address, date_of_birth ,phoneNumber, email, specialization,  password)
    doctor = Doctor.new()

    encrypted_password = MD5.hexdigest(password)
    a_id = doctor.id_generator()
    doctor.add_doctor(a_id, idNumber, firstName, lastName, address, date_of_birth, phoneNumber, email, specialization,  encrypted_password)
    doctor.set_privileges(a_id,encrypted_password,"d")

    return doctor
  end



  def add_receptionist(idNumber, firstName, lastName, address, date_of_birth, phoneNumber, email, password)
    receptionist = Receptionist.new()
    encrypted_password = MD5.hexdigest(password)
    a_id = receptionist.id_generator()

    receptionist.add_receptionist(a_id,idNumber, firstName, lastName, address, date_of_birth, phoneNumber, email, encrypted_password)
    receptionist.set_privileges(a_id, encrypted_password,"r")

    return receptionist
  end


  def select_user_to_add(option)
    answer =option
    while (true)

      if (answer=="1") then


        create_doctor()
        puts "\n"


        system("pause")
        clear_screen

        display_admin_options()
        print "Your option:> "
        answer = gets.chomp()
        if ((answer!="1" and answer!="2") or answer=="\n")
          clear_screen
          break
        end

      elsif(answer=="2") then

        create_receptionist()

        puts "\n"

        system("pause")
        clear_screen

        display_admin_options()
        print "Your option:> "
        answer = gets.chomp()
        if  ((answer!="1" and answer!="2") or answer=="\n")
          clear_screen
          break
        end

      else
        puts "\n"
        puts 'Wrong Input'

      end
    end

  end

  def display_admin_options()
    puts "\n"
    puts "Administrator options:"
    puts"--------------------------------------------------"
    puts "1)Enter (1) to register a doctor..  "
    puts "2)Enter (2) to register a receptionist.. "
    puts "3)Enter any key to logout..                      "
    puts"--------------------------------------------------"

  end



  def create_doctor()

    #------------------------------------------------------------------
    #--------------------------after refactoring--------------------------------

    clear_screen
    puts "You may now register a new doctor"
    puts"--------------------------------------------------\n"
    puts "Please provide doctor' s information below"
    puts "\n"

    details = Array.new
    index = 0
    prompts = ["Id number:> ","First name:> ","Last name:> ","Address:> ","Date of birth:> ","Telephone number:> ","Email:> ","Specialization:> ","Password:> "]

    prompts.each do |prompt|
      print prompt
      details[index] = gets.chomp()
      puts ""
      index += 1
    end

    doctor = add_doctor(details[0],details[1],details[2],details[3],details[4],details[5],details[6],details[7],details[8])
    puts "\n"
    puts"==================================================\n"
    puts  "Doctor '#{doctor.first_name}' has registered!"
    puts"--------------------------------------------------\n"
    puts "Identification details: "
    print"System id:#{doctor.system_id}\n"
    print"Password:#{details[8]}\n"
    puts"--------------------------------------------------\n"

  end

  def create_receptionist()

    #------------------------------------------------------------------
    #--------------------------after refactoring--------------------------------

    clear_screen
    puts "You may now register a new receptionist"
    puts"--------------------------------------------------\n"
    puts "Please provide receptionist' s information below"
    puts "\n"

    details = Array.new
    index = 0
    prompts = ["Id number:> ","First name:> ","Last name:> ","Address:> ","Date of birth:> ","Telephone number:> ","Email:> ","Password:> "]

    prompts.each do |prompt|
      print prompt
      details[index] = gets.chomp()
      puts ""
      index += 1
    end

    receptionist = add_receptionist(details[0],details[1],details[2],details[3],details[4],details[5],details[6],details[7])
    puts "\n"
    puts"==================================================\n"
    puts "Receptionist '#{receptionist.first_name}' has registered!"
    puts"--------------------------------------------------\n"
    puts "Identification details: "
    print"System id:#{receptionist.system_id}\n"
    print"Password:#{details[7]}\n"
    puts"--------------------------------------------------\n"

  end

end