require "csv"

class LogIn


  #check if the user is a valid user
  def validate(file,id, password)
   csv_contents = CSV.read(file)

   csv_contents.each do |row|
    if(row[0] == id.to_s && row[1] == password.to_s)
      return row[2].to_s
    end
   end

    return nil
  end



end

