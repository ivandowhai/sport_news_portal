require "rails_helper"

RSpec.describe PageCategory, type: :model do
  describe "associations" do
    it { should have_many(:pages).class_name(Page) }
  end
end
