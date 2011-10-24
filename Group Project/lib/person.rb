require 'csv'
class Person

  attr_accessor :first_name, :last_name, :address, :date_of_birth, :phone_number, :email, :id_number, :password


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
<<<<<<< HEAD


=======
>>>>>>> 00ba7247ca0f25e0f8ed6df28f3e574f59a6a270
end
