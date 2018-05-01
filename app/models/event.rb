class Event < ApplicationRecord
  belongs_to :lead
  default_scope { order(created_at: :desc)}
end
