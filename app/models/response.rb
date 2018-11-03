class Response < ApplicationRecord
  validates :http_code, presence: true
  belongs_to :site
end
