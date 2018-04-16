class Setting < ApplicationRecord
  validates :auto_text, presence: true
  belongs_to :admin
end
