# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :asset, :class => 'Asset' do
    publication_id 1
    file { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'assets', 'urquart.jpg'), 'image/jpg') }
  end
end
