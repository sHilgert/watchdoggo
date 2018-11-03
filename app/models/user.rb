class User < ApplicationRecord
  validates :username, :external_id, presence: true
  has_many :messages
  has_and_belongs_to_many :sites
end
