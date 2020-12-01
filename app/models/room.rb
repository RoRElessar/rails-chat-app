class Room < ApplicationRecord
  has_many :room_messages, dependent: :destroy

  validates :name, presence: true

  def to_param
    "#{id}-#{name}".parameterize
  end
end
