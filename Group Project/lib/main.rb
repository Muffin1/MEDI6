require 'user_account.rb'

class Main

  def initialize(input, output)
    @input = input
    @output = output

    login = LogIn.new()

  end

  attr_accessor :id , :password

  def ask_user_for_id
    @output.puts "ID: "
    @id = @input.gets.chomp
    @output.puts @id
  end

  def ask_user_for_password
    @output.puts "password: "
    @password = @input.gets.chomp
    @output.puts @password
  end




end