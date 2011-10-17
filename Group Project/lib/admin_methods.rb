require 'csv'

class Admin

  def addUser(surname, privileges)
    file = CSV.open("../csv/user.csv", "w")
    file << [id, name, surname, privileges]
  end
end