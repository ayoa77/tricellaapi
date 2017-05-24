class Pill < ApplicationRecord
  belongs_to :user
  has_many :alerts

  validates_presence_of :name, :reminder, :user_id
end
