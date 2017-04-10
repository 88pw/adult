class RemoveActressIdFromPost < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :actress_id, :integer
  end
end
