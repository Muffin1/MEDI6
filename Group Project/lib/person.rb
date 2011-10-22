require 'csv'
class Person

  attr_accessor :firstName, :lastName, :address, :dateOfBirth, :phoneNumber, :email, :idNumber

  def initialize()

  end

  def idGenerator()

    if File.exists?('../lib/id_file.txt')
      file = File.open('../lib/id_file.txt','r')
      file.each {|line|
        @id = line.to_i
      }
      @id += 1
      file.close

      file = File.open('../lib/id_file.txt','w+')
      file.write(@id)
      file.close
    else
      file = File.open('../lib/id_file.txt','w+')
      @id = 5000
      file.write(@id)
      file.close
    end
    return @id

  end


  def setPrivileges(uniqueId,password,privileges)
    file = File.open("../csv/user.csv", "a+")

    CSV::Writer.generate(file) do |csv|
      csv << [uniqueId,password, privileges]
    end

    file.close
  end

  def searchByID(personID, file)
    csv_contents = CSV.read(file)
    boolean = false
    csv_contents.each do |row|
      if(row[0] == personID.to_s)
        boolean = true
        return row
      end
    end
    if not(boolean)
      return nil
    end
  end

  def searchByName(file,firstName=nil,lastName=nil)
    csv_contents = CSV.read(file)
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
    else
      return nil
    end
  end

end

