require 'csv'

class Doctor
def addDoctor(id, name, surname, address, phoneNumber, specialization, idNumber, password)
  file = CSV.open("../csv/doctor.csv", "w")
  file << [id, name, surname, address, phoneNumber, specialization, idNumber, password]
end

end