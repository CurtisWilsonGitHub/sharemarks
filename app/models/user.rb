class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :topics
  has_many :bookmarks
  has_many :likes, dependent: :destroy

  def liked(bookmark,user)
    bookmark.likes.where(user_id: user.id).first
  end
end
