require 'csv'

class Users
  def file

  end

  def addUser(id, name, surname, privileges)
    file = CSV.open("../csv/user.csv", "w")
    file << [id, name, surname, privileges]
  end
end