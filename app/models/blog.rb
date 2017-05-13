class Blog < ApplicationRecord
  include Confirmable

  validates :title, presence: true
end
