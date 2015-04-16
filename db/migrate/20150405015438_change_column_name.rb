class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :friendships, :user_id, :follower_id
    rename_column :friendships, :friend_id, :followed_id
  end

end

