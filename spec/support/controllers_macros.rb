module ControllerMacros
  # def login_admin
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:admin]
  #     sign_in FactoryGirl.create(:admin) # Using factory girl as an example
  #   end
  # end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @current_user = FactoryGirl.create(:user)
      controller.stub(:current_community) { @current_user.communities.first }
      @current_community = @current_user.communities.first
      # user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      @current_ability ||= Ability.new(@current_user, @current_community)
      sign_in @current_user
    end
  end

  def login_creator
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @current_user = FactoryGirl.create(:community_creator)
      controller.stub(:current_community) { @current_user.communities.first }
      @current_community = @current_user.communities.first
      @current_user.add_role(:creator, @current_community)
      # @current_community = @current_user.communities.joins(:roles).where("roles.name = 'creator'").first
      # user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      @current_ability ||= Ability.new(@current_user, @current_community)
      sign_in @current_user
    end
  end
end
