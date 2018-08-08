class Topic < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  validates :title, length: {minimum: 5}, presence: true
end
