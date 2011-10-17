require 'csv'

class Receptionist
def addReceptionist(id, name, surname, address, phoneNumber, idNumber, password)
  file = CSV.open("../csv/receptionist.csv", "w")
  file << [id, name, surname, address, phoneNumber, idNumber, password]
end

end