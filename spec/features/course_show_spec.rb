require 'rails_helper'

RSpec.describe "As a user" do
  describe 'When I visit a course show page' do
    before(:each) do
      @student_1 = Student.create(name: "Ryan")
      @student_2 = Student.create(name: "Bob G")
      @course_1 = Course.create(name: "Calculus")
      @course_2 = Course.create(name: "Chemistry")
      StudentCourse.create(student_id: @student_1.id, course_id: @course_1.id, grade: 91.75)
      StudentCourse.create(student_id: @student_1.id, course_id: @course_2.id, grade: 87.05)
      StudentCourse.create(student_id: @student_2.id, course_id: @course_1.id, grade: 92.15)
    end

    it "I see the course name" do
      visit "/courses/#{@course_1.id}"

      expect(page).to have_content(@course_1.name)
      expect(page).to_not have_content(@course_2.name)
    end

    it "I see each student in the course, ordered from highest to lowest grade" do
      visit "/courses/#{@course_1.id}"

      expect(page).to have_content(@student_1.name)
      expect(page).to have_content(@student_2.name)

      page.body.index(@student_1.name).should > page.body.index(@student_2.name)
      save_and_open_page
    end
  end
end
