require 'csv'

class Doctor
def addDoctor(id, firstName, lastName, address, phoneNumber, specialization, idNumber, password)
  file = CSV.open("../csv/doctor.csv", "a+")
  file << [id, firstName, lastName, address, phoneNumber, specialization, idNumber, password]
end

end
