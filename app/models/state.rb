require_relative '../../db/config'

# class State < ActiveRecord::Base

#   validates :name, uniqueness: true

#   has_many :congressman

#   def state

#   end

# end


# require_relative '../../db/config'

# class Student < ActiveRecord::Base

#   validates :email, format: { with: /\w+@\w+\.\w{2,}/, message: "Valid email address only"}
#   validates :email, uniqueness: true
#   validates :age, numericality: {greater_than_or_equal_to: 5}
#   validates :phone, format:{ with: /(\d[^\d]*){10,}/,message:"Valid phone number only"}

#   has_many :teachers, through: :students_teachers
#   has_many :students_teachers

#   # validates :valid_phone?

#   # def valid_phone?
#   #     if self.phone.scan(/\d+/).join.length < 10
#   #         errors.add(:phone, "must contain at least 10 digits, excluding non-numeric characters")
#   #     end
#   # end

# # implement your Student model here
#   def name
#     self.first_name + " " + self.last_name
#   end

#   def age
#     now = Date.today
#     age = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
#   end

# end