require_relative '../../db/config'

class Congressman < ActiveRecord::Base

  attr_accessor :name


  def name
    "#{firstname}" + " " +"#{lastname}"
  end

  # def self.listrep
  # # Order.select("date(created_at) as ordered_date, sum(price) as total_price").
  # # group("date(created_at)").having("sum(price) > ?", 100)
  #   Congressmen.select(@fullname).group('state').having("title?","Rep")
  # end
end






#   def self.where(query, *args)
#     Database::Model.execute("SELECT * FROM #{self.to_s.downcase}s WHERE #{query}", *args).map do |row|
#       self.new(row)
#       end
#   end
# end


# Politician.where('party = ?', 'D')
  # class Student < ActiveRecord::Base

#   validates :email, format: { with: /\w+@\w+\.\w{2,}/, message: "Valid email address only"}
#   validates :email, uniqueness: true
#   validates :age, numericality: {greater_than_or_equal_to: 5}
#   validates :phone, format:{ with: /(\d[^\d]*){10,}/,message:"Valid phone number only"}# class Student < ActiveRecord::Base

#   validates :email, format: { with: /\w+@\w+\.\w{2,}/, message: "Valid email address only"}
#   validates :email, uniqueness: true
#   validates :age, numericality: {greater_than_or_equal_to: 5}
#   validates :phone, format:{ with: /(\d[^\d]*){10,}/,message:"Valid phone number only"}require_relative '../db/config'


