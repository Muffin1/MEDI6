require 'csv'

class Users


  def addUser(id, name, surname, privileges)
    file = CSV.open("../csv/user.csv", "w")
    file << [id, name, surname, privileges]
  end
end