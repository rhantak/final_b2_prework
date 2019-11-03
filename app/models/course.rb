class Course < ApplicationRecord
  validates_presence_of :name
  has_many :student_courses
  has_many :students, through: :student_courses

  def students_by_grade
    students.order('student_courses.grade DESC')
  end
end
