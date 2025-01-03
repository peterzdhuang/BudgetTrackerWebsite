class NavbarComponent < ViewComponent::Base
  def initialize(current_user:)
    @current_user = nil
  end
end
