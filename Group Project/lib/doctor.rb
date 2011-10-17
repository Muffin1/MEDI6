require 'person.rb'

class Doctor < Person
  attr_accessor :speciality
  attr_accessor :user_name
  attr_accessor :password
  def initialize(user_name,password,id)
      @user_name = user_name
    @password =password
    @id = id
  end
  # To change this template use File | Settings | File Templates.
end