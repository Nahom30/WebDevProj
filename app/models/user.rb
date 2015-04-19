class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :friendships, foreign_key: "follower_id", dependent: :destroy
  has_many :posts, dependent: :destroy

  has_many :active_friendships,
           :class_name => "Friendship",
           foreign_key: "follower_id",
           dependent:   :destroy
  has_many :passive_friendships,
           :class_name => "Friendship",
           foreign_key: "followed_id",
           dependent:   :destroy
  has_many :following, through: :active_friendships, source: :followed
  has_many :followers, through: :passive_friendships,source: :follower

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



end
