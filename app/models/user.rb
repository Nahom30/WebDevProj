class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :friendships, foreign_key: "follower_id", dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :active_friendships,  :through => :friendships,
           foreign_key: "follower_id",
           dependent:   :destroy
  has_many :passive_friendships, :through => :friendships,
           foreign_key: "followed_id",
           dependent:   :destroy
  has_many :follower, through: :active_friendships
  has_many :followed, through: :passive_friendships

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



end
