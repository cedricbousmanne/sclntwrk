# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :asset, :class => 'Assets' do
    publication_id 1
    file_uid "MyString"
  end
end
