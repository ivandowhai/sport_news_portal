require "rails_helper"

RSpec.describe Article, type: :model do
  describe "associations" do
    it { should belong_to(:category).class_name(Category) }
  end
end
