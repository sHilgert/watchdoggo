class Site < ApplicationRecord
  validates :url, presence: true
  has_and_belongs_to_many :users
  has_many :responses

  scope :enabled, -> { where(enabled: true) }
  scope :disabled, -> { where(enabled: false) }

  def enable!
    self.enabled = true
    save!
  end

  def disable!
    self.enabled = false
    save!
  end
end
