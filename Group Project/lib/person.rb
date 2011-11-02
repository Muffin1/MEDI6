require 'csv'
require 'md5'
class Person

  attr_accessor :system_id,:first_name, :last_name, :address, :date_of_birth, :phone_number, :email, :id_number, :password


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

  def search_by_id(person_id, filename)
    csv_contents = CSV.read(filename)
    boolean = false
    csv_contents.each do |row|
      if(row[0] == person_id.to_s)
        boolean = true
        return row
      end
    end
    if not(boolean)
      return nil
    end
  end

  def change_password(user_id, new_password)

    csv_contents = CSV.read("../csv/user.csv")
    file = File.open("../csv/user.csv", "w+")
    encrypted_password  = MD5.hexdigest(new_password)

    csv_contents.each do |row|
    if (row[0]==user_id.to_s)

        CSV::Writer.generate(file) do |csv|
            csv <<  [user_id,encrypted_password,row[2]]
        end
    else
         CSV::Writer.generate(file) do |csv|
           csv << row
         end
       end
    end

    file.close
    encrypted_password
  end


  end
