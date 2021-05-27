require "rails_helper"

RSpec.describe User, type: :model do
  context "Is user has admin role" do
    it "Not admin" do
      user = User.new
      user.role = User::ROLE_USER
      expect(false).to be user.admin?
    end
    it "Is admin" do
      user = User.new
      user.role = User::ROLE_ADMIN
      expect(true).to be user.admin?
    end
  end
end
