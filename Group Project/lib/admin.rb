require 'person.rb'
require 'doctor.rb'
require 'receptionist.rb'
require 'md5'


class Admin < Person
  attr_accessor :id, :password

  def initialize()

  end

  def add_doctor(idNumber,firstName, lastName, address, date_of_birth ,phoneNumber, email, specialization,  password)
    doctor = Doctor.new()

    encrypted_password = MD5.hexdigest(password)
    a_id = doctor.id_generator()
    doctor.add_doctor(a_id, idNumber, firstName, lastName, address, date_of_birth, phoneNumber, email, specialization,  encrypted_password)
    doctor.set_privileges(a_id,encrypted_password,"d")

    return doctor
  end

  def delete_doctor(doctor)

  end

  def add_receptionist(idNumber, firstName, lastName, address, date_of_birth, phoneNumber, email, password)
    receptionist = Receptionist.new()
    encrypted_password = MD5.hexdigest(password)
    a_id = receptionist.id_generator()

    receptionist.add_receptionist(a_id,idNumber, firstName, lastName, address, date_of_birth, phoneNumber, email, encrypted_password)
    receptionist.set_privileges(a_id, encrypted_password,"r")

    return receptionist
  end

  def deleteReceptionist(receptionist)

  end

  def select_user_to_add(option)

    while (true)

      if (option == "1") then


        create_doctor()
        puts "\n"
        puts "----------------------"
        puts "\n"
        puts 'add another doctor : press "y" or "n" to exit'
        answer = gets.chomp()
        if  (answer=="n")
          break

        end

      elsif(option == "2") then

        create_receptionist()
        puts "\n"
        puts "----------------------"
        puts "\n"
        puts 'add another receptionist : press "y" or "n" to exit'
        answer = gets.chomp()
        if  (answer=="n")
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
    puts "1)Please enter 1 to add a doctor.."
    puts "2)Please enter 2 to add a receptionist.."
    puts "3)Press any key to logout.."
  end

  def create_doctor()
    puts "Adding a doctor.."
    puts "Please provide the values.."
    puts "\n"
    puts "doctor id number: "
    id = gets.chomp()
    puts "doctor first name: "
    first_name = gets.chomp()
    puts "doctor last name: "
    last_name  = gets.chomp()
    puts "doctor address: "
    address = gets.chomp()
    puts "doctor date of birth: "
    date_of_birth = gets.chomp()
    puts "doctor phone number: "
    phone_number = gets.chomp()
    puts "doctor email: "
    email = gets.chomp()
    puts "doctor specialization: "
    specialization = gets.chomp()
    puts "doctor password"
    password = gets.chomp()

    add_doctor(id,first_name, last_name, address, date_of_birth ,phone_number, email, specialization,  password)
    puts "\n"
    puts  "Doctor #{first_name} added!"

  end

  def create_receptionist()
    puts "Adding a receptionist.."
    puts "Please provide the values.."
    puts "\n"
    puts "receptionist id number: "
    id = gets.chomp()
    puts "receptionist first name: "
    first_name = gets.chomp()
    puts "receptionist last name: "
    last_name  = gets.chomp()
    puts "receptionist address: "
    address = gets.chomp()
    puts "receptionist date of birth: "
    date_of_birth = gets.chomp()
    puts "receptionist phone number: "
    phone_number = gets.chomp()
    puts "receptionist email: "
    email = gets.chomp()
    puts "receptionist password"
    password = gets.chomp()

    add_receptionist(id,first_name, last_name, address, date_of_birth ,phone_number, email, password)
    puts "\n"
    puts  "Receptionist #{first_name} added!"

  end


end