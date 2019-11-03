class StudentCourse < ApplicationRecord
  validates_presence_of :grade
  belongs_to :student
  belongs_to :course
end
