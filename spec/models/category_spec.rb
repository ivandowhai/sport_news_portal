require "rails_helper"

RSpec.describe Category, type: :model do
  describe "associations" do
    it { should have_many(:categories).class_name(Category) }
    it { should have_many(:articles).class_name(Article) }
    it { should belong_to(:category).class_name(Category).optional }
  end

  describe "validations" do
    it { should validate_numericality_of(:priority) }
  end
end
