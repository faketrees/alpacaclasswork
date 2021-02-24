# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    has_many :enrollments,
        foreign_key: :course_id,
        class: :Enrollment

    has_many :courses,
        foreign_key: :instructor_id,
        class: :Course
    
    
end
