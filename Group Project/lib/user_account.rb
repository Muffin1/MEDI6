#create a user account class
#require 'doctor.rb'
#require 'receptionist.rb'
#require 'admin.rb'
class LogIn

  def initialize(doctor, receptionist,admin)
    @doctor = doctor
    @receptionist = receptionist# Receptionist.new
    @admin = admin# Admin.new
  end

  #check if the user is a valid user
  def validate(user_name, password)
        if(user_name == @doctor.userName && password == @doctor.password) then
           return "doctor"
        elsif(user_name == @receptionist.userName && password == @receptionist.password) then
           return "receptionist"
        elsif(user_name == @admin.userName && password == @admin.password) then
           return "admin"
        else return nil

        end

  end

end