FactoryGirl.define do
  factory :website do
    name FFaker::Lorem.word
    url FFaker::Internet.http_url
    company
  end
end
