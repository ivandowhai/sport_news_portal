require "rails_helper"

RSpec.describe User, type: :model do
  context "Is user has admin role" do
    it "returns false when user does not have admin role" do
      user = User.new
      user.role = User::ROLE_USER
      expect(user.admin?).to be false
    end
    it "returns true when user does not have admin role" do
      user = User.new
      user.role = User::ROLE_ADMIN
      expect(user.admin?).to be true
    end
  end
end
