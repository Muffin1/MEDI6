require 'csv'
class Person

  attr_accessor :first_name, :last_name, :address, :date_of_birth, :phone_number, :email, :id_number

  def initialize()

  end

  def id_generator()

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


  def set_privileges(unique_id,password,privileges)
    file = File.open("../csv/user.csv", "a+")

    CSV::Writer.generate(file) do |csv|
    csv << [unique_id,password, privileges]
    end

  file.close
  end

  def search_by_id(person_id, file)
   csv_contents = CSV.read(file)
   csv_contents.each do |row|
    if(row[0] == person_id.to_s)
      return row
    end
   end
    return nil
   end



  def search_by_name(file,first_name=nil,last_name=nil)

      csv_contents = CSV.read(file)
      person = []
      $count=0
      csv_contents.each do |row|
        if((row[2] == first_name) or (row[3] == last_name))
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

