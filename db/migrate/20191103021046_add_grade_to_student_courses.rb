class AddGradeToStudentCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :student_courses, :grade, :float
  end
end
