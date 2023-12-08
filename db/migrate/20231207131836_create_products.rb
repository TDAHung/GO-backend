class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :image, null: false
      t.string :name, null:false
      t.string :description, null:false
      t.float :price, null: false
      t.string :color

      t.timestamps
    end
  end
end
