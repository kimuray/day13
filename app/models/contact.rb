class Contact < ApplicationRecord
  include Confirmable

  validates :name,  presence: true
  validates :email, presence: true
  validates :content, presence: true
end
