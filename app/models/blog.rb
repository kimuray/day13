class Blog < ApplicationRecord
  validates :title, presence: true
  validates_acceptance_of :confirming, allow_nil: false

  after_validation :check_confirming

  private

  def check_confirming
    errors.delete(:confirming)
    self.confirming = errors.empty? ? '1' : ''
  end
end
