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
    if userType == 1 then
      puts 'Welcome admin'

    elsif userType == 2 then
      puts 'Welcome doctor'

    elsif userType == 3 then
      puts 'Welcome receptionist'

     else puts 'Error! wrong input'

    end
  end

  # Test the user input (concerning ID and password))
  #main = Main.new()
  #main.getUserIDPassword
  #
  #puts main.id
  #puts main.password

end