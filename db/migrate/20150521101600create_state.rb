require_relative '../db/config'

class States < ActiveRecord::Migration

  def change
    create_table :states do |state|
      state.string :name



  end

end


# class CreateStudents < ActiveRecord::Migration
#   def change
#     create_table :students do |student|
#       student.string :first_name
#       student.string :last_name
#       student.string :gender
#       student.string :email
#       student.string :phone
#       student.date :birthday
#       student.datetime :created_at
#       student.datetime :updated_at
#     end
#   end
# end