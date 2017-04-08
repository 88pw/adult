class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title , null: false
      t.text :description
      t.integer :actress_id , null: false , index: true
      t.string :thumbnail_url
      t.float :review_score
      t.string :service_url , null: false
      t.integer :service_id
      t.string :ad_url
      t.integer :series_id
      t.integer :director_id
      t.integer :label_id
      t.integer :maker_id

      t.timestamps
    end
  end
end
