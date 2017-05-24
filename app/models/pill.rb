class Pill < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :reminder, :user_id
end
