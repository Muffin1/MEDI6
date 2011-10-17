#create a user account class
class LogIn

  def initialize(doctor, receptionist, admin)
    @doctor = doctor
    @receptionist = receptionist
    @admin = admin
  end

  #check user
  def check_user(id)
    if(id == @doctor.id) then
      return "doctor"
    elsif(id == @receptionist.id)then
      return "receptionist"
    elsif(id == @admin.id) then
      return "admin"
    end
  end
  #check if the user is a valid user
  def validate(user_name, password, id)
    if(check_user(id) == "doctor") then
        if(user_name == @doctor.user_name && password == @doctor.password) then
           return @doctor
        else return nil
        end
      elsif(check_user(id) == "receptionist") then
        if(user_name == @receptionist.user_name && password == @receptionist.password) then
           return @receptionist
        else return nil
        end
      elsif(check_user(id) == "admin") then
        if(user_name == @admin.user_name && password == @admin.password) then
           return @admin
        else return nil
        end
    end

  end

end