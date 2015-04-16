class Post < ActiveRecord::Base

  belongs_to :user # :foreign_key => :user_id
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :message, presence: true, length: { maximum: 1000 }
end
