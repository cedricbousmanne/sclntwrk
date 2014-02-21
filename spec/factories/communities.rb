# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :community do
    sequence :name do |n|
      "My community ##{n}"
    end

    sequence :domain do |n|
      "example#{n}.com"
    end
  end
end
