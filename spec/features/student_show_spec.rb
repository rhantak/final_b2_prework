require 'rails_helper'

RSpec.describe "As a user" do
  describe "When I visit a student show page" do
    before(:each) do
      @student_1 = Student.create(name: "Ryan")
      @student_2 = Student.create(name: "Bob G")
      @course_1 = Course.create(name: "Calculus")
      @course_2 = Course.create(name: "Chemistry")
      @course_3 = Course.create(name: "Computer Science")
      StudentCourse.create(student_id: @student_1.id, course_id: @course_1.id, grade: 93)
      StudentCourse.create(student_id: @student_1.id, course_id: @course_2.id, grade: 87)
      StudentCourse.create(student_id: @student_2.id, course_id: @course_1.id, grade: 92)
      StudentCourse.create(student_id: @student_2.id, course_id: @course_3.id, grade: 95)
    end

    it "I see the students name, all their courses, and their grades" do
      visit "/students/#{@student_1.id}"

      expect(page).to have_content(@student_1.name)
      expect(page).to have_content(@course_1.name)
      expect(page).to have_content(@course_2.name)
      expect(page).to have_content("Grade: 93")
      expect(page).to have_content("Grade: 87")

      expect(page).to_not have_content(@student_2.name)
      expect(page).to_not have_content(@course_3.name)
      expect(page).to_not have_content("Grade: 92")
      expect(page).to_not have_content("Grade: 95")
    end
  end
end
