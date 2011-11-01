require 'user_account.rb'
require 'admin.rb'
require "doctor.rb"
require "receptionist.rb"
require 'csv'

class Main

  def initialize
    @login = Login.new
    @admin = Admin.new
    @doctor = Doctor.new
    @receptionist = Receptionist.new
    @filename = "../csv/user.csv"
    @log_in_attempts = 0
  end

  attr_accessor :id , :password, :privilege

  def ask_user_for_id
    puts "User ID: "
    @id = gets.chomp
  end

  def ask_user_for_password
    puts "Password: "
    @password = gets.chomp
  end

  def show_initial_login_messages
    puts "\n"
    puts "**************************** "
    puts "********** MEDI6 *********** "
    puts "**************************** "
    puts "\n"
    puts "Please provide your details.."
    puts "\n"

  end

  def perform_user_login

    while(true)

      id = ask_user_for_id
      password = ask_user_for_password
      @privilege = @login.validate(@filename, @id, @password)
      @log_in_attempts += 1

      if not(@privilege==nil) then
        puts @login.user_login(@privilege)

        if(@privilege == "a") then
          puts @admin.display_admin_options()
          option = gets.chomp

          if (not(option=="1") and not(option=="2"))
            puts "\n"
            puts"logging out.."
            break

          else
            @admin.select_user_to_add(option)
            puts "\n"
            puts"logging out.."

            break
          end

        elsif (@privilege == "d") then
          @doctor.display_doctor_data(@id)
          @doctor.display_doctor_options()
          option = gets.chomp

          if (not((option=="m") or (option=="M")) and not((option=="p")  or (option=="P")))
            puts "\n"
            puts"logging out.."
            break

          else @doctor.select_options(option,@id)
          puts "\n"
          puts"logging out.."
          break
          end
        elsif (@privilege == "r") then
          @receptionist.display_receptionist_data(@id)

          while(true)
            @receptionist.display_receptionist_options()
            option = gets.chomp
            if (not((option=="m") or (option=="M")) and not((option=="a")  or (option=="A")) and not((option=="e")  or (option=="E")))
              puts "\n"
              puts"logging out.."
              break

            else
              if not(@receptionist.select_options(option,@id))
                puts "\n"
                puts"logging out.."
                break
              end
            end
          end
          break
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

end

while (true)
  main = Main.new()
  main.show_initial_login_messages()
  main.perform_user_login()
end

