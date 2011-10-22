require 'user_account.rb'

class Main

  attr_accessor :id , :password

  def get_user_ID_Password
    puts "ID: "
    @id = gets.chomp
    puts "Password: "
    @password = gets.chomp
  end

  def user_login(user_type)
    if user_type == "a" then
      puts 'Welcome admin'

    elsif user_type == "d" then
      puts 'Welcome doctor'

    elsif user_type == "r" then
      puts 'Welcome receptionist'

    else puts 'Error! wrong input'

    end
  end

  # Test the user input (concerning ID and password))
  #main = Main.new()
  #main.get_user_ID_Password
  #
  #
  #userLogin  = Login.new
  #
  #privilege = userLogin.validate("../csv/user.csv",main.id,main.password)
  #
  #main.user_login(privilege)



end