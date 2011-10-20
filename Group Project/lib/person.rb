require 'csv'
class Person

  attr_accessor :firstName, :lastName, :address, :dateOfBirth, :phoneNumber, :email, :idNumber

  def initialize()


  end


  def searchByID(personID)
   csv_contents = CSV.read("../csv/patient.csv")
   csv_contents.each do |row|
    if(row[0] == personID.to_s)
      return row
    end
   end
    return nil
   end



def searchByName(firstName=nil,lastName=nil)
  csv_contents = CSV.read("../csv/patient.csv")
  person = []
    $count=0
    csv_contents.each do |row|
      if((row[2] == firstName) or (row[3] == lastName))
        person[$count]= CSV.generate_line(row)
      end
      $count+=1
    end
  if(person.length>0)
      return  person
  return nil
end
end
end