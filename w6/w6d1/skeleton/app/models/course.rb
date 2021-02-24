# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    belongs_to :courses
        foreign_key: :prereq_id
        class: :Course

    belongs_to :instructors,
        foreign_key: :instructor_id,
        class: :User
    
            

end
