require 'user_account.rb'

class Main

  def initialize(input, output)
    @input = input
    @output = output
  end

  attr_accessor :id , :password

  def get_user_id_password
    ask_user_for_id
    ask_user_for_password
    #puts "ID: "
    #@id = STDIN.gets.chomp
    #puts "Password: "
    #@password = STDIN.gets.chomp
  end

  def ask_user_for_id
    @output.puts "ID: "
    @id = @input.gets.chomp
    @output.puts @id
  end


  def ask_user_for_password

  end

  def load_menu_for_user(user_type)
    if user_type == 1 then
      puts 'Welcome admin'

    elsif user_type == 2 then
      puts 'Welcome doctor'

    elsif user_type == 3 then

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
  #main.get_user_id_password
  #
  #puts main.id
  #puts main.password

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
  end

end