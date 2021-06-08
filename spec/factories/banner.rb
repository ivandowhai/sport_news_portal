FactoryBot.define do
  factory :banner do
    name { Faker::Lorem.word }
    category { association :category }
    status { 0 }
    image { Rack::Test::UploadedFile.new("spec/image_for_tests.jpg", "image/png") }
  end
end
