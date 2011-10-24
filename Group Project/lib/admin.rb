require 'person.rb'
require 'doctor.rb'
require 'receptionist.rb'


class Admin < Person
  attr_accessor :id, :password

  def initialize()

  end

  def add_doctor(idNumber,firstName, lastName, address, date_of_birth ,phoneNumber, email, specialization,  password)
    doctor = Doctor.new()

    a_id = doctor.id_generator()

    doctor.add_doctor(a_id, idNumber, firstName, lastName, address, date_of_birth, phoneNumber, email, specialization,  password)
    doctor.set_privileges(a_id,password,"d")

    return doctor
  end

  def delete_doctor(doctor)

  end

  def add_receptionist(idNumber, firstName, lastName, address, phoneNumber, password)
    receptionist = Receptionist.new()

    a_id = receptionist.id_generator()

    receptionist.add_receptionist(a_id,idNumber, firstName, lastName, address, phoneNumber, password)
    receptionist.set_privileges(a_id, password,"r")
  end

  def deleteReceptionist(receptionist)

  end


  def select_user_to_add(option)
    if (option == "1") then
      create_doctor()

    elsif(option == "2") then

      return "Adding a receptionist.."

    else
      puts "\n"
      puts 'Wrong Input'
      #select_user_to_add(option)
    end

  end

  def display_admin_options()
    return 'Please enter "1" to add a doctor or "2" to add a receptionist'
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

end