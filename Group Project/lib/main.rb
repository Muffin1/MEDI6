require 'user_account.rb'

class Main

  attr_accessor :id , :password

  def getUserIDPassword
    puts "ID: "
    @id = gets.chomp
    puts "Password: "
    @password = gets.chomp
  end

  def loadMenuforUser(userType)
    if userType == "a" then
      puts 'Welcome admin'

    elsif userType == "d" then
      puts 'Welcome doctor'

    elsif userType == "r" then
      puts 'Welcome receptionist'

    else puts 'Error! wrong input'

    end
  end

  # Test the user input (concerning ID and password))
  main = Main.new()
  main.getUserIDPassword


  userLogin  = LogIn.new

  privilege = userLogin.validate("../csv/user.csv",main.id,main.password)

  main.loadMenuforUser(privilege)



end