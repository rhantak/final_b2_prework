require 'rails_helper'

describe StudentCourse, type: :model do
  describe 'validations' do
    it { should validate_presence_of :grade}
  end

  describe 'relationships' do
    it { should belong_to :student }
    it { should belong_to :course }
  end
end
