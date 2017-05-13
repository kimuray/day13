module Confirmable
  extend ActiveSupport::Concern

  included do
    validates_acceptance_of :confirming, allow_nil: false

    after_validation :check_confirming
  end

  private

  def check_confirming
    errors.delete(:confirming)
    self.confirming = errors.empty? ? '1' : ''
  end
end
