class SpendingFormComponent < ViewComponent::Base
  def initialize(spending:)
    @spending = spending
  end
end
