class Student < ApplicationRecord
  validates_presence_of :name
  has_many :student_courses
  has_many :courses, through: :student_courses

  def grade_in(course)
    (StudentCourse.find_by(student_id: id, course_id: course.id)).grade
  end
end
