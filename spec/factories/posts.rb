FactoryBot.define do
    factory :post do
        create(:author)
        title Faker::Witcher.witcher
        content Faker::String.random([30])
        author
    end
end