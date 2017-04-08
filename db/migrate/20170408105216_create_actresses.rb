class CreateActresses < ActiveRecord::Migration[5.0]
  def change
    create_table :actresses do |t|
      t.string :name , null: false
      t.string :initial
      t.integer :bust
      t.integer :waist
      t.integer :hip
      t.integer :height
      t.date :birth
      t.string :blood_type
      t.string :ruby
      t.string :birth_place
      t.string :image_lg
      t.string :image_sm
      t.string :dmm_id
      t.integer :sex , null: false , default: 0

      t.timestamps
    end
  end
end
