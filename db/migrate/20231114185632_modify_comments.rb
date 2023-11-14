class ModifyComments < ActiveRecord::Migration[7.1]
  def change
    remove_column :comments, :user_id
    remove_column :comments, :post_id
  end
end
