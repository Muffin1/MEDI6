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
  def validate(id, password)
        if(id == @doctor.id && password == @doctor.password) then
           return "doctor"
        elsif(id == @receptionist.id && password == @receptionist.password) then
           return "receptionist"
        elsif(id == @admin.id && password == @admin.password) then
           return "admin"
        else return nil

        end
  end


def val(file,userName=nil,password=nil)
   csv_contents = CSV.read(file)
   csv_contents.each do |row|
    if(row[0] == personID.to_s)
      return row
    end
   end
end

end