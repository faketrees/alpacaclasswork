# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  course_id  :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Enrollment < ApplicationRecord\
    belongs_to :courses,
        primary_key: :id,
        foreign_key: :course_id
        class: :Course

    belongs_to :enrollments,
        foreign_key: :student_id,
        class: :User

end
