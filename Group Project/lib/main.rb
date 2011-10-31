require 'user_account.rb'
require 'admin.rb'
require "doctor.rb"
require 'csv'

class Main

  def initialize
    @login = Login.new
    @admin = Admin.new
    @doctor = Doctor.new
    @filename = "../csv/user.csv"
    @log_in_attempts = 0
  end

  attr_accessor :id , :password, :privilege

  def ask_user_for_id
    puts "ID: "
    @id = gets.chomp
  end

  def ask_user_for_password
    puts "password: "
    @password = gets.chomp
  end

  def setPrivilege
    @privilege = @login.validate(@filename, @id, @password)
  end

  def perform_user_login

    id = ask_user_for_id
    password = ask_user_for_password
    setPrivilege()
    @log_in_attempts += 1

    if not(@privilege==nil) then
      puts @login.user_login(@privilege)

      if(@privilege == "a") then
        puts @admin.display_admin_options()
        option = gets.chomp
        @admin.select_user_to_add(option)
      elsif (@privilege == "d") then
         @doctor.display_doctor_data(@id)
         @doctor.display_doctor_options()
         option = gets.chomp
         @doctor.modify_details(option)

      elsif (@privilege == "r") then

      end

    else
      if (@log_in_attempts < 3) then

        puts "Error: Wrong ID or password !"
        puts "Please try again..."
        puts "----------------------------"
        perform_user_login()

      else
        puts "\n"
        puts "\n"
        puts "Sorry, check if your username and password are correct \n"
        puts "Try again later, application will exit..."

      end
    end
  end

end

main = Main.new()
main.perform_user_login()