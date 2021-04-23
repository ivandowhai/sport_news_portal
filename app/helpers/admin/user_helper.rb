module Admin::UserHelper
  def self.generate_password
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    password = ""
    16.times { password << chars.sample }
    password
  end
end
