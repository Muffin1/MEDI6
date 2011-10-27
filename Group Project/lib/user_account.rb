#create a user account class
require 'doctor'
require 'receptionist'
require 'admin'
require "csv"
require "md5"
class Login

  def initialize()
  end

  #check if the user is a valid user
  def validate(file,id, password)
    csv_contents = CSV.read(file)
    encrypted_password = MD5.hexdigest(password)
    csv_contents.each do |row|
      if(row[0] == id.to_s && row[1] == encrypted_password.to_s)

        return row[2].to_s
      end
    end

    return nil
  end

  def user_login(user_type)
    if user_type == "a" then
      return 'Welcome admin!'

    elsif user_type == "d" then
      return 'Welcome doctor!'

    elsif user_type == "r" then

      return 'Welcome receptionist!'

    else return nil

    end
  end

end

