# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "foo@gmail.com"
    password "MagicPassword"
    after(:create){|user|
      community = create(:community)
      user.communities << community
      user.save
    }

    factory :user_with_post, class: User do
      after(:create){|user|
        post = create(:post, community: user.communities.first, author: user)
      }
    end

    factory :community_creator, class: User do
      after(:create){|creator|
        community = create(:community)
        creator.communities << community
        creator.save
        creator.add_role :creator, community
      }
    end
  end
end
