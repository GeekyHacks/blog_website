class ModifyLikes < ActiveRecord::Migration[7.1]
  def change
    remove_column :likes, :user_id
    remove_column :likes, :post_id
  end
end
