FactoryBot.define do
  factory :team do
    category { association :category }
    subcategory { association :category }
    team { Faker::Team::name }
    location { Faker::Team::state }
    logo { Rack::Test::UploadedFile.new('spec/image_for_tests.jpg', 'image/png') }
  end
end
